
<?php
  $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array(
    'id'=>'verticalForm',
    'htmlOptions'=>array('class'=>'well-small'),
  ));
?>
  <fieldset>
    <?php echo $form->dropDownListRow($wb, 'voyage_id',CHtml::listData(Voyage::model()->findAll(array('condition'=>'voyage_status_id !=3','order'=>'id DESC')),'id','voyage_number'),array('class'=>'span2','id'=>'voyage')); ?>
      <?php echo $form->textFieldRow($cargo,'plate_num',array('class'=>'span2','maxlength'=>100)); ?>
      <?php echo $form->textFieldRow($wb,'price_paid',array('class'=>'span2 ','maxlength'=>100)); ?>
      <?php echo $form->textFieldRow($wb,'series_no',array('class'=>'span2 ','maxlength'=>100)); ?>
      <?php echo $form->dropDownListRow($wb,'cargo_class_id',CHtml::listData(CargoClass::model()->findAll(),'id','description'),array('empty'=>'')); ?>
      <?php echo $form->textAreaRow($cargo,'article_desc',array('class'=>'span2','maxlength'=>100)); ?>
      <?php echo $form->textFieldRow($cargo,'shipper',array('class'=>'span2','maxlength'=>100)); ?>
      <?php echo $form->textAreaRow($cargo,'address',array('class'=>'span2','maxlength'=>255)); ?>
  </fieldset>
<?php $this->widget('bootstrap.widgets.TbButton', array('buttonType'=>'submit', 'label'=>'Submit')); ?>
<?php $this->endWidget(); ?>
