<?php 
  class ReportController extends Controller{

    public function filters()
    {
        return array(
            'rights', // perform access control for CRUD operations
 
        );
    }
    public function actionDailyRevenue(){
      $per_class=array();
      $per_voyage=array();
      $report=array();
      $sql="
        SELECT
v.id AS voyage_id,
v.voyage_number,
sc.id AS seating_class_id,
sc.name AS seating_class_name,
pt.id AS passenger_type_id,
pt.name AS passenger_type_name,
COALESCE(t.cnt, 0) AS passenger_count,
COALESCE(t.amount, 0) AS amount
FROM
voyage v
CROSS JOIN
seating_class sc
CROSS JOIN
passenger_type pt
LEFT OUTER JOIN (
  SELECT
  voyage_id,
  seating_class_id,
  passenger_type_id,
  COUNT(*) AS cnt,
  SUM(price_paid) AS amount
  FROM ticket
  WHERE status_id<6
  GROUP BY 
  voyage_id,
  seating_class_id,
  passenger_type_id
) t
ON t.voyage_id = v.id AND t.seating_class_id = sc.id AND t.passenger_type_id = pt.id
WHERE sc.active = 1
AND pt.active = 1
ORDER BY sc.id, pt.id, v.id
      ";
      $result=Yii::app()->db->createCommand($sql)->queryAll();
      if($result){
        foreach($result as $r){
          $report['voyage'][$r['voyage_id']]=$r['voyage_number'];
          @$report['voyage_total_amt'][$r['voyage_id']]+=$r['amount'];
          @$report['sc_total_amt'][$r['seating_class_id']][$r['voyage_id']]+=$r['amount'];
          $report['sc'][$r['seating_class_id']]=$r['seating_class_name'];
          $report['pt'][$r['passenger_type_id']]=$r['passenger_type_name'];
          $report['values'][$r['seating_class_id']][$r['passenger_type_id']][$r['voyage_id']]=$r['amount'];
        }
      }
      $this->render('dailyrevenue',compact('report'));
    }
  }
?>
