<h1>Baggages</h1>
<?php $this->widget('bootstrap.widgets.TbGridView',array(
  'id'=>'baggage-grid',
  'dataProvider'=>$bt->search(),
  'filter'=>$bt,
  'columns'=>array(
  'passenger',
  'ticket',
  'waybill',
  'price_paid',
  'baggage_type',
  'status',
  'created_by',
    array(
      'class'=>'bootstrap.widgets.TbButtonColumn',
      'template'=>'{update}',
      'buttons'=>array(
        'update' => array(
           'url'=>'Yii::app()->createUrl("admin/baggageUpdate",array("id"=>"$data->id"))',
        ),
      ),
    ),
  ),
)); 

?>
<?php
  $this->widget('bootstrap.widgets.TbButton', array('type'=>'inverse','buttonType'=>'link','icon'=>'plus',
    'url'=>Yii::app()->createUrl('admin/baggageAdd'),'label'=>Yii::t('app','label.baggage.add')));
?>

