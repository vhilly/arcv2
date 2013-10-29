<?php if(count($sc) && $route):?>
    <?php $box = $this->beginWidget('bootstrap.widgets.TbBox', array(
      'title' => 'Rates',
      'headerIcon' => 'icon-th-list',
      'htmlOptions' => array('class'=>'bootstrap-widget-table')
    ));?>
    <?php $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array('id'=>'verticalForm')); ?>
    <table class=span6>
      <tr>
        <th colspan=4><center><?=$route->sourcePort->name.'-'.$route->destPort->name?><center></th>
      </tr>
      <tr>
         <td></td>
      <?php foreach($sc as $s):?>
        <th><?=$s->name?> </th>
      <?php endforeach;?>
      </tr>
      <?php foreach($ft as $f):?>
       <tr>
         <td>
           <?=$f->name?>
         </td>
         <?php foreach($sc as $s):?>
         <td>
           <? $i=  $f->id.$s->id;?>
           <?php $rate = PassengerFare::model()->findByAttributes(array('type'=>$f->id,'class'=>$s->id,'route'=>$rid))?>
           <?php if(!$rate): ?>
            <?php 
              $rate = new PassengerFare;
              $rate->route = $rid;
              $rate->class = $s->id;
              $rate->type = $f->id;
            ?>
           <?php endif;?>
            <?php echo $form->hiddenField($rate, "[$i]id", array('class'=>'span1')); ?>
            <?php echo $form->textField($rate, "[$i]price", array('class'=>'span1')); ?>
            <?php echo $form->hiddenField($rate, "[$i]class", array('class'=>'span1')); ?>
            <?php echo $form->hiddenField($rate, "[$i]route", array('class'=>'span1')); ?>
            <?php echo $form->hiddenField($rate, "[$i]type", array('class'=>'span1')); ?>
               
         </td>
         <?php endforeach;?>
       </tr>
      <?php endforeach;?>
    </table>
    <div class="clearfix"></div>
    <div class="form-actions">
      <?php $this->widget('bootstrap.widgets.TbButton', array('buttonType'=>'submit','type'=>'primary', 'label'=>Yii::t('app','label.update'))); ?>
      <?php $this->widget('bootstrap.widgets.TbButton', array('buttonType'=>'link','type'=>'info','url'=>Yii::app()->createUrl('admin/passengerFare'),
         'label'=>Yii::t('app','label.back'))); ?>
    </div>
    <?php $this->endWidget();?>
    <?php $this->endWidget();?>
<?php else: ?>
    <?php $box = $this->beginWidget('bootstrap.widgets.TbBox', array(
      'title' => Yii::t('app','label.passengerFareFull'),
      'headerIcon' => 'icon-th-list',
      'htmlOptions' => array('class'=>'bootstrap-widget-table')
    ));?>
    <?php 
      $dataProvider=new CActiveDataProvider('Route');
      $gridColumns = array(
        'name',
        array('name'=>'source_port','value'=>'$data->sourcePort->name'),
        array('name'=>'dest_port','value'=>'$data->destPort->name'),
        array(
          'class'=>'bootstrap.widgets.TbButtonColumn',
          'template'=>'{rates}',
          'buttons'=>array(            
            'rates' => array(
              'label'=>Yii::t('app','label.passengerFare'),
              'url'=>'Yii::app()->createUrl("admin/passengerFare",array("rid"=>"$data->id"))',
            ),
          ),
        ),
      );
      $this->widget('bootstrap.widgets.TbGridView', array(
        'type'=>'bordered',
        'dataProvider'=>$dataProvider,
        'template'=>"{items}{pager}",
        'columns'=>$gridColumns,
      ));
    ?>
    <?php $this->endWidget();?>
<?php endif; ?>
