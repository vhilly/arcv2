<h1>Voyage</h1>
<?php
  $vessels=CHtml::listData(Vessel::model()->findAll(),'id','name');
  $routes=CHtml::listData(Route::model()->findAll(),'id','name');
?>
<?php $this->widget('bootstrap.widgets.TbGridView',array(
  'id'=>'route-grid',
  'dataProvider'=>$voyage->search(),
  'filter'=>$voyage,
  'columns'=>array(
  'voyage_number',
  array('name'=>'vessel_id','value'=>'$data->vessel->name','filter'=>$vessels),
  array('name'=>'route_id','value'=>'$data->route->name','filter'=>$routes),
  'departure_date',
  'capacity',
  'available_seats',
    array(
      'class'=>'bootstrap.widgets.TbButtonColumn',
      'template'=>'{update}',
      'buttons'=>array(            
        'update' => array(
           'url'=>'Yii::app()->createUrl("admin/voyageUpdate",array("id"=>"$data->id"))',
         ),
      ),
    ),
  ),
)); 

?>
<?php 
  $this->widget('bootstrap.widgets.TbButton', array('type'=>'inverse','buttonType'=>'link','icon'=>'plus',
    'url'=>Yii::app()->createUrl('admin/voyageAdd'),'label'=>Yii::t('app','label.voyage.add')));
?>
