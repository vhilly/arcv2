<?php if(count($report)):?>
  <table class='table table-hover' border=1>
    <tr>
      <th rowspan=2>REVENUE</th>
      <th colspan=<?=count($report['voyage'])?>><center>VOYAGE</center></th>
      <th rowspan=2>TOTAL</th>
    </tr>
    <tr>
      <th><?=implode('</th><th>',$report['voyage'])?></th>
    </tr>
    <?php foreach($report['sc'] as $skey=>$sc):?>
      <tr>
        <th bgcolor=cyan> <?=$sc?></th>
        <th bgcolor=cyan><?=implode('</th><th bgcolor=cyan>',$report['sc_total_amt'][$skey])?></th>
        <th bgcolor=cyan><?=number_format(array_sum($report['sc_total_amt'][$skey]),2)?></th>
      </tr>
      <?php foreach($report['pt'] as $pkey=>$pt):?>
      <tr>
        <th> <?=$pt?></th>
        <?php foreach($report['voyage'] as $vkey=>$voy):?>
        <th><?=$report['values'][$skey][$pkey][$vkey]?></th>
        <?php endforeach;?>
        <th><?=array_sum($report['values'][$skey][$pkey])?></th>
      </tr>
      <?php endforeach;?>
    <?php endforeach;?>
    <tr>
      <th bgcolor=yellow>TOTAL REVENUE</th><th bgcolor=yellow><?=implode('</th><th bgcolor=yellow>',$report['voyage_total_amt'])?></th>
      <th bgcolor=yellow><?=number_format(array_sum($report['voyage_total_amt']))?></th>
    </tr>
  </table>
<?php endif;?>
