<h1>Seating Classes</h1>
<?php $this->widget('bootstrap.widgets.TbGridView',array(
  'id'=>'sc-grid',
  'dataProvider'=>$sc->search(),
  'filter'=>$sc,
  'columns'=>array(
  'name',
  'code',
  'description',
  array('name'=>'active','value'=>'$data->active ==1 ? "Yes":"No"'),
    array(
      'class'=>'bootstrap.widgets.TbButtonColumn',
      'template'=>'{update}',
      'buttons'=>array(            
        'update' => array(
           'url'=>'Yii::app()->createUrl("admin/seatingclassUpdate",array("id"=>"$data->id"))',
         ),
      ),
    ),
  ),
)); 

?>
<?php 
  $this->widget('bootstrap.widgets.TbButton', array('type'=>'inverse','buttonType'=>'link','icon'=>'plus',
    'url'=>Yii::app()->createUrl('admin/seatingclassAdd'),'label'=>Yii::t('app','label.seatingclass.add')));
?>
