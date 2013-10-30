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
      $voyages=Voyage::model()->findAll(array('condition'=>'departure_date=CURDATE() AND voyage_status_id=1'));
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
      if(isset($_POST['Passenger'])){
        if(!isset($selected_voyage->id))
          $this->redirect(array('app/passengerTicket'));
        if(count($_POST['PassengerType']['id']) > $selected_voyage->available_seats){
          Yii::app()->user->setFlash('error', '<center>'.Yii::t('app','notice.failed.ticket.emptySeat').'<center>');
          $this->redirect(array('app/passengerTicket'));
        }
        $class->attributes=$_POST['SeatingClass'];
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
      $this->render('passengerTicket',compact('vid','passenger','selected_voyage','voyages','tickets','ptype','ptypes','classes','class','fname','bn'));
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
      if(isset($_GET['Ticket'])){
        $pass = isset($_SESSION['checklist']) ? $_SESSION['checklist'] : Array();
        $add = isset($_GET['Ticket']['ticket_no']) ? $_GET['Ticket']['ticket_no'] : "";
        array_push($pass,$add);
        $_SESSION['checklist'] = $pass;
        $tns = implode("','",$pass);
      }else{
        $pass = Array();
        unset($_SESSION['checklist']);
      }

      if(isset($_GET['Ticket']) || $print){
        $pass = Ticket::model()->findAll(array('condition'=>"ticket_no IN ('$tns') AND status_id < 6"));
      }
      if($print){
        Ticket::model()->updateAll(array('status_id'=>4),"ticket_no IN ('{$tns}')");
        $this->renderPartial('checkin',compact('pass','tns','print'));
      }else{
        $this->render('checkin',compact('pass','tns','ticket'));
      }
    }
    public function actionTickets(){
      $ticket=new Ticket('search');
      $ticket->unsetAttributes();  // clear any default values
      if(isset($_GET['Ticket']))
        $ticket->attributes=$_GET['Ticket'];
      $this->render('ticket',compact('ticket'));
    }
    public function actionTicketRefund($id){
      Ticket::model()->updateByPk($id,array('status_id'=>6));
      return true;
    }
    public function actionTicketCancel($id){
      Ticket::model()->updateByPk($id,array('status_id'=>7));
      return true;
    }
    public function actionTicketStats(){
      $vid=isset($_SESSION['vid'])?$_SESSION['vid']:'';
      $tkts = Ticket::model()->findAll(array('condition'=>"voyage_id = '{$vid}'",'order'=>'id DESC'));
      $this->renderPartial('tkt_stats',compact('tkts'));
    }
    public function actionEditableSaver($mName){
      Yii::import('bootstrap.widgets.TbEditableSaver');
      $es = new TbEditableSaver($mName);
      $es->update();
    }
  }
?>
