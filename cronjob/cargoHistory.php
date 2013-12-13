<?php
  
  try{
    $db=new PDO('mysql:host=localhost;dbname=reports','root','mysqladmin');
    $db2=new PDO('mysql:host=localhost;dbname=archv2','root','mysqladmin');
    $sql = "
SELECT
vs.name vesname,vs.code vescode, CONCAT(IFNULL((SELECT code FROM port WHERE id=1),'N'),'-',voyage) vid,v.number vnumber,
r.id rid,r.name route,
w.lading_no,w.series_no,w.booking_no,w.transaction_no,w.waybill_type waybill_type,
w.cargo_class cargo_class,cc.name ccname,cc.description ccdesc,cc.lane_meter cclmeter,
c.plate_num plate_no,c.article_desc,c.weight,c.length,
w.price_paid,w.original_price,w.discount,
w.status,w.created_by,
c.shipper,c.address,w.client
FROM waybill w
LEFT JOIN  voyage v ON v.id=w.voyage
LEFT JOIN  cargo_class cc ON cc.id = w.cargo_class
LEFT JOIN  cargo c ON c.id=w.cargo
LEFT JOIN  vessel vs ON vs.id=v.vessel
LEFT JOIN  route r ON r.id=v.route
ORDER by w.id
    ";
  }catch(PDOException $e){
    echo $e->getMessage();
  }
  $result = $db2->query($sql);
  $values=array();
  foreach($result->fetchAll(PDO::FETCH_ASSOC) as $key=>$row){
    $data= '\''.implode('\',\'',$row).'\'';
    $values[] =  "('',".$data.")";
  }
  if(count($values)){
    $sql = "INSERT INTO cargo_history_v2 VALUES ".implode(',',$values);
    $db->query($sql);
    echo 'done..';
  }
?>
