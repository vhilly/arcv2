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
  'number',
  array('name'=>'vessel','value'=>'$data->vessel0->name','filter'=>$vessels),
  array('name'=>'route','value'=>'$data->route0->name','filter'=>$routes),
  'departure_date',
  array('name'=>'departure_time','value'=>'date("g:i A",strtotime($data->departure_time))'),
  array('name'=>'arrival_time','value'=>'date("g:i A",strtotime($data->arrival_time))'),
  array('name'=>'status','value'=>'$data->voyageStatus->name'),
    array(
      'class'=>'bootstrap.widgets.TbButtonColumn',
      'template'=>'{update} &nbsp;{manifest} &nbsp; {close}',
      'buttons'=>array(            
        'update' => array(
           'url'=>'Yii::app()->createUrl("admin/voyageUpdate",array("id"=>"$data->id"))',
         ),
        'manifest' => array(
           'label'=>'manifest',
           'icon'=>'file',
           'url'=>'Yii::app()->createUrl("app/manifest",array("vid"=>"$data->id"))',
           'options'=>array('target'=>'_blank'),
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
