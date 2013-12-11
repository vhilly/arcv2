<?php $this->beginWidget(
  'bootstrap.widgets.TbModal',
    array('id' => 'rateModal')
  ); 
?>
 
<div class="modal-header">
  <a class="close" data-dismiss="modal">&times;</a>
  <h4>Select Rate</h4>
</div>
 
<div class="modal-body">
  <p>One fine body...</p>
</div>
 
<div class="modal-footer">
</div>
 
<?php $this->endWidget(); ?>


<?php
  $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array(
    'id'=>'cargoform',
    'htmlOptions'=>array('class'=>'well-small'),
  ));
?>

  <?php echo $form->hiddenField($wb,'cargo_class',array('id'=>'cclass')); ?>
  <?php echo $form->hiddenField($wb,'discount',array('id'=>'dscount')); ?>
  <?php echo $form->hiddenField($wb,'original_price',array('id'=>'oprice')); ?>
  <table class='table striped'>
    <tr>
      <td><?php echo $form->dropDownListRow($wb, 'voyage',CHtml::listData(Voyage::model()->findAll(array('condition'=>'departure_date>CURDATE() - INTERVAL 3 HOUR AND status != 10','order'=>'id DESC')),'id','number'),array('class'=>'span2','id'=>'voyage')); ?></td>
      <td><?php echo $form->textFieldRow($cargo,'plate_num',array('class'=>'span2','maxlength'=>100)); ?></td>
      <td><?php echo $form->textFieldRow($wb,'price_paid',array('class'=>'span2 ','maxlength'=>100,'id'=>'rate_select','readonly'=>true)); ?></td>
      <td><?php echo $form->textFieldRow($wb,'series_no',array('class'=>'span2 ','maxlength'=>100)); ?></td>
      <td><?php echo $form->textFieldRow($cargo,'shipper',array('class'=>'span2','maxlength'=>100)); ?></td>
    </tr>
    <tr>
      <td><?php echo $form->textAreaRow($cargo,'article_desc',array('class'=>'span2','maxlength'=>100)); ?></td>
      <td><?php echo $form->textAreaRow($cargo,'address',array('class'=>'span2','maxlength'=>255)); ?></td>
    </tr>
  </table>
<?php $this->widget('bootstrap.widgets.TbButton', array('buttonType'=>'submit', 'label'=>'Submit')); ?>
<?php $this->endWidget(); ?>
<script>
  $('#rate_select').click(function(){
    var html='';
    $.ajax({
      url: '<?=Yii::app()->controller->createUrl('app/getCargoRates')?>&rid='+$('#voyage').val(),
      dataType: 'html',
      async: false,
      success: function(data) {
        html = data;
      }
    });
    $('#rateModal .modal-body').html(html);
    $('#rateModal .discountedrate').click(function(){
      $('#rate_select').val($(this).data('dr'));
      $('#cclass').val($(this).data('cclass'));
      $('#oprice').val($(this).data('op'));
      $('#dscount').val($(this).data('dc'));
    });
    $('#rateModal .regularrate').click(function(){
      $('#rate_select').val($(this).data('op'));
      $('#cclass').val($(this).data('cclass'));
      $('#oprice').val($(this).data('op'));
    });
    $('#rateModal').modal();
  });
</script>
