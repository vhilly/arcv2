<style>
@media (min-height: 650px) {
	.sell-body {
		min-height:500px;
	}
}
</style>
<?php
  $this->beginWidget(
   'bootstrap.widgets.TbModal',
   array('id' => 'progress')
); ?>
<div class="modal-header">
  <center><?=Yii::t('app','label.ticketing.preloader.message')?> <i class='icon-github-alt icon-2x text-danger'></i></center>
</div>
<div class="modal-body">
  <?php
    $this->widget('bootstrap.widgets.TbProgress',
      array(
        'percent' => 100, // the progress
        'striped' => true,
        'animated' => true,
      )
    );
  ?>
</div>
<?php $this->endWidget(); ?>

<div class="well side-space">
  <?php if($voyages):?>
    <?php foreach($voyages as $v):?>
      <?php $selected=@$selected_voyage->id == $v->id ? 'btn-primary' : ''?>
      <a class="btn span3 <?=$selected;?>" href="<?=Yii::app()->createUrl('app/passengerTicket',array('vid'=>$v->id))?>">
        <?=$v->voyage_number?> <br>
        <i class='icon-time icon-2x'></i><br>
        <?=Yii::t('app','label.ticketing.departure')?> <br>
        <span class='label label-important'><?=$v->departure_time?></span>
      </a>
    <?php endforeach;?>
  <?php endif;?>
 <div class='clearfix'></div>
</div>
<?php if($selected_voyage):?>
  <?php foreach($classes as $k=>$c):?>
  <span class='label label-info pull-right side-space' >
    <?=$c.': '.($seats_per_class[$k][0]-$seats_per_class[$k][1]);?>
  </span>
  <?php endforeach;?>
  <span class='label label-info pull-right side-space'>
    <?=Yii::t('app','label.ticketing.seatsAvailable')?>: <?=$selected_voyage->available_seats?>
  </span>
<div class="well side-space  sell-body">
  <?php $form = $this->beginWidget(
    'bootstrap.widgets.TbActiveForm',
      array(
        'id' => 'fillUp',
        'htmlOptions' => array('class' => ''), // for inset effect
      )
    );
  ?>
  <div><?=Yii::t('app','label.ticketing.seriesBeginAt')?>: <input type=text id=series value='<?=$sn?>' class='span3'>&nbsp;<input class='btn btn-primary btn-small' type=button id=setSeries value=Save></div>
   <div id=passengers>
     <?php echo $form->dropDownListRow($class,'id',$classes,array('id'=>'class'));?><br><br>
     <div id=container1>
     1. <?php echo $form->dropDownList($ptype,'id[]',$ptypes,array('id'=>'ptype_1'));?> 
     <?=Yii::t('app','model.passenger.fname')?>  <input class='span2 fname' id=fname_1 type=text name='Passenger[first_name][]' autocomplete='off'> 
     <?=Yii::t('app','model.passenger.lname')?>  <input class=span2 id=lname_1 type=text name='Passenger[last_name][]'> 
     <?=Yii::t('app','model.passenger.age')?>  <input class=span2 id=age_1 type=text name='Passenger[age][]'> 
     <br><br>
     </div>
   </div>
  <br><br>
  <?php $this->widget(
    'bootstrap.widgets.TbButton',
      array('buttonType' => 'submit', 'label' => 'Purchase Ticket' ,'id'=>'buy')
    );
  ?>
  <?php $this->endWidget();?>
  <?php unset($form);?>
 <div class='clearfix'></div>
</div>
<script>
  //$('#buy').attr('disabled','disabled');
  var current = 1;
  $('#fname_'+current).focus();
  $(document).keypress(function (evt) {
    var charCode = evt.charCode || evt.keyCode;
    switch(charCode){
     case 112: $('#class  option:selected').prev().attr('selected', 'selected');return false; //right arrow
     break;
     case 113: $('#class  option:selected').next().attr('selected', 'selected');return false; //right arrow
     break;
     case 39: $('#ptype_'+current+' option:selected').next().attr('selected', 'selected');return false; //right arrow
     break;
     case 37: $('#ptype_'+current+' option:selected').prev().attr('selected', 'selected');return false; //left arrow
     break;
     case 43: addSelect();return false; // + sign
     break;
     case 45: removeSelect();return false; // - sign
     break;
     case 13: $('#buy').focus(); // - enter
     break;
    }
  });
  $('#buy').click(function(){
    if(!parseInt($('#series').val())){
      alert('<?=Yii::t('app','alert.ticketing.series.pleaseInput')?>');
      return false;
    }
    if(!confirm('<?=Yii::t('app','alert.ticketing.series.confirm')?> ')){
      return false;
    }
    $('#progress').modal();

  });
  function addSelect(){
    current++;
    var newSelect= $('<div id=container'+current+'>'+current+
     '.<select id=ptype_'+current+' name=PassengerType[id][]><option></option></select>'+
     ' <?=Yii::t('app','model.passenger.fname')?> <input class="span2 fname" id=fname_'+current+' type=text name="Passenger[first_name][]">'+
     ' <?=Yii::t('app','model.passenger.lname')?> <input class=span2 id=lname_'+current+' type=text  name="Passenger[last_name][]">'+
     ' <?=Yii::t('app','model.passenger.age')?> <input class=span2 id=age_'+current+' type=text  name="Passenger[age][]">'+
     '<br><br></div>');
    newSelect.appendTo("#passengers");
    var options = $('#ptype_1 option').clone();
    $('#ptype_'+current).empty().append(options);
    $('#fname_'+current).focus();
  }
  function removeSelect(){
    if(current >1){
     $('#container'+current).remove();
      current--;
    }
    $('#fname_'+current).focus();
  }
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
  $('select').change(function(){
     $('#fname_'+current).focus();
  });
$(window).load(function () {
  $('#progress').modal('hide');
});
$('.fname').typeahead({'source':['<?=implode('\',\'',$fname)?>'],'items':4,'matcher':function(item) {
								return ~item.toLowerCase().indexOf(this.query.toLowerCase());
							}}
);
 <?php if($bn):?>
   var url = '<?=Yii::app()->createUrl('app/print',array('type'=>'tkt','bn'=>$bn))?>';
   window.open(url);
 <?php endif;?>
</script>
<?php endif;?>
