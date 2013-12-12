<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'upgrades-form',
	'enableAjaxValidation'=>false,
)); ?>
             

        <h3>TICKET UPGRADE</h3>
	<?php echo $form->dropDownListRow($model,'voyage',CHtml::listData(Voyage::model()->findAll(array('order'=>'id DESC')),'id','number'),array('class'=>'span2')); ?>

	<?php echo $form->dropDownListRow($model,'from_fare',CHtml::listData(PassengerType::model()->findAll(),'id','name'),array('class'=>'span2','maxlength'=>20)); ?>
	<?php echo $form->textFieldRow($model,'ticket_series_no',array('class'=>'span2','maxlength'=>20)); ?>
	<?php echo $form->textFieldRow($model,'upgrade_series_no',array('class'=>'span2','maxlength'=>20)); ?>

<div class="form-actions">
	<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			'type'=>'primary',
			'label'=>$model->isNewRecord ? 'Add' : 'Save',
		)); ?>
  <?php $this->widget('bootstrap.widgets.TbButton', array('type'=>'danger','buttonType'=>'link','icon'=>'','url'=>Yii::app()->createUrl('app/upgrades'),'label'=>'Cancel'));?>
</div>

<?php $this->endWidget(); ?>
