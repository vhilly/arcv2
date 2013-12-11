  <style>
    .table {
      margin-left:1.2cm;
    }
    table{
      vertical-align:top;
      font-size:12px;
    }
    .table2{
    }
    td{
      padding:1px;
      margin-left:-1cm;
    }
    .spacer {
      height:30px;
    }
  </style>
  <script>
    window.print();
    window.close();
  </script>
   <div style="clear:both"> </div><br>
   <?php foreach($result as $b):?>
   <div class="spacer"></div>
   <table class="table">
      <tr>
        <td colspan=3><?=$b->voyage0->number?></td>
      </tr>
      <tr>
        <td colspan=2><?=$b->voyage0->vessel0->name?></td>
        <td colspan=4><?=$b->voyage0->departure_date?> <?=$b->voyage0->departure_time?></td>
      </tr>
      <tr>
        <td width=120px><?=$b->cargo0->shipper ? $b->cargo0->shipper : 'N/A'?></td>
        <td width="140px">&nbsp;</td>
        <td width=120px><?=$b->cargo0->address ? $b->cargo0->address : 'N/A'?></td>
      </tr>
      <tr>
        <td width=120px><?=$b->voyage0->route0->sourcePort->name?></td>
        <td width="140px">&nbsp;</td>
        <td width=120px><?=$b->voyage0->route0->destPort->name?></td>
      </tr>
   </table>
   <br><br>
   <table class=table2>
      <tr>
        <td width=120px valign=top>&nbsp;</td>
        <td width=122px height="50px">
          <?=$b->cargoClass->name?><br>
          <?=$b->cargoClass->description?> meters<br>
          <?=$b->cargo0->article_desc?><br>
          <?=$b->cargo0->plate_num?>
        </td>
        <td width=50px>1</td>
        <td width=50px></td>
        <td width=50px><?=$b->cargo0->weight?></td>
        <td width=50px>1</td>
        <td width=50px><?=$b->price_paid?></td>
      </tr>
   </table>
   <table>
     <tr>
       <td width="442px" height="135px">&nbsp;</td>
       <td width="50px" valign=bottom><?=$b->price_paid?></td>
     </tr>
   </table>
  <?php endforeach; ?>
