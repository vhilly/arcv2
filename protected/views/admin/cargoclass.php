<h1>Cargo Classes</h1>
<?php $this->widget('bootstrap.widgets.TbGridView',array(
  'id'=>'vessel-grid',
  'dataProvider'=>$cc->search(),
  'filter'=>$cc,
  'columns'=>array(
  'name',
  'description',
  'lane_meter',
  array('name'=>'active','value'=>'$data->active==1?"Yes":"No"','filter'=>array(1=>'Yes',2=>'No')),
    array(
      'class'=>'bootstrap.widgets.TbButtonColumn',
      'template'=>'{update}',
      'buttons'=>array(            
        'update' => array(
           'url'=>'Yii::app()->createUrl("admin/cargoclassUpdate",array("id"=>"$data->id"))',
         ),
      ),
    ),
  ),
)); 

?>
<?php 
  $this->widget('bootstrap.widgets.TbButton', array('type'=>'inverse','buttonType'=>'link','icon'=>'plus',
    'url'=>Yii::app()->createUrl('admin/cargoclassAdd'),'label'=>Yii::t('app','label.seatingclass.add')));
?>
