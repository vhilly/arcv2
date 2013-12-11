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
      $sqlpass="
        SELECT
v.id AS voyage,
v.number,
sc.id AS seating_class,
sc.name AS seating_class_name,
pt.id AS passenger_type,
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
  voyage,
  seating_class,
  passenger_type,
  COUNT(*) AS cnt,
  SUM(price_paid) AS amount
  FROM ticket
  WHERE status<6
  GROUP BY 
  voyage,
  seating_class,
  passenger_type
) t
ON t.voyage= v.id AND t.seating_class= sc.id AND t.passenger_type= pt.id
WHERE sc.active = 1
AND pt.active = 1
ORDER BY sc.id, pt.id, v.id
      ";
      $pass=Yii::app()->db->createCommand($sqlpass)->queryAll();
      if($pass){
        foreach($pass as $r){
          $report['voyage'][$r['voyage']]=$r['number'];
          @$report['voyage_total_amt'][$r['voyage']]+=$r['amount'];
          @$report['sc_total_amt'][$r['seating_class']][$r['voyage']]+=$r['amount'];
          $report['sc'][$r['seating_class']]=$r['seating_class_name'];
          $report['pt'][$r['passenger_type']]=$r['passenger_type_name'];
          $report['values'][$r['seating_class']][$r['passenger_type']][$r['voyage']]=$r['amount'];
        }
      }
      $this->render('dailyrevenue',compact('report'));
    }
  }
?>
