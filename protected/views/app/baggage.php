<h1>Excess Baggages</h1>
<?php $this->widget('bootstrap.widgets.TbGridView',array(
  'id'=>'baggage-grid',
  'dataProvider'=>$b->search(),
  'filter'=>$b,
  'columns'=>array(
  array('name'=>'voyage','filter'=>CHtml::listData(Voyage::model()->findAll(),'id','number'),'value'=>'$data->voyage0->number'),
//  'passenger',
//  'ticket',
//  'waybill',
  'price_paid',
  array('name'=>'baggage_type','filter'=>CHtml::listData(BaggageType::model()->findAll(),'id','weight'),'value'=>'$data->baggageType->weight'),
    array(
      'class'=>'bootstrap.widgets.TbButtonColumn',
      'template'=>'{delete}',
      'buttons'=>array(
        'delete' => array(
           'url'=>'Yii::app()->createUrl("app/baggageDelete",array("id"=>"$data->id"))',
	    'options'=>array('target'=>'_blank'),
        ),
      ),
    ),
  ),
)); 

?>
<?php
  $this->widget('bootstrap.widgets.TbButton', array('type'=>'inverse','buttonType'=>'link','icon'=>'plus',
    'url'=>Yii::app()->createUrl('app/excessBaggage'),'label'=>Yii::t('app','label.baggage.add')));
?>

