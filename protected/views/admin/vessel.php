<h1>Vessels</h1>
<?php $this->widget('bootstrap.widgets.TbGridView',array(
  'id'=>'vessel-grid',
  'dataProvider'=>$vessel->search(),
  'filter'=>$vessel,
  'columns'=>array(
  'name',
  'code',
  'capacity',
    array(
      'class'=>'bootstrap.widgets.TbButtonColumn',
      'template'=>'{update}',
      'buttons'=>array(            
        'update' => array(
           'url'=>'Yii::app()->createUrl("admin/vesselUpdate",array("id"=>"$data->id"))',
         ),
      ),
    ),
  ),
)); 

?>
<?php 
  $this->widget('bootstrap.widgets.TbButton', array('type'=>'inverse','buttonType'=>'link','icon'=>'plus',
    'url'=>Yii::app()->createUrl('admin/vesselAdd'),'label'=>Yii::t('app','label.vessel.add')));
?>
