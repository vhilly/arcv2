<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'excessbaggage-form',
	'enableAjaxValidation'=>false,
)); ?>
             

        <h3>EXCESS BAGGAGE</h3>
	<?php echo $form->dropDownListRow($b,'voyage',CHtml::listData(Voyage::model()->findAll(array('order'=>'id DESC')),'id','number'),array('class'=>'span2')); ?>

	<?php echo $form->dropDownListRow($b,'baggage_type',CHtml::listData(BaggageType::model()->findAll(),'id','weight'),array('class'=>'span2','maxlength'=>20)); ?>
	<?php echo "<br>";//$form->textFieldRow($b,'price_paid',array('class'=>'span2','maxlength'=>20,'readonly'=>true)); ?>

<div class="form-actions">
	<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			'type'=>'primary',
			'label'=>$b->isNewRecord ? 'Add' : 'Save',
		)); ?>
  <?php $this->widget('bootstrap.widgets.TbButton', array('type'=>'danger','buttonType'=>'link','icon'=>'','url'=>Yii::app()->createUrl('app/baggage'),'label'=>'Cancel'));?>
</div>

<?php $this->endWidget();?>


<script>

$('#Baggage_baggage_type').click(function(){
  var html='';
  $.ajax({
      
    )}
});

</script>
