<div class='page-header'>
  <div class="pull-right">
    <ul class="stats">
      <li class='color-first'>
        <span class="icon-money icon-3x text-white pull-left"></span>
        <div class="details">
          <span class="big">P<?=number_format($tr)?></span>
          <span>Revenue</span>
        </div>
      </li>
      <li class='color-second'>
        <span class="icon-calendar icon-3x text-white  pull-left"></span>
        <div class="details" id="date-time"><span class="big"><?=date('M d, Y')?></span><span> <?=date('D g:i:s A')?></span></div>
      </li>
    </ul>
  </div>
</div>
<div class=clearfix></div><br>
<?php if(count($voyage)):?>
<?php foreach($voyage as $key=>$v):?>
<?php $box = $this->beginWidget(
  'bootstrap.widgets.TbBox',
  array(
   'title' => $v['name'],
   'headerIcon' => 'icon-bar-chart',
   'htmlOptions' => array('class' => '')
  )
);?>
<div>
  <ul class="stats-overview">
    <li>
      <span>Capacity</span>
      <span class='value text-success'><?=$v['capacity']?></span>
    </li>
    <li>
      <span>Seats Remaining</span>
      <span class='value text-success'><?=$v['available_seats']?></span>
    </li>
  <?php foreach($v['status'] as $s):?>
    <li>
      <span><?=$s['name']?></span>
      <span class='value text-success'><?=$s['cnt']?></span>
    </li>
  <?php endforeach;?>
    <li>
      <span> Revenue</span>
      <span class='value text-success'><?=number_format($v['revenue'])?></span>
    </li>
  </ul>
  <div id='chart_<?=$key?>'></div>
</div>
<?php $this->endWidget();?>
<?php endforeach;?>
<?php endif;?>
