<?php
  $values='';
  $db=new PDO('mysql:host=localhost;dbname=reports','root','mysqladmin');
  try{
    $db2=new PDO('mysql:host=localhost;dbname=archv2','root','mysqladmin');
    $port ='BAT';
    $sql = "
SELECT b.id,d.name vessel,b.number voyage,e.name route,
b.departure_date departure,b.departure_time dep_time,
SUM( IF( a.status =1 OR b.status =2, 1, 0 ) ) reserved, 
SUM( IF( a.status =3, 1, 0 ) ) checked, SUM( IF( a.status =4, 1, 0 ) ) boarded, 
SUM( IF( a.status =5, 1, 0 ) ) noshow, SUM( IF( a.status =6, 1, 0 ) ) refunded, 
SUM( IF( a.status =7, 1, 0 ) ) canceled,
 SUM(IF(a.status < 6 AND a.seating_class=1,1,0)) business_cnt,
SUM(IF(a.status < 6 AND a.seating_class=2,1,0)) premium_cnt, 
SUM(IF(a.status<5,1,0)) total_cnt,
(SELECT COUNT(*) FROM waybill WHERE voyage=b.id) cargo_total,
 SUM(IF(a.status < 6 AND a.seating_class=1,a.price_paid,0)) business_rev,SUM(IF(a.status < 6 AND a.seating_class=2,a.price_paid,0)) premium_rev,
 IFNULL((SELECT SUM(price_paid) FROM waybill WHERE voyage=b.id),0) cargo_rev,
 SUM(IF(a.status < 6,a.price_paid,0)) + IFNULL((SELECT SUM(price_paid) FROM waybill WHERE voyage=b.id),0) total_rev

FROM ticket a,voyage b,vessel c,vessel d,route e
WHERE  a.voyage=b.id AND b.vessel=d.id AND b.route=e.id AND b.departure_date =CURDATE() -1 
    ";
  }catch(PDOException $e){
    echo $e->getMessage();
  }
  $result = $db2->query($sql);
  foreach($result->fetchAll(PDO::FETCH_ASSOC) as $row){
    $values= '\''.implode('\',\'',$row).'\'';

    $sql = "INSERT INTO voyage_report_v2 VALUES({$values}) 
                 ON DUPLICATE KEY UPDATE 
                 vessel='{$row['vessel']}',voyage='{$row['voyage']}',route='{$row['route']}',
                 departure_date='{$row['departure']}',departure_time='{$row['dep_time']}',reserved='{$row['reserved']}',checked_in='{$row['checked']}',
                 boarded='{$row['boarded']}',no_show='{$row['noshow']}',refunded='{$row['refunded']}',canceled='{$row['canceled']}',
                 business_cnt='{$row['business_cnt']}',premium_cnt='{$row['premium_cnt']}',total_cnt='{$row['total_cnt']}',cargo_total='{$row['cargo_total']}',
                 business_rev='{$row['business_rev']}',
                 premium_rev='{$row['premium_rev']}',
                 cargo_rev='{$row['cargo_rev']}',
                 total_rev='{$row['total_rev']}'
                ";
   if($values){
    $db->query($sql);
    echo 'done';
   }
  }
?>
