<?php 
  class AppController extends Controller{

    public function filters()
    {
        return array(
            'rights', // perform access control for CRUD operations
 
        );
    }
    public function actionSeatView(){
      $model=new Ticket;
      $model->voyage= 1;
      $this->render('seatView',compact('model'));
    }
    public function actionSeatAll($voyage=NULL){
      $model = new Seat;
      $bookedSeats = Ticket::model()->findAll(array('condition'=>"voyage= {$voyage} AND seat IS NOT NULL"));
      $list= Seat::model()->findAll(array('condition'=>"active = 1"));
      $class= SeatingClass::model()->findAll(array('condition'=>'active=1'));
      $this->render('seatMap',compact('model','list','class','bookedSeats'));
    }
    public function actionTicketingBooth(){
      $error=array();
      if(!$this->sysVars()['hasSeat'])
        $error[]=CHtml::link(Yii::t('app','inst.req.seat'),array('admin/seat'),array('target'=>'_blank'));
      if(count($error))
        Yii::app()->user->setFlash('error', '<center><b>'.Yii::t('app','inst.req.following').'</b><br>'.implode('<br>',$error).'<center>');
      $this->layout='tktBooth';
      $this->render('ticketingBooth',compact('error'));
    }
    public function actionPassengerTicket($vid=null,$bn=null){
      $sn = Counter::model()->findByPk(4)->value;
      $selected_voyage='';
      $tickets='';
      $voyages=Voyage::model()->findAll(array('condition'=>'departure_date>CURDATE() - INTERVAL 3 HOUR AND status != 10'));
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
        $error=array();
        $sql = "SELECT seating_class sc, count(*) available_seat,
                IFNULL((SELECT COUNT(*) FROM ticket WHERE seating_class=sc AND status< 6 AND voyage='{$selected_voyage->id}' GROUP BY seating_class),0) used 
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
        $fares=CHtml::listData(PassengerFare::model()->findAll(array('condition'=>"class={$class->id} AND route={$selected_voyage->route}")),'type','price');
        foreach($_POST['PassengerType']['id'] as $k=>$v){
          $passenger=new Passenger;
          $passenger->first_name=$_POST['Passenger']['first_name'][$k];
          $passenger->last_name=$_POST['Passenger']['last_name'][$k];
          $passenger->age=$_POST['Passenger']['age'][$k];
          $passenger->save();
          $ticket= new Ticket;
          $ticket->passenger=$passenger->id;
          $ticket->voyage=$selected_voyage->id;
          $ticket->booking_no=$booking_no;
          $ticket->ticket_no= numberGenerator(2);
          $ticket->series_no= numberGenerator(4,0)-1;
          $ticket->ticket_type=2;
          $ticket->seating_class=$class->id;
          $ticket->seat=$sl[$k];
          $ticket->passenger_type=$v;
          $ticket->price_paid=isset($fares[$v])?$fares[$v]:0;
          $ticket->created_by=Yii::app()->user->id;
          $ticket->save();
          $selected_voyage->available_seats -=1;
          $selected_voyage->save();
          @$total_amt+=$fares[$v];
        }
        Yii::app()->user->setFlash('success', '<center>'.Yii::t('app','notice.success.ticket.create').$total_amt.'<center>');
        $this->redirect(array('app/passengerTicket','bn'=>$booking_no));
      }
      $this->render('passengerTicket',compact('vid','passenger','selected_voyage','voyages','tickets','ptype','ptypes','classes','class','fname','bn',
      'seats_per_class','sn'));
    }
    public function actionRollingCargo(){
      $wb=new Waybill;
      $cargo=new Cargo;
      $error=0;
      if(isset($_POST['Waybill'])){
        $wb->attributes=$_POST['Waybill'];
        $cargo->attributes=$_POST['Cargo'];
        if(!$cargo->validate())
          $error=1;
        if(!$wb->validate(array('voyage','series_no','cargo_class','price_paid')))
          $error=1;
        if(!$error){
          $cargo->save();
          $wb->cargo=$cargo->id;
          $wb->status=4;
          $wb->waybill_type=2;
          $wb->created_by=Yii::app()->user->id;
          $wb->booking_no = numberGenerator(1);
          $wb->lading_no = numberGenerator(3);
          $wb->save();
          Yii::app()->user->setFlash('success', '<center>TOTAL: P'.$wb->price_paid.'<center>');
          $this->redirect(array('app/rollingcargo'));
        }
      }
      $this->render('rollingcargo',compact('wb','cargo'));
    }
    public function actionPrint($type=null,$bn=null,$id=null,$options=null){
      $result=array();
      if($type=='tkt'){
        if($bn)
          $result=Ticket::model()->findAllByAttributes(array('booking_no'=>$bn));
        if($id)
          array_push($result,Ticket::model()->findByPk($id));
        $this->renderPartial('tkt_print',compact('result'));
      }
      if($type=='wbill'){
        if($bn)
          $result=Waybill::model()->findAllByAttributes(array('booking_no'=>$bn));
        if($id)
          array_push($result,Waybill::model()->findByPk($id));
        $this->renderPartial('wbill_print',compact('result'));
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
        $pass = Ticket::model()->findAll(array('condition'=>"ticket_no IN ('$tns') AND status< 6"));
      }else{
        $pass = Array();
        unset($_SESSION['checklist']);
      }
      if($print){
        Ticket::model()->updateAll(array('status'=>4),"ticket_no IN ('{$tns}')");
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
        $vid = isset($_GET['Ticket']['voyage']) ? $_GET['Ticket']['voyage'] : "";
        $advance_tkt = AdvanceTicket::model()->findByAttributes(array('tkt_no'=>$add,'status'=>1));
        $exst = Ticket::model()->findByAttributes(array('ticket_no'=>$add));
        if($exst)
          Yii::app()->user->setFlash('error', '<center>'.Yii::t('app','notice.failed.ticket.used').'<center>');
        if($advance_tkt && $vid && !$exst){
          $seats_per_class=array();
          if($vid){
            $error=array();
            $sql = "SELECT seating_class sc, count(*) available_seat,
                    IFNULL((SELECT COUNT(*) FROM ticket WHERE seating_class=sc AND status< 6 AND voyage='{$vid}' GROUP BY seating_class),0) used 
                    FROM seat WHERE active=1 GROUP BY seating_class";
            $seats = Yii::app()->db->createCommand($sql)->queryAll();
          
            foreach($seats as $s){
              $seats_per_class[$s['sc']]=array($s['available_seat'],$s['used']);
            }
            if( $seats_per_class[$advance_tkt->class][1] > $seats_per_class[$advance_tkt->class][0]){
              Yii::app()->user->setFlash('error', '<center>'.Yii::t('app','notice.failed.ticket.emptySeat').'<center>');
            }
            $sl=$this->getAvailableSeats($advance_tkt->class,$vid);
            if(count($sl)){
              $passenger=new Passenger;
              $passenger->save();
              $ticket= new Ticket;
              $ticket->passenger=$passenger->id;
              $ticket->voyage=$vid;
              $ticket->booking_no=numberGenerator(1);
              $ticket->ticket_no=$advance_tkt->tkt_no;
              $ticket->series_no= $advance_tkt->tkt_series;
              $ticket->ticket_type=1;
              $ticket->seating_class=$advance_tkt->class;
              $ticket->seat=$sl[0];
              $ticket->passenger_type=$advance_tkt->type;
              $ticket->price_paid=$advance_tkt->amt;
              $ticket->created_by=Yii::app()->user->id;
              if(!$ticket->save())
                throw new Exception('Cannot save Booking');
              $advance_tkt->status = 2;
              $advance_tkt->is_sync = 'N';
              $advance_tkt->date_used = date('Y-m-d');
              $advance_tkt->isNewRecord = false;
              $advance_tkt->validate();
              if(!$advance_tkt->save())
                throw new Exception('Cannot update advance ticket');
            }
          }
          array_push($pass,$add);
        }
        $_SESSION['checklist'] = $pass;
        $tns = implode("','",$pass);
        $pass = Ticket::model()->findAll(array('condition'=>"ticket_no IN ('$tns') AND status< 6"));
      }else{
        $pass = Array();
        unset($_SESSION['checklist']);
      }
      if($print){
        Ticket::model()->updateAll(array('status'=>4),"ticket_no IN ('{$tns}')");
        $this->renderPartial('checkin',compact('pass','tns','print'));
      }else{
        $this->render('advCheckin',compact('pass','tns','ticket'));
      }
    }
    //seat Map
    public function actionSeatMap($id,$voyage=NULL){
      $model = new Seat;
      $bookedSeats = Ticket::model()->findAll(array('condition'=>"voyage= {$voyage} AND seating_class={$id} AND seat IS NOT NULL"));
      $list= Seat::model()->findAll(array('condition'=>"active = 1 AND seating_class={$id}"));
      $class= SeatingClass::model()->findByPk($id);
      $this->render('seatMap',compact('model','list','class','bookedSeats'));
    }
	//seat transfer
    public function actionTransferForm($id){
      $model=Ticket::model()->findByPk($id);
	  $ticket = array_unique($_SESSION['checklist']);
      if(isset($_POST['Ticket'])){
        $model->attributes = $_POST['Ticket'];
        $model->status=1;
		$toUrl = 'Ticket[ticket_no]='.implode('&Ticket[ticket_no]=',$ticket);
		//echo $toUrl;die();
        if($model->save()){
          Yii::app()->user->setFlash('success', "Seat Transfer Successful!");
          $this->redirect(array('app/checkin&'.$toUrl));
        }else{
		  Yii::app()->user->setFlash('error', 'Booking Transfer Failed!');
		}
       }
       $this->render('transferForm',array('model'=>$model,'ticket'=>$ticket));
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
      if($tkt->status<6){
        $voy=Voyage::model()->findByPk($tkt->voyage);
        $voy->available_seats+=1;
        $voy->save();
      }
      $tkt->status=6;
      $tkt->seat=NULL;
      $tkt->save(false);
      return true;
    }
    public function actionTicketCancel($id){
      $tkt = Ticket::model()->findByPk($id);
      if($tkt->status<6){
        $voy=Voyage::model()->findByPk($tkt->voyage);
        $voy->available_seats+=1;
        $voy->save();
      }
      $tkt->status=7;
      $tkt->seat=NULL;
      $tkt->save(false);
      return true;
    }
    public function actionWaybillRefund($id){
      Waybill::model()->updateByPk($id,array('status'=>6));
      return true;
    }
    public function actionWaybillCancel($id){
      Waybill::model()->updateByPk($id,array('status'=>7));
      return true;
    }
    public function actionTicketStats(){
      $this->layout='blank2';
      $vid=isset($_SESSION['vid'])?$_SESSION['vid']:'';
      $tkts = Ticket::model()->findAll(array('condition'=>"voyage= '{$vid}' AND status<6",'order'=>'id DESC'));
      $this->render('tkt_stats',compact('tkts'));
    }
    public function actionEditableSaver($mName){
      Yii::import('bootstrap.widgets.TbEditableSaver');
      $es = new TbEditableSaver($mName);
      $es->update();
    }
    function getAvailableSeats($class,$vid){
      $sql = "SELECT id,name FROM seat WHERE id NOT IN  (SELECT seat FROM ticket WHERE voyage='{$vid}' AND status< 6 AND seating_class='{$class}') AND active=1
              AND seating_class='$class' ORDER BY name+1,name
             ";
      $seat_list=array();
      $seats = Yii::app()->db->createCommand($sql)->queryAll();
      foreach($seats as $s){
        array_push($seat_list,$s['id']);
      }
      
      return $seat_list;
    }
    public function actionManifest($vid){
      $mnfst=Ticket::model()->findAll(array('condition'=>"voyage='$vid' AND  status< 6"));
      $this->renderPartial('manifest',compact('mnfst'));
    }
    public function actionSeriesNumber(){
       $value=isset($_POST['value']) ? $_POST['value'] :'';
       $series = Counter::model()->findByPk(4);
       $old = $series->value;
       $series->value=$value;
       $error;
       if($series->save()){
         $value = $series->value;
       }else{
         $value = $old;
         $error=1;
       }
       echo json_encode(compact('value','error'));
    }
    public function actionGetCargoRates($rid){
      $rates=CargoFareRates::model()->findAll();
      $rlist=array();
      if($rates){
        echo "<table class='table-striped table-hover span5'><tr><th></th><th>Regular Rate</th><th>Discounted Rate</th></tr>";
        foreach($rates as $r){
        echo "<tr><td>{$r->class0->name}</td><td><a href=# class='regularrate' data-op={$r->regular_rate} data-cclass={$r->class} data-dismiss=modal>{$r->regular_rate}</a>
        </td><td><a href=# class='discountedrate' data-op={$r->regular_rate} data-dc={$r->discount} data-cclass={$r->class}  data-dr={$r->discounted_rate}  data-dismiss=modal>{$r->discounted_rate}</a></td></tr>";
        }
        echo "</table>";
      }
      Yii::app()->end();
    }
   public function actionUpgrade(){
     $model=new Upgrades;
     if(isset($_POST['Upgrades'])){
       $model->attributes=$_POST['Upgrades'];
       $from=PassengerFare::model()->findByAttributes(array('type'=>$model->from_fare,'class'=>2));
       $to=PassengerFare::model()->findByAttributes(array('type'=>$model->from_fare,'class'=>1));
       $model->from_fare=$from->id;
       $model->to_fare=$to->id;
       $model->amt=$to->price-$from->price;
       if($model->save()){
         Yii::app()->user->setFlash('success', 'Seat Upgrade Payment has been recorded!');
         $this->redirect(array('upgrades'));
       }
     }

     $this->render('upgrade',array(
       'model'=>$model,
     ));
  }
  public function actionUpgradeDelete($id){
    Upgrades::model()->findByPk($id)->delete();
  }
  public function actionUpgrades(){
    $model=new Upgrades('search');
    $model->unsetAttributes();  // clear any default values
    if(isset($_GET['Upgrades']))
      $model->attributes=$_GET['Upgrades'];
    $this->render('upgrades',array(
      'model'=>$model,
    ));
  }
  }
?>
