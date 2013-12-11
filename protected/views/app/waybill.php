<h1>Waybills</h1>
<?php $sc=CHtml::listData(CargoClass::model()->findAll(),'id','name');?>
<?php $voyage=CHtml::listData(Voyage::model()->findAll(array('order'=>'id DESC')),'id','number');?>
<?php $status=CHtml::listData(Status::model()->findAll(array('condition'=>'entity_id=1')),'id','name');?>

<?php $this->widget('bootstrap.widgets.TbGridView',array(
  'id'=>'waybill-grid',
  'dataProvider'=>$waybill->search(),
  'filter'=>$waybill,
  'columns'=>array(
  'lading_no',
  array('name'=>'series_no',
    'class' => 'bootstrap.widgets.TbEditableColumn',
    'editable' => array(
      'url' => $this->createUrl('app/editableSaver',array('mName'=>'Waybill')),
      'placement' => 'right',
      'inputclass' => 'span1'
    )
  ),
  array('name'=>'voyage','value'=>'$data->voyage0->number','filter'=>$voyage),
  array('name'=>'cargo_class','value'=>'$data->cargoClass->name','filter'=>$sc),
  array('name'=>'waybill_type','value'=>'$data->waybill_type==1?"Advance":"Walk-in"','filter'=>array(1=>'Advance',2=>'Walk-in')),
  'price_paid',
  array('name'=>'status','value'=>'$data->status0->name','filter'=>$status),
    array(
      'class'=>'bootstrap.widgets.TbButtonColumn',
      'template'=>'{print}  &nbsp; {refund}  &nbsp; {cancel}',
      'buttons'=>array(            
        'print' => array(
           'label'=>'print',
           'icon'=>'icon-print',
           'url'=>'Yii::app()->createUrl("app/print",array("id"=>"$data->id","type"=>"wbill"))',
            'options'=>array('target'=>'_blank'),
         ),
        'refund' => array(
           'label'=>'refund',
           'icon'=>'icon-share',
           'url'=>'Yii::app()->createUrl("app/waybillRefund",array("id"=>"$data->id"))',
           'options'=>array(
             'confirm'=>'Are you sure?',
             'ajax'=>array(
               'type'=>'GET',
               'url'=>"js:$(this).attr('href')",
               'success' => "js:function() { $.fn.yiiGridView.update('waybill-grid') }"
             )
           )
         ),
        'cancel' => array(
           'label'=>'cancel',
           'icon'=>'icon-trash',
           'url'=>'Yii::app()->createUrl("app/waybillCancel",array("id"=>"$data->id"))',
           'options'=>array(
             'confirm'=>'Are you sure?',
             'ajax'=>array(
               'type'=>'GET',
               'url'=>"js:$(this).attr('href')",
               'success' => "js:function() { $.fn.yiiGridView.update('waybill-grid') }"
             )
           )
         ),
      ),
    ),
  ),
)); 

?>
