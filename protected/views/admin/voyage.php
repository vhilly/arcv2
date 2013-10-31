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
  array('name'=>'departure_time','value'=>'date("g:i A",strtotime($data->departure_time))'),
  array('name'=>'arrival_time','value'=>'date("g:i A",strtotime($data->arrival_time))'),
  array('name'=>'voyage_status_id','value'=>'$data->voyageStatus->name'),
    array(
      'class'=>'bootstrap.widgets.TbButtonColumn',
      'template'=>'{update} {close}',
      'buttons'=>array(            
        'update' => array(
           'url'=>'Yii::app()->createUrl("admin/voyageUpdate",array("id"=>"$data->id"))',
         ),
        'close' => array(
           'label'=>'close voyage',
           'icon'=>'remove-sign',
           'url'=>'Yii::app()->createUrl("admin/voyageStatus",array("id"=>"$data->id"))',
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
