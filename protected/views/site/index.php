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
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script>
      var $border_color = "#efefef";
      var $grid_color = "#ddd";
      var $default_black = "#666";
      var $default_grey = "#ccc";
      var $primary_color = "#428bca";
      var $go_green = "#93caa3";
      var $jet_blue = "#70aacf";
      var $lemon_yellow = "#ffe38a";
      var $nagpur_orange = "#fc965f";
      var $ruby_red = "#fa9c9b";
      google.load("visualization", "1", {packages:["corechart"]});
      function drawPie(stats,k) {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Booking Status');
        data.addColumn('number', 'count');
        data.addRows(stats);
        var options = {
          width:'auto',
          colors: [$primary_color, $ruby_red, $jet_blue, $go_green, $lemon_yellow, $nagpur_orange, $default_black],
          selectionMode: 'multiple',
          aggregationTarget: 'category',
          tooltip: {
            trigger: 'selection',
            textStyle: {
              color: '#666666',
              fontSize: 11
            },
            showColorCode: true
          },
          title: '',
          chartArea: {
              left: 100,
              top: 20,
              height: "80%"
          },
        };

        var chart = new google.visualization.PieChart(document.getElementById('chart_'+k));
        chart.draw(data, options);
      }
</script>
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
  <?php $status=array();?>
  <?php array_push($status,array('Seats Remaining', (int) $v['available_seats']));?>
  <?php foreach($v['status'] as $s):?>
    <li>
      <span><?=$s['name']?></span>
      <span class='value text-success'><?=$s['cnt']?></span>
    </li>
  <?php array_push($status,array($s['name'],$s['cnt']));?>
  <?php endforeach;?>
    <li>
      <span> Revenue</span>
      <span class='value text-success'><?=number_format($v['revenue'])?></span>
    </li>
  </ul>
  <div id="chart_<?=$key?>" style="width: 900px; height: 300px;"></div>
  <script>drawPie(<?=json_encode($status)?>,<?=$key?>);</script>
</div>
<?php $this->endWidget();?>
<?php endforeach;?>
<?php endif;?>
