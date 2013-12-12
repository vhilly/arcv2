<?php
  
  try{
    $db=new PDO('mysql:host=localhost;dbname=reports','root','mysqladmin');
    $db2=new PDO('mysql:host=localhost;dbname=archv2','root','mysqladmin');
    $sql = "
SELECT
vs.name vesname,vs.code vescode, CONCAT(IFNULL((SELECT code FROM port WHERE id=1),'N'),'-',voyage) vid,v.number vnumber,
r.id rid,r.name route,
t.ticket_no,t.series_no,t.booking_no,t.transaction_no,t.ticket_type ticket_type,t.passenger_type passenger_type,
t.seating_class seating_class,sc.name scname,sc.code scode,
t.seat seat,s.name sname,
pt.name ptname,pt.code ptcode,
t.price_paid,t.status,t.created_by,
p.first_name,p.last_name,p.age
FROM ticket t
LEFT JOIN  voyage v ON v.id=t.voyage
LEFT JOIN  seating_class sc ON sc.id = t.seating_class
LEFT JOIN  seat s ON s.id=t.seat
LEFT JOIN  passenger_type pt ON pt.id=t.passenger_type
LEFT JOIN  vessel vs ON vs.id=v.vessel
LEFT JOIN  route r ON r.id=v.route
LEFT JOIN  passenger p ON p.id=t.passenger
ORDER by t.id
    ";
  }catch(PDOException $e){
    echo $e->getMessage();
  }
  $result = $db2->query($sql);
  foreach($result->fetchAll(PDO::FETCH_ASSOC) as $key=>$row){
    $data= '\''.implode('\',\'',$row).'\'';
    $values[] =  "('',".$data.")";
  }
  $sql = "INSERT INTO booking_history_v2 VALUES ".implode(',',$values);
  $db->query($sql);
  echo 'done..';
?>
