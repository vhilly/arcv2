<?php 
  class AdminController extends Controller{

    public function filters()
    {
        return array(
            'rights', // perform access control for CRUD operations
 
        );
    }

   //vessel
    public function actionVessel(){
      $vessel=new Vessel('search');
      $vessel->unsetAttributes();  // clear any default values
      if(isset($_GET['Vessel']))
        $vessel->attributes=$_GET['Vessel'];
      $this->render('vessel',compact('vessel'));
    }
    public function actionVesselAdd(){
      $model=new Vessel();
      if(isset($_POST['Vessel'])){
        $model->attributes=$_POST['Vessel'];
        try{
          if($model->save()){
            $this->setSysVars();
            Yii::app()->user->setFlash('success', Yii::t('app','notice.success.vessel.create'));
            $this->redirect(array('admin/vessel'));
          }
        }catch (Exception $e){
          Yii::app()->user->setFlash('error', Yii::t('app','notice.failed.vessel.create'));
        }
      }
      $this->render('add',compact('model'));
    }

    public function actionVesselUpdate($id){
      $model=Vessel::model()->findByPk($id);
      if(isset($_POST['Vessel'])){
        $model->attributes=$_POST['Vessel'];
        try{
          if($model->save()){
            Yii::app()->user->setFlash('success', Yii::t('app','notice.success.vessel.update'));
            $this->redirect(array('admin/vessel'));
          }
        }catch (Exception $e){
          Yii::app()->user->setFlash('error', Yii::t('app','notice.failed.vessel.update'));
        }
      }
      $this->render('update',compact('model'));
    }

    //port
    public function actionPort(){
      $port=new Port('search');
      $port->unsetAttributes();  // clear any default values
      if(isset($_GET['Port']))
        $port->attributes=$_GET['Port'];
      $this->render('port',compact('port'));
    }
    public function actionPortAdd(){
      $model=new Port();
      if(isset($_POST['Port'])){
        $model->attributes=$_POST['Port'];
        try{
          if($model->save()){
            $this->setSysVars();
            Yii::app()->user->setFlash('success', Yii::t('app','notice.success.port.create'));
            $this->redirect(array('admin/port'));
          }
        }catch (Exception $e){
          Yii::app()->user->setFlash('error', Yii::t('app','notice.failed.port.create'));
        }
      }
      $this->render('add',compact('model'));
    }
    public function actionPortUpdate($id){
      $model=Port::model()->findByPk($id);
      if(isset($_POST['Port'])){
        $model->attributes=$_POST['Port'];
        try{
          if($model->save()){
            Yii::app()->user->setFlash('success', Yii::t('app','notice.success.port.update'));
            $this->redirect(array('admin/port'));
          }
        }catch (Exception $e){
          Yii::app()->user->setFlash('error', Yii::t('app','notice.failed.port.update'));
        }
      }
      $this->render('update',compact('model'));
    }
    //route
    public function actionRoute(){
      $sysVars = $this->sysVars();
      $error=array();
      $route=new Route('search');
      $route->unsetAttributes();  // clear any default values
      if(isset($_GET['Route'])){
        $route->attributes=$_GET['Route'];
      }else{
        if(!$sysVars['hasPort'])
          $error[]=CHtml::link(Yii::t('app','inst.req.port'),array('admin/port'),array('target'=>'_blank'));
        if(count($error))
          Yii::app()->user->setFlash('error', '<center><b>'.Yii::t('app','inst.req.following').'</b><br>'.implode('<br>',$error).'<center>');
      }
      $this->render('route',compact('route'));
    }
    public function actionRouteAdd(){
      $sysVars = $this->sysVars();
      $model=new Route();
      if(isset($_POST['Route'])){
        $model->attributes=$_POST['Route'];
        try{
          if($model->save()){
            $this->setSysVars();
            Yii::app()->user->setFlash('success', Yii::t('app','notice.success.route.create'));
            $this->redirect(array('admin/route'));
          }
        }catch (Exception $e){
          Yii::app()->user->setFlash('error', Yii::t('app','notice.failed.route.create'));
        }
      }
      $this->render('add',compact('model'));
    }
    public function actionRouteUpdate($id){
      $model=Route::model()->findByPk($id);
      if(isset($_POST['Route'])){
        $model->attributes=$_POST['Route'];
        try{
          if($model->save()){
            Yii::app()->user->setFlash('success', Yii::t('app','notice.success.route.update'));
            $this->redirect(array('admin/route'));
          }
        }catch (Exception $e){
          Yii::app()->user->setFlash('error', Yii::t('app','notice.failed.route.update'));
        }
      }
      $this->render('update',compact('model'));
    }
    //seating class
    public function actionSeatingClass(){
      $sc=new SeatingClass('search');
      $sc->unsetAttributes();  // clear any default values
      if(isset($_GET['SeatingClass']))
        $sc->attributes=$_GET['SeatingClass'];
      $this->render('seatingclass',compact('sc'));
    }
    public function actionSeatingClassAdd(){
      $model=new SeatingClass();
      if(isset($_POST['SeatingClass'])){
        $model->attributes=$_POST['SeatingClass'];
        try{
          if($model->save()){
            $this->setSysVars();
            Yii::app()->user->setFlash('success', Yii::t('app','notice.success.seatingclass.create'));
            $this->redirect(array('admin/seatingclass'));
          }
        }catch (Exception $e){
          Yii::app()->user->setFlash('error', Yii::t('app','notice.failed.seatingclass.create'));
        }
      }
      $this->render('add',compact('model'));
    }
    public function actionSeatingClassUpdate($id){
      $model=SeatingClass::model()->findByPk($id);
      if(isset($_POST['SeatingClass'])){
        $model->attributes=$_POST['SeatingClass'];
        try{
          if($model->save()){
            Yii::app()->user->setFlash('success', Yii::t('app','notice.success.seatingclass.update'));
            $this->redirect(array('admin/seatingclass'));
          }
        }catch (Exception $e){
          Yii::app()->user->setFlash('error', Yii::t('app','notice.failed.seatingclass.update'));
        }
      }
      $this->render('update',compact('model'));
    }
	//seat
    public function actionSeat(){
	  $model=new Seat;
          if(isset($_POST['Seat']))
          {
            if(!empty($_POST['Seat']['id'])){
	      $model=Seat::model()->findByPk($_POST['Seat']['id']);
	    }
            $model->attributes=$_POST['Seat'];
	    if(isset($_POST['remove']))
	    {
	      $model->active = 0;
	      $notif = "Seat No. {$model->name} is now remove.";
	    }
	    else
	    {
	      $notif = "Seat No. {$model->name} is now available.";
	    }
            if($model->save()){
              $this->setSysVars();
              Yii::app()->user->setFlash('success', $notif);
              $this->redirect(array('admin/seat'));
            }
          }
          $list= Seat::model()->findAll(array('condition'=>"active = 1"));
          $class= SeatingClass::model()->findAll(array('condition'=>"active = 1"));
          $this->render('seat',compact('model','list','class'));
    }
    //passenger type
    public function actionPassengerType(){
      $pt=new PassengerType('search');
      $pt->unsetAttributes();  // clear any default values
      if(isset($_GET['PassengerType']))
        $pt->attributes=$_GET['PassengerType'];
      $this->render('passengertype',compact('pt'));
    }
    public function actionPassengerTypeAdd(){
      $model=new PassengerType();
      if(isset($_POST['PassengerType'])){
        $model->attributes=$_POST['PassengerType'];
        try{
          if($model->save()){
            $this->setSysVars();
            Yii::app()->user->setFlash('success', Yii::t('app','notice.success.passengertype.create'));
            $this->redirect(array('admin/passengertype'));
          }
        }catch (Exception $e){
          Yii::app()->user->setFlash('error', Yii::t('app','notice.failed.passengertype.create'));
        }
      }
      $this->render('add',compact('model'));
    }
    public function actionPassengerTypeUpdate($id){
      $model=PassengerType::model()->findByPk($id);
      if(isset($_POST['PassengerType'])){
        $model->attributes=$_POST['PassengerType'];
        try{
          if($model->save()){
            Yii::app()->user->setFlash('success', Yii::t('app','notice.success.passengertype.update'));
            $this->redirect(array('admin/passengertype'));
          }
        }catch (Exception $e){
          Yii::app()->user->setFlash('error', Yii::t('app','notice.failed.passengertype.update'));
        }
      }
      $this->render('update',compact('model'));
    }
    public function actionPassengerFare($rid=null){
      $sysVars = $this->sysVars();
      $error=array();
      $route = $rid ? Route::model()->findByPk($rid) : '';
      if(isset($_POST['PassengerFare'])){
        foreach($_POST['PassengerFare'] as $r){
          $rates = new PassengerFare;
          $rates->attributes = $r;
          if($rates->id)
            $rates->isNewRecord = false;
          $rates->save();
        }
          Yii::app()->user->setFlash('success', Yii::t('app','notice.success.passengerFare.update'));
      }
      $sc = SeatingClass::model()->findAll(array('condition'=>'active=1'));
      $ft = PassengerType::model()->findAll(array('condition'=>'active=1'));
      if(!$sysVars['hasSeatingClass'])
        $error[]=CHtml::link(Yii::t('app','inst.req.seatingClass'),array('admin/seatingClass'),array('target'=>'_blank'));
      if(!$sysVars['hasPassengerType'])
        $error[]=CHtml::link(Yii::t('app','inst.req.passengerType'),array('admin/passengerType'),array('target'=>'_blank'));
      if(!$route){
        if(!$sysVars['hasRoute'])
          $error[]=CHtml::link(Yii::t('app','inst.req.route'),array('admin/route'),array('target'=>'_blank'));
      }
      if(count($error))
        Yii::app()->user->setFlash('error', '<center><b>'.Yii::t('app','inst.req.following').'</b><br>'.implode('<br>',$error).'<center>');
      $this->render('fares',compact('sc','ft','rid','route','dataProvider'));
    }
    public function actionCargoRate($rid=null){
      $sysVars = $this->sysVars();
      $error=array();
      $route = $rid ? Route::model()->findByPk($rid) : '';
      if(isset($_POST['CargoFareRates'])){
        foreach($_POST['CargoFareRates'] as $r){
          $rates = new CargoFareRates;
          $rates->attributes = $r;
          if($rates->id)
            $rates->isNewRecord = false;
          $rates->save();
        }
          Yii::app()->user->setFlash('success', Yii::t('app','notice.success.cargoRate.update'));
      }
      $cc = CargoClass::model()->findAll(array('condition'=>'active=1'));
      if(!$sysVars['hasCargoClass'])
        $error[]=CHtml::link(Yii::t('app','inst.req.cargoClass'),array('admin/seatingClass'),array('target'=>'_blank'));
      if(!$route){
        if(!$sysVars['hasRoute'])
          $error[]=CHtml::link(Yii::t('app','inst.req.route'),array('admin/route'),array('target'=>'_blank'));
      }
      if(count($error))
        Yii::app()->user->setFlash('error', '<center><b>'.Yii::t('app','inst.req.following').'</b><br>'.implode('<br>',$error).'<center>');
      $this->render('rates',compact('cc','rid','route','dataProvider'));
    }
    //voyage
    public function actionVoyage(){
      $sysVars = $this->sysVars();
      $error=array();
      $voyage=new Voyage('search');
      $voyage->unsetAttributes();  // clear any default values
      if(isset($_GET['Voyage'])){
        $voyage->attributes=$_GET['Voyage'];
      }else{
        if(!$sysVars['hasRoute'])
          $error[]=CHtml::link(Yii::t('app','inst.req.route'),array('admin/route'),array('target'=>'_blank'));
        if(!$sysVars['hasVessel'])
          $error[]=CHtml::link(Yii::t('app','inst.req.vessel'),array('admin/vessel'),array('target'=>'_blank'));
        if(count($error))
          Yii::app()->user->setFlash('error', '<center><b>'.Yii::t('app','inst.req.following').'</b><br>'.implode('<br>',$error).'<center>');
      }
      $this->render('voyage',compact('voyage'));
    }
    public function actionVoyageAdd(){
      $model=new Voyage();
      if(isset($_POST['Voyage'])){
        $dt = $_POST['Voyage']['departure_time'];
        $da = $_POST['Voyage']['arrival_time'];
        $_POST['Voyage']['departure_time'] = date('H:i:s',strtotime($dt));
        $_POST['Voyage']['arrival_time'] = date('H:i:s',strtotime($da));
        $model->attributes=$_POST['Voyage'];
        $capacity=Vessel::model()->findByPk($model->vessel)->capacity;
        $model->capacity=$capacity;
        $model->available_seats=$capacity;
        try{
          if($model->save()){
            Yii::app()->user->setFlash('success', Yii::t('app','notice.success.voyage.create'));
            $this->redirect(array('admin/voyage'));
          }
        }catch (Exception $e){
          Yii::app()->user->setFlash('error', Yii::t('app','notice.failed.seatingclass.voyage'));
        }
      }
      $model->departure_time=date('g:i A',strtotime($model->departure_time));
      $model->arrival_time=date('g:i A',strtotime($model->arrival_time));
      $this->render('add',compact('model'));
    }
    public function actionVoyageUpdate($id){
      $model=Voyage::model()->findByPk($id);
      if(isset($_POST['Voyage'])){
        $dt = $_POST['Voyage']['departure_time'];
        $da = $_POST['Voyage']['arrival_time'];
        $_POST['Voyage']['departure_time'] = date('H:i:s',strtotime($dt));
        $_POST['Voyage']['arrival_time'] = date('H:i:s',strtotime($da));
        $model->attributes=$_POST['Voyage'];
        try{
          if($model->save()){
            Yii::app()->user->setFlash('success', Yii::t('app','notice.success.voyage.update'));
            $this->redirect(array('admin/voyage'));
          }
        }catch (Exception $e){
          Yii::app()->user->setFlash('error', Yii::t('app','notice.failed.voyage.update'));
        }
      }
      $model->departure_time=date('g:i A',strtotime($model->departure_time));
      $model->arrival_time=date('g:i A',strtotime($model->arrival_time));
      $this->render('update',compact('model'));
    }
    public function actionCargoClass(){
      $cc=new CargoClass('search');
      $cc->unsetAttributes();  // clear any default values
      if(isset($_GET['CargoClass']))
        $cc->attributes=$_GET['CargoClass'];
      $this->render('cargoclass',compact('cc'));
    }
    public function actionCargoClassUpdate($id){
      $model=CargoClass::model()->findByPk($id);
      if(isset($_POST['CargoClass'])){
        $model->attributes=$_POST['CargoClass'];
        if($model->save()){
          Yii::app()->user->setFlash('success', Yii::t('app','notice.success.cargoclass.update'));
          $this->redirect(array('admin/cargoclass'));
        }
      }
      $this->render('update',compact('model'));
    }
    public function actionCargoClassAdd(){
      $model=new CargoClass();
      if(isset($_POST['CargoClass'])){
        $model->attributes=$_POST['CargoClass'];
        if($model->save()){
          $this->setSysVars();
          Yii::app()->user->setFlash('success', Yii::t('app','notice.success.cargoclass.create'));
          $this->redirect(array('admin/cargoclass'));
        }
      }
      $this->render('add',compact('model'));
    }
    public function actionVoyageStatus($id){
      $model=Voyage::model()->findByPk($id);
      if(isset($_POST['Voyage'])){
        $model->attributes=$_POST['Voyage'];
        if($model->save()){
          unset($_SESSION['vid']);
          if($model->status != 1){
            Ticket::model()->updateAll(array( 'status' => 5, 'seat' => new CDbExpression('NULL')), "status< 3 AND voyage= {$model->id}" );
            Waybill::model()->updateAll(array( 'status' => 5, 'stowage' => new CDbExpression('NULL')), "status< 3 AND voyage= {$model->id}" );
          }
          Yii::app()->user->setFlash('success', Yii::t('app','notice.success.voyage.statusUpdate'));
          $this->redirect(array('admin/voyage'));
        }
      }
      $this->render('_vstatusForm',array('model'=>$model));
    }
    public function actionCheckedAll($id){
      $model=Voyage::model()->findByPk($id);
      Ticket::model()->updateAll(array( 'status' => 4), "status< 4 AND voyage= {$model->id}" );
      Yii::app()->user->setFlash('success', 'All reserved tickets mark as boarded');
      $this->redirect(array('admin/voyage'));
    }
    //baggagetype
    public function actionBaggageType(){
      $bt=new BaggageType('search');
      $bt->unsetAttributes();  // clear any default values
      if(isset($_GET['BaggageType']))
        $bt->attributes=$_GET['BaggageType'];
      $this->render('baggagetype',compact('bt'));
    }
    public function actionBaggageTypeUpdate($id){
      $model=BaggageType::model()->findByPk($id);
      if(isset($_POST['BaggageType'])){
        $model->attributes=$_POST['BaggageType'];
        if($model->save()){
          Yii::app()->user->setFlash('success', Yii::t('app','notice.success.baggagetype.update'));
          $this->redirect(array('admin/baggagetype'));
        }
      }
      $this->render('update',compact('model'));
    }
    public function actionBaggageTypeAdd(){
      $model=new BaggageType();
      if(isset($_POST['BaggageType'])){
        $model->attributes=$_POST['BaggageType'];
        if($model->save()){
          $this->setSysVars();
          Yii::app()->user->setFlash('success', Yii::t('app','notice.success.baggagetype.create'));
          $this->redirect(array('admin/baggagetype'));
        }
      }
      $this->render('add',compact('model'));
    }
}
?>

