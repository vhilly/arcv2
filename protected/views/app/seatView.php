
<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
  'id'=>'booking-transfer-form',
  'enableAjaxValidation'=>false,
)); ?>
<table>
  <tr>
    <td>SELECT VOYAGE:</td>
    <td><?php echo $form->dropDownList($model,'voyage',CHtml::listData(Voyage::model()->findAll(),'id','number'),array('class'=>'voyage seatChange'))?></td>
    <td><?php echo $form->dropDownList($model,'seating_class',CHtml::listData(SeatingClass::model()->findAll(array('condition'=>'active=1')),'id','name'),array('class'=>'voyage classChange'))?></td>
  </tr>
  </tr>
</table>
<div id='seatBox'></div>
<?php $this->endWidget(); ?>

<script>
 $('#seatBox').load('<?=Yii::app()->baseUrl;?>?r=app/seatMap&id='+$('#Ticket_seating_class').val()+'&voyage='+$('#Ticket_voyage').val());

  $('.seatChange').change(function(){
    $('#seatBox').load('<?=Yii::app()->baseUrl;?>?r=app/seatMap&id='+$('#Ticket_seating_class').val()+'&voyage='+this.value);
  });
  $('.classChange').change(function(){
    $('#seatBox').load('<?=Yii::app()->baseUrl;?>?r=app/seatMap&id='+this.value+'&voyage='+$('#Ticket_voyage').val());
  });
</script>
<?php
?>
