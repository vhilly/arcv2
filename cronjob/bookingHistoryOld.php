<?php
 ini_set('memory_limit', '2024M'); 

  try{
    $db=new PDO('mysql:host=localhost;dbname=reports','root','mysqladmin');
    $db2=new PDO('mysql:host=localhost;dbname=BAT','root','mysqladmin');
    $sql = "
SELECT
vs.name vesname,CONCAT('FM','1') vescode, CONCAT('BAT','-',voyage) vid,v.name vnumber,
r.id rid,r.name route,
t.tkt_no,t.tkt_serial,t.booking_no,t.transaction,type ticket_type,(SELECT type FROM passage_fare_rates WHERE id= t.rate) passenger_type,
(SELECT class FROM passage_fare_rates WHERE id= t.rate) seating_class,sc.name scname,'',
t.seat seat,s.name sname,
pt.name ptname,'' ptcode,
(SELECT price FROM passage_fare_rates WHERE id= t.rate) price_paid,t.status,''  created_by,
p.first_name,p.last_name,p.age
FROM booking t
LEFT JOIN  voyage v ON v.id=t.voyage
LEFT JOIN  seating_class sc ON sc.id =(SELECT class FROM passage_fare_rates WHERE id= t.rate)
LEFT JOIN  seat s ON s.id=t.seat
LEFT JOIN  passage_fare_types pt ON pt.id=(SELECT type FROM passage_fare_rates WHERE id= t.rate)
LEFT JOIN  vessel vs ON vs.id=v.vessel
LEFT JOIN  route r ON r.id=v.route
LEFT JOIN  passenger p ON p.id=t.passenger
ORDER by t.id
LIMIT 5
    ";
  }catch(PDOException $e){
    echo $e->getMessage();
  }
  $fp = fopen('file.csv', 'w');
  $result = $db2->query($sql);
  foreach($result->fetchAll(PDO::FETCH_ASSOC) as $key=>$row){
    $data= '\''.implode('\',\'',$row).'\'';
    $values[] =  "('',".$data.")";
    fputcsv($fp, array($data),'|');
  }
  $sql = "INSERT INTO booking_history_v2 VALUES ".implode(',',$values);
  //$db->query($sql);
  fclose($fp);
?>
