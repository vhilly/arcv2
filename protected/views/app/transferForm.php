
<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
  'id'=>'booking-transfer-form',
  'enableAjaxValidation'=>false,
)); ?>
  <?php echo $form->hiddenField($model,'seat_id') ?>
<table>
  <tr>
    <td>SELECT VOYAGE:</td>
    <td><?php echo $form->dropDownList($model,'voyage_id',CHtml::listData(Voyage::model()->findAll(array('condition'=>'voyage_status_id<3','params'=>array(':id'=>$model->voyage_id))),'id','voyage_number'),array('class'=>'voyage seatChange'))?></td>
    <td>Seat:</td>
    <td style="padding:0"><div id="seatValue" class="well well-small" style="width:25px;font-weight:bold;background:#afc"><?=isset($model->seat->name) ? $model->seat->name : ''?><div></td>
    <td valign=top><?php $this->widget('bootstrap.widgets.TbButton', array(
      'buttonType'=>'submit',
      'type'=>'primary',
      'label'=>'Transfer'
    )); ?></td>
  </tr>
  </tr>
</table>
<div id='seatBox'></div>
<?php $this->endWidget(); ?>

<script>
 $('#seatBox').load('<?=Yii::app()->baseUrl;?>?r=app/seatMap&id=<?=$model->seating_class_id?>&voyage=<?=$model->voyage_id?>');

  $('.seatChange').bind('change', function(Event){
    $('#seatBox').load('<?=Yii::app()->baseUrl;?>?r=app/seatMap&id=2&voyage='+this.value);
  });
</script>
<?php
die();
?>