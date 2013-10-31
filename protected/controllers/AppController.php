<?php 
  class AppController extends Controller{

    public function filters()
    {
        return array(
            'rights', // perform access control for CRUD operations
 
        );
    }
    public function actionTicketingBooth(){
      $this->layout='tktBooth';
      $this->render('ticketingBooth');
    }
    public function actionPassengerTicket($vid=null,$bn=null){
      $selected_voyage='';
      $tickets='';
      $voyages=Voyage::model()->findAll(array('condition'=>'departure_date>CURDATE() - INTERVAL 3 HOUR AND voyage_status_id < 3'));
      $fname=Yii::app()->db->createCommand("SELECT first_name FROM passenger WHERE first_name !='' GROUP BY first_name")->queryColumn();
      if($vid)
        $_SESSION['vid']=$vid;
      $vid=isset($_SESSION['vid'])?$_SESSION['vid']:'';
      if($vid){
        $selected_voyage=Voyage::model()->findByPk($vid);
        $ptypes=CHtml::listData(PassengerType::model()->findAll(array('condition'=>'active=1')),'id','name');
        $classes=CHtml::listData(SeatingClass::model()->findAll(array('order'=>'id DESC','condition'=>'active=1')),'id','name');
      }     
      $this->layout='blank';
      $passenger=new Passenger;
      $ptype=new PassengerType;
      $class=new SeatingClass;
      $seats_per_class=array();
      if(isset($selected_voyage->id)){
        $sql = "SELECT seating_class sc, count(*) available_seat,
                IFNULL((SELECT COUNT(*) FROM ticket WHERE seating_class_id =sc AND status_id < 6 AND voyage_id='{$selected_voyage->id}' GROUP BY seating_class),0) used 
                FROM seat WHERE active=1 GROUP BY seating_class";
        $seats = Yii::app()->db->createCommand($sql)->queryAll();
        foreach($seats as $s){
          $seats_per_class[$s['sc']]=array($s['available_seat'],$s['used']);
        }
      }
      if(isset($_POST['Passenger'])){
        if(!isset($selected_voyage->id))
          $this->redirect(array('app/passengerTicket'));
        $class->attributes=$_POST['SeatingClass'];
        if( $seats_per_class[$class->id][1]+count($_POST['PassengerType']['id']) > $seats_per_class[$class->id][0]){
          Yii::app()->user->setFlash('error', '<center>'.Yii::t('app','notice.failed.ticket.emptySeat').'<center>');
          $this->redirect(array('app/passengerTicket'));
        }
        $sl=$this->getAvailableSeats($class->id,$selected_voyage->id);
        $booking_no = numberGenerator(1);
        $fares=CHtml::listData(PassengerFare::model()->findAll(array('condition'=>"class={$class->id} AND route={$selected_voyage->route_id}")),'type','price');
        foreach($_POST['PassengerType']['id'] as $k=>$v){
          $passenger=new Passenger;
          $passenger->first_name=$_POST['Passenger']['first_name'][$k];
          $passenger->last_name=$_POST['Passenger']['last_name'][$k];
          $passenger->age=$_POST['Passenger']['age'][$k];
          $passenger->save();
          $ticket_no = numberGenerator(2);
          $ticket= new Ticket;
          $ticket->passenger_id=$passenger->id;
          $ticket->voyage_id=$selected_voyage->id;
          $ticket->booking_no=$booking_no;
          $ticket->ticket_no=$ticket_no;
          $ticket->ticket_type_id=2;
          $ticket->seating_class_id=$class->id;
          $ticket->seat_id=$sl[$k];
          $ticket->passenger_type_id=$v;
          $ticket->price_paid=$fares[$v];
          $ticket->created_by=Yii::app()->user->id;
          $ticket->save();
          $selected_voyage->available_seats -=1;
          $selected_voyage->save();
          @$total_amt+=$fares[$v];
        }
        Yii::app()->user->setFlash('success', '<center>'.Yii::t('app','notice.success.ticket.create').$total_amt.'<center>');
        $this->redirect(array('app/passengerTicket','bn'=>$booking_no));
      }
      $this->render('passengerTicket',compact('vid','passenger','selected_voyage','voyages','tickets','ptype','ptypes','classes','class','fname','bn','seats_per_class'));
    }
    public function actionPrint($type=null,$bn=null,$id=null,$options=null){
      $result=array();
      if($type='tkt'){
        if($bn)
          $result=Ticket::model()->findAllByAttributes(array('booking_no'=>$bn));
        if($id)
          array_push($result,Ticket::model()->findByPk($id));
        $this->renderPartial('tkt_print',compact('result'));
      }
    }
    public function actionCheckin($tns=null,$print=null){
      $ticket=new Ticket;
      if(isset($_GET['Ticket']) || $print){
        $pass = isset($_SESSION['checklist']) ? $_SESSION['checklist'] : Array();
        $add = isset($_GET['Ticket']['ticket_no']) ? $_GET['Ticket']['ticket_no'] : "";
        array_push($pass,$add);
        $_SESSION['checklist'] = $pass;
        $tns = implode("','",$pass);
        $pass = Ticket::model()->findAll(array('condition'=>"ticket_no IN ('$tns') AND status_id < 6"));
      }else{
        $pass = Array();
        unset($_SESSION['checklist']);
      }
      if($print){
        Ticket::model()->updateAll(array('status_id'=>4),"ticket_no IN ('{$tns}')");
        $this->renderPartial('checkin',compact('pass','tns','print'));
      }else{
        $this->render('checkin',compact('pass','tns','ticket'));
      }
    }
    public function actionAdvCheckin($tns=null,$print=null){
      $ticket=new Ticket;
      if(isset($_GET['Ticket'])){
        $pass = isset($_SESSION['checklist']) ? $_SESSION['checklist'] : Array();
        $add = isset($_GET['Ticket']['ticket_no']) ? $_GET['Ticket']['ticket_no'] : "";
        $vid = isset($_GET['Ticket']['voyage_id']) ? $_GET['Ticket']['voyage_id'] : "";
        $advance_tkt = AdvanceTicket::model()->findByAttributes(array('tkt_no'=>$add,'status'=>1));
        if($advance_tkt && $vid)
          array_push($pass,$add);
        $_SESSION['checklist'] = $pass;
        $tns = implode("','",$pass);
        $pass = Ticket::model()->findAll(array('condition'=>"ticket_no IN ('$tns') AND status_id  < 6"));
      }else{
        $pass = Array();
        unset($_SESSION['checklist']);
      }
      if($print){
        Ticket::model()->updateAll(array('status_id'=>4),"ticket_no IN ('{$tns}')");
        $this->renderPartial('checkin',compact('pass','tns','print'));
      }else{
        $this->render('advCheckin',compact('pass','tns','ticket'));
      }
    }
    public function actionTickets(){
      $ticket=new Ticket('search');
      $ticket->unsetAttributes();  // clear any default values
      if(isset($_GET['Ticket']))
        $ticket->attributes=$_GET['Ticket'];
      $this->render('ticket',compact('ticket'));
    }
    public function actionWaybills(){
      $waybill=new Waybill('search');
      $waybill->unsetAttributes();  // clear any default values
      if(isset($_GET['Waybill']))
        $waybill->attributes=$_GET['Waybill'];
      $this->render('waybill',compact('waybill'));
    }
    public function actionTicketRefund($id){
      $tkt = Ticket::model()->findByPk($id);
      if($tkt->status_id<6){
        $voy=Voyage::model()->findByPk($tkt->voyage_id);
        $voy->available_seats+=1;
        $voy->save();
      }
      $tkt->status_id=6;
      $tkt->seat_id=NULL;
      $tkt->save(false);
      return true;
    }
    public function actionTicketCancel($id){
      $tkt = Ticket::model()->findByPk($id);
      if($tkt->status_id<6){
        $voy=Voyage::model()->findByPk($tkt->voyage_id);
        $voy->available_seats+=1;
        $voy->save();
      }
      $tkt->status_id=7;
      $tkt->seat_id=NULL;
      $tkt->save(false);
      return true;
    }
    public function actionTicketStats(){
      $vid=isset($_SESSION['vid'])?$_SESSION['vid']:'';
      $tkts = Ticket::model()->findAll(array('condition'=>"voyage_id = '{$vid}' AND status_id<6",'order'=>'id DESC'));
      $this->renderPartial('tkt_stats',compact('tkts'));
    }
    public function actionEditableSaver($mName){
      Yii::import('bootstrap.widgets.TbEditableSaver');
      $es = new TbEditableSaver($mName);
      $es->update();
    }
    function getAvailableSeats($class,$vid){
      $sql = "SELECT id,name FROM seat WHERE id NOT IN  (SELECT seat_id FROM ticket WHERE voyage_id='{$vid}' AND status_id < 6 AND seating_class_id='{$class}') AND active=1
              AND seating_class='$class' ORDER BY name+1,name
             ";
      $seat_list=array();
      $seats = Yii::app()->db->createCommand($sql)->queryAll();
      foreach($seats as $s){
        array_push($seat_list,$s['id']);
      }
      
      return $seat_list;
    }
  }
?>
