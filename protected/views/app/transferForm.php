
<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
  'id'=>'booking-transfer-form',
  'enableAjaxValidation'=>false,
)); ?>
  <?php echo $form->hiddenField($model,'seat') ?>
<table>
  <tr>
    <td>SELECT VOYAGE:</td>
    <td><?php echo $form->dropDownList($model,'voyage',CHtml::listData(Voyage::model()->findAll(array('condition'=>'status<10 AND status >7','params'=>array(':id'=>$model->voyage))),'id','number'),array('class'=>'voyage seatChange'))?></td>
    <td>Seat:</td>
    <td style="padding:0"><div id="seatValue" class="well well-small" style="width:25px;font-weight:bold;background:#afc"><?=isset($model->seat0->name) ? $model->seat0->name : ''?><div></td>
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
 $('#seatBox').load('<?=Yii::app()->baseUrl;?>?r=app/seatMap&id=<?=$model->seating_class?>&voyage=<?=$model->voyage?>');

  $('.seatChange').change(function(){
    $('#seatBox').load('<?=Yii::app()->baseUrl;?>?r=app/seatMap&id=<?=$model->seating_class?>&voyage='+this.value);
  });
</script>
<?php
die();
?>
