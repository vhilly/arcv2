
<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'vessel-form',
	'enableAjaxValidation'=>false,
        
)); ?>

<?php $active=array(1=>'Yes',0=>'No');?>
<p class="help-block">Fields with <span class="required">*</span> are required.</p>
<?php $mName=get_class($model);?>
<?php if($mName=='Vessel'):?>
  <?php echo $form->textFieldRow($model,'name',array('class'=>'span3','maxlength'=>100)); ?>
  <?php echo $form->textFieldRow($model,'code',array('class'=>'span2')); ?>
  <?php echo $form->textFieldRow($model,'capacity',array('class'=>'span1')); ?>
<?php endif;?>

<?php if($mName=='Port'):?>
  <?php echo $form->textFieldRow($model,'name',array('class'=>'span3','maxlength'=>100)); ?>
  <?php echo $form->textFieldRow($model,'code',array('class'=>'span2')); ?>
<?php endif;?>

<?php if($mName=='Route'):?>
  <?php $port=CHtml::listData(Port::model()->findAll(),'id','name');?>
  <?php echo $form->textFieldRow($model,'name',array('class'=>'span3','maxlength'=>100)); ?>
  <?php echo $form->dropDownListRow($model,'source_port',$port,array('class'=>'span3','maxlength'=>100,'readonly'=>true)); ?>
  <?php echo $form->dropDownListRow($model,'dest_port',$port,array('class'=>'span3','maxlength'=>100)); ?>
<?php endif;?>

<?php if($mName=='SeatingClass'):?>
  <?php echo $form->textFieldRow($model,'name',array('class'=>'span3','maxlength'=>100)); ?>
  <?php echo $form->textFieldRow($model,'code',array('class'=>'span2')); ?>
  <?php echo $form->textAreaRow($model,'description',array('class'=>'span3')); ?>
  <?php echo $form->dropDownListRow($model,'active',$active,array('class'=>'span3','maxlength'=>100)); ?>
<?php endif;?>

<?php if($mName=='PassengerType'):?>
  <?php echo $form->textFieldRow($model,'name',array('class'=>'span3','maxlength'=>100)); ?>
  <?php echo $form->textFieldRow($model,'code',array('class'=>'span2')); ?>
  <?php echo $form->textAreaRow($model,'description',array('class'=>'span3')); ?>
  <?php echo $form->dropDownListRow($model,'active',$active,array('class'=>'span3','maxlength'=>100)); ?>
<?php endif;?>

<?php if($mName=='Voyage'):?>
  <?php
    $vessels=CHtml::listData(Vessel::model()->findAll(),'id','name');
    $routes=CHtml::listData(Route::model()->findAll(),'id','name');
  ?>
  <?php echo $form->textFieldRow($model,'voyage_number',array('class'=>'span3','maxlength'=>100)); ?>
  <?php echo $form->dropDownListRow($model,'vessel_id',$vessels,array('class'=>'span3','maxlength'=>100)); ?>
  <?php echo $form->dropDownListRow($model,'route_id',$routes,array('class'=>'span3','maxlength'=>100)); ?>
  <?php echo $form->datePickerRow($model, 'departure_date', array('append'=>'<i class="icon-calendar" style="cursor:pointer"></i>','class'=>'span2','options'=>array( 'format' => 'yyyy-mm-dd')));?>
  <?php echo $form->timepickerRow($model, 'departure_time', array('class'=>'span2','options'=>array('template'=>'modal','defaultTime'=>'01:00','minuteStep'=>1,'showMeridian'=>true)));?>
  <?php echo $form->timepickerRow($model, 'arrival_time', array('class'=>'span2','options'=>array('template'=>'modal','defaultTime'=>'01:00','minuteStep'=>1,'showMeridian'=>true)));?>
<?php endif;?>
<div class="form-actions">
  <?php 
    $this->widget('bootstrap.widgets.TbButton', array(
      'buttonType'=>'submit',
      'type'=>'primary',
      'label'=>$model->isNewRecord ? Yii::t('app','label.add') : Yii::t('app','label.update'))); 
  ?>
  <?php
    $this->widget('bootstrap.widgets.TbButton', array(
      'type'=>'info',
      'buttonType'=>'link',
      'icon'=>'',
      'url'=>Yii::app()->createUrl('admin/'.$mName),'label'=>Yii::t('app','label.back')));
  ?>
</div>

<?php $this->endWidget(); ?>
