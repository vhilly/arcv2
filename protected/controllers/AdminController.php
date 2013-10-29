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
            Yii::app()->user->setFlash('success', Yii::t('app','notice.success.vessel.update'));
            $this->redirect(array('admin/port'));
          }
        }catch (Exception $e){
          Yii::app()->user->setFlash('error', Yii::t('app','notice.failed.vessel.update'));
        }
      }
      $this->render('update',compact('model'));
    }
    //route
    public function actionRoute(){
      $route=new Route('search');
      $route->unsetAttributes();  // clear any default values
      if(isset($_GET['Route']))
        $route->attributes=$_GET['Route'];
      $this->render('route',compact('route'));
    }
    public function actionRouteAdd(){
      $model=new Route();
      if(isset($_POST['Route'])){
        $model->attributes=$_POST['Route'];
        try{
          if($model->save()){
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
      $this->render('fares',array('sc'=>$sc,'ft'=>$ft,'rid'=>$rid,'route'=>$route));
    }
    //voyage
    public function actionVoyage(){
      $voyage=new Voyage('search');
      $voyage->unsetAttributes();  // clear any default values
      if(isset($_GET['Voyage']))
        $voyage->attributes=$_GET['Voyage'];
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
        $capacity=Vessel::model()->findByPk($model->vessel_id)->capacity;
        $model->capacity=$capacity;
        $model->available_seats=$capacity;
        try{
          if($model->save()){
            Yii::app()->user->setFlash('success', Yii::t('app','notice.success.voyage.create'));
            $this->redirect(array('admin/voyage'));
          }
          print_r($model->getErrors());
          die();
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
  }
?>

