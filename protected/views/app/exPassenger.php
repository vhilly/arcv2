<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'excesspassenger-form',
	'enableAjaxValidation'=>false,
)); ?>
  <h3>EXCESS PASSENGER</h3>
<?php $_SESSION['hash'] = $hash = md5('salt'.microtime()); ?>
<input type="hidden" name="hash" value="<?php echo $hash; ?>" />

  <div><?=Yii::t('app','label.ticketing.seriesBeginAt')?>: <input type=text id=series value='<?=$sn?>' class='span3'>&nbsp;<input class='btn btn-primary btn-small' type=button id=setSeries value=Save></div>
	<?php echo $form->dropDownListRow($ticket,'voyage',$voyages,array('class'=>'span2')); ?>
	<?php echo $form->dropDownListRow($ticket,'seating_class',$classes,array('class'=>'span2')); ?>
	<?php echo $form->dropDownListRow($ticket,'passenger_type',$ptypes,array('class'=>'span2')); ?>

<div class="form-actions">
	<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			'type'=>'primary',
			'label'=>$ticket->isNewRecord ? 'Add Passenger' : 'Save Passenger',
		)); ?>
</div>
<?php $this->endWidget();?>
<script>
  $('#setSeries').click(function(){
    $.post('<?=Yii::app()->controller->createUrl('app/seriesNumber')?>',{'value':$('#series').val()},
      function(data){
        if(data.error){
           alert('<?=Yii::t('app','alert.ticketing.series.invalidNumber')?>');
           $('#series').val(data.value);
        }else{
           alert("<?=Yii::t('app','alert.ticketing.series.beginsAt')?> "+data.value);
        }
      },
    "json");
     $("input").blur();
  });

 <?php /*if($bn):?>
   var url = '<?=Yii::app()->createUrl('app/print',array('type'=>'tkt','bn'=>$bn))?>';
   window.open(url);
 <?php endif;*/?>
</script>
