<?php if(!$export):?>
<?php $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array(
'id'=>'inlineForm',
'type'=>'inline',
'htmlOptions'=>array('class'=>'well'),
)); ?>
 

 <?php echo $form->datepickerRow($model, 'date',
   array('prepend'=>'<i class="icon-calendar"></i>',
        'options'=>array('format'=>'yyyy-mm-dd'),
   )
 ); 
 ?>
 <?php $this->widget('bootstrap.widgets.TbButton', array('buttonType'=>'submit', 'label'=>'Generate Report')); ?>
 <?php $this->widget('bootstrap.widgets.TbButton', array('buttonType'=>'submit','type'=>'success','icon'=>'share',
                     'label'=>'Export Report','htmlOptions'=>array('name'=>'export'))); ?>
<?php $this->endWidget();?> 
<?php endif;?>
<?php if(count($passenger)):?>
  <h2>PASSENGER REVENUE</h2>
  <table class='table table-hover' border=1>
    <tr>
      <th rowspan=2>REVENUE</th>
      <th colspan=<?=count($passenger['voyage'])?>><center>VOYAGE</center></th>
      <th rowspan=2>TOTAL</th>
    </tr>
    <tr>
      <th><?=implode('</th><th>',$passenger['voyage'])?></th>
    </tr>
    <?php foreach($passenger['sc'] as $skey=>$sc):?>
      <tr>
        <th bgcolor=cyan> <?=$sc?></th>
        <th bgcolor=cyan><?=implode('</th><th bgcolor=cyan>',$passenger['sc_total_amt'][$skey])?></th>
        <th bgcolor=cyan><?=number_format(array_sum($passenger['sc_total_amt'][$skey]),2)?></th>
      </tr>
      <?php foreach($passenger['pt'] as $pkey=>$pt):?>
      <tr>
        <th> <?=$pt?></th>
        <?php foreach($passenger['voyage'] as $vkey=>$voy):?>
        <th><?=$passenger['values'][$skey][$pkey][$vkey]?></th>
        <?php endforeach;?>
        <th><?=array_sum($passenger['values'][$skey][$pkey])?></th>
      </tr>
      <tr>
        <th>pax</th>
        <?php foreach($passenger['voyage'] as $vkey=>$voy):?>
        <th bgcolor=pink><?=$passenger['count'][$skey][$pkey][$vkey]?></th>
        <?php endforeach;?>
        <th bgcolor=pink><?=array_sum($passenger['count'][$skey][$pkey])?></th>
      </tr>
      <?php endforeach;?>
    <?php endforeach;?>
    <tr><th colspan=<?=count($passenger['voyage'])+2?>></th></tr>
    <tr>
      <th bgcolor=pink>TOTAL PASSENGER COUNT</th><th bgcolor=pink><?=implode('</th><th bgcolor=pink>',$passenger['voyage_total_cnt'])?></th>
      <th bgcolor=pink><?=number_format(array_sum($passenger['voyage_total_cnt']))?></th>
    </tr>
    <tr>
      <th bgcolor=yellow>TOTAL PASSENGER REVENUE</th><th bgcolor=yellow><?=implode('</th><th bgcolor=yellow>',$passenger['voyage_total_amt'])?></th>
      <th bgcolor=yellow><?=number_format(array_sum($passenger['voyage_total_amt']))?></th>
    </tr>
  </table>
<?php endif;?>

<?php if(count($upgrades)):?>
  <h2>UPGRADES</h2>
  <table class='table table-hover table-striped' border=1>
    <tr>
      <th rowspan=2>REVENUE</th>
      <th colspan=<?=count($upgrades['voyage'])?>><center>VOYAGE</center></th>
      <th rowspan=2>TOTAL</th>
    </tr>
    <tr>
      <th><?=implode('</th><th>',$upgrades['voyage'])?></th>
    </tr>
    <tr>
      <th bgcolor=yellow>TOTAL UPGRADE REVENUE</th><th bgcolor=yellow><?=implode('</th><th bgcolor=yellow>',$upgrades['voyage_total_amt'])?></th>
      <th bgcolor=yellow><?=number_format(array_sum($upgrades['voyage_total_amt']))?></th>
    </tr>
  </table>
<?php endif;?>

<?php if(count($cargo)):?>
  <h2>CARGO REVENUE</h2>
  <table class='table table-hover table-striped' border=1>
    <tr>
      <th rowspan=2>REVENUE</th>
      <th colspan=<?=count($cargo['voyage'])?>><center>VOYAGE</center></th>
      <th rowspan=2>TOTAL</th>
    </tr>
    <tr>
      <th><?=implode('</th><th>',$cargo['voyage'])?></th>
    </tr>
    <?php foreach($cargo['cc'] as $ckey=>$cc):?>
      <tr>
        <th> <?=$cc?></th>
        <th><?=implode('</th><th>',$cargo['cargo_total_amt'][$ckey])?></th>
        <th><?=number_format(array_sum($cargo['cargo_total_amt'][$ckey]),2)?></th>
      </tr>
    <?php endforeach;?>
    <tr>
      <th bgcolor=yellow>TOTAL PASSENGER REVENUE</th><th bgcolor=yellow><?=implode('</th><th bgcolor=yellow>',$cargo['voyage_total_amt'])?></th>
      <th bgcolor=yellow><?=number_format(array_sum($cargo['voyage_total_amt']))?></th>
    </tr>
  </table>
<?php endif;?>
<?php if($export):?>
<?php
     $file ='DAILY_REVENUE.xls';
      header('Pragma: public');
      header('Last-Modified: '.gmdate('D, d M Y H:i:s') . ' GMT');
      header('Cache-Control: no-store, no-cache, must-revalidate');
      header('Cache-Control: pre-check=0, post-check=0, max-age=0');
      header("Pragma: no-cache");
      header("Expires: 0");
      header('Content-Transfer-Encoding: none');
      header("Content-type: application/vnd.ms-excel");
      header("Content-Disposition: attachment; filename=$file");
?>
<?php endif;?>
