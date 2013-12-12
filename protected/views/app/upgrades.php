
<?php $this->widget('bootstrap.widgets.TbGridView',array(
'id'=>'upgrades-grid',
'dataProvider'=>$model->search(),
'filter'=>$model,
'columns'=>array(
		array('name'=>'voyage','filter'=>CHtml::listData(Voyage::model()->findAll(),'id','number'),'value'=>'$data->voyage0->number'),
                'ticket_series_no',
                'upgrade_series_no',
		'amt',
array(
'class'=>'bootstrap.widgets.TbButtonColumn',
'template'=>'{delete}',
      'buttons'=>array(            
        'delete' => array(
           'label'=>'update',
           'url'=>'Yii::app()->createUrl("app/upgradeDelete",array("id"=>"$data->id"))',
            'options'=>array('target'=>'_blank'),
         ),
       ),
),
),
)); ?>
<?php $this->widget('bootstrap.widgets.TbButton', array('type'=>'inverse','buttonType'=>'link','icon'=>'plus','url'=>Yii::app()->createUrl('app/upgrade'),'label'=>'Record Seat Upgrade Payment'));
