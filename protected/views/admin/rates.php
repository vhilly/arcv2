<?php if(count($cc) && $route):?>
    <?php $box = $this->beginWidget('bootstrap.widgets.TbBox', array(
      'title' => 'Rates',
      'headerIcon' => 'icon-th-list',
      'htmlOptions' => array('class'=>'bootstrap-widget-table')
    ));?>
    <?php $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array('id'=>'verticalForm')); ?>
    <table class='span6' >
      <tr>
        <th><center><?=$route->sourcePort->name.'-'.$route->destPort->name?><center></th>
        <th>Regular Rate</th>
        <th>Discounted Rate</th>
        <th>Discount</th>
      </tr>
      <?php foreach($cc as $s):?>
       <tr>
         <td>
           <?=$s->name?>
         </td>
           <?$i= $s->id;?>
           <?php $rate = CargoFareRates::model()->findByAttributes(array('class'=>$s->id,'route'=>$rid))?>
           <?php if(!$rate): ?>
            <?php 
              $rate = new CargoFareRates;
              $rate->route = $rid;
              $rate->class = $s->id;
            ?>
           <?php endif;?>
            <?php echo $form->hiddenField($rate, "[$i]id", array('class'=>'span1')); ?>
            <?php echo $form->hiddenField($rate, "[$i]class", array('class'=>'span1')); ?>
            <?php echo $form->hiddenField($rate, "[$i]route", array('class'=>'span1')); ?>
         <td>
            <?php echo $form->textField($rate, "[$i]regular_rate", array('class'=>'span1 rr','id'=>'dsc'.$i.'rr')); ?>
         </td>
         <td>
            <?php echo $form->textField($rate, "[$i]discounted_rate", array('class'=>'span1 dsc'.$i.'rr','id'=>'dsc'.$i.'dr','readonly'=>false)); ?>
         </td>
         <td>
            <?php echo $form->textField($rate, "[$i]discount", array('class'=>'span1 dsc dsc'.$i.'rr','id'=>'dsc'.$i)); ?>
         </td>
       </tr>
      <?php endforeach;?>
    </table>
    <div class="clearfix"></div>
    <div class="form-actions">
      <?php $this->widget('bootstrap.widgets.TbButton', array('buttonType'=>'submit','type'=>'primary', 'label'=>Yii::t('app','label.update'))); ?>
      <?php $this->widget('bootstrap.widgets.TbButton', array('buttonType'=>'link','type'=>'info','url'=>Yii::app()->createUrl('admin/cargoRate'),
         'label'=>Yii::t('app','label.back'))); ?>
    </div>
    <?php $this->endWidget();?>
    <?php $this->endWidget();?>
<?php else: ?>
    <?php $box = $this->beginWidget('bootstrap.widgets.TbBox', array(
      'title' => Yii::t('app','label.cargoRateFull'),
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
              'label'=>Yii::t('app','label.cargoRate'),
              'url'=>'Yii::app()->createUrl("admin/cargoRate",array("rid"=>"$data->id"))',
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
<script>
  $('.dsc').change(function(){
     dsc=parseInt($(this).val());
     dscrr=parseFloat($('#'+this.id+'rr').val(),2);
     dscdr=parseInt($('#'+this.id+'dr').val());
     dscp=dsc*dscrr/100;
     $('#'+this.id+'dr').val(parseFloat(dscrr-dscp,2));
  });
  $('.rr').change(function(){
    $('.'+this.id).val(0);
  });
</script>
