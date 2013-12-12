<?php 
  class ReportController extends Controller{

    public function filters()
    {
        return array(
            'rights', // perform access control for CRUD operations
 
        );
    }
    public function actionDailyRevenue(){
      $model=new ReportForm;
      $date_selected= (isset($_POST['ReportForm']['date']) && $_POST['ReportForm']['date'])?"'".$_POST['ReportForm']['date']."'":'CURDATE()';
      $export=isset($_POST['export'])?1:0;
      $per_class=array();
      $per_voyage=array();
      $passenger=array();
      $cargo=array();
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
AND v.departure_date=$date_selected
ORDER BY sc.id, pt.id, v.id
      ";
  $sqlcargo="
        SELECT
v.id AS voyage,
v.number,
cc.id AS cargo_class,
cc.name AS cargo_class_name,
COALESCE(w.cnt, 0) AS cargo_count,
COALESCE(w.amount, 0) AS amount
FROM
voyage v
CROSS JOIN
cargo_class cc
LEFT OUTER JOIN (
  SELECT
  voyage,
  cargo_class,
  COUNT(*) AS cnt,
  SUM(price_paid) AS amount
  FROM waybill
  WHERE status<6
  GROUP BY 
  voyage
) w
ON w.voyage= v.id AND w.cargo_class= cc.id 
WHERE cc.active = 1
AND v.departure_date=$date_selected
ORDER BY cc.id, v.id
  ";
      $pass=Yii::app()->db->createCommand($sqlpass)->queryAll();
      $car=Yii::app()->db->createCommand($sqlcargo)->queryAll();
      if($pass){
        foreach($pass as $r){
          $passenger['voyage'][$r['voyage']]=$r['number'];
          @$passenger['voyage_total_amt'][$r['voyage']]+=$r['amount'];
          @$passenger['voyage_total_cnt'][$r['voyage']]+=$r['passenger_count'];
          @$passenger['sc_total_amt'][$r['seating_class']][$r['voyage']]+=$r['amount'];
          $passenger['sc'][$r['seating_class']]=$r['seating_class_name'];
          $passenger['pt'][$r['passenger_type']]=$r['passenger_type_name'];
          $passenger['values'][$r['seating_class']][$r['passenger_type']][$r['voyage']]=$r['amount'];
          $passenger['count'][$r['seating_class']][$r['passenger_type']][$r['voyage']]=$r['passenger_count'];
        }
      }
      if($car){
        foreach($car as $c){
          $cargo['voyage'][$c['voyage']]=$c['number'];
          @$cargo['voyage_total_amt'][$c['voyage']]+=$c['amount'];
          @$cargo['cargo_total_amt'][$c['cargo_class']][$c['voyage']]+=$c['amount'];
          $cargo['cc'][$c['cargo_class']]=$c['cargo_class_name'];
          $cargo['values'][$c['cargo_class']][$c['voyage']]=$c['amount'];
        }
      }
      if($export)
        $this->renderPartial('dailyrevenue',compact('passenger','cargo','model','export'));
      else
        $this->render('dailyrevenue',compact('passenger','cargo','model','export'));
    }
    public function actionDynamicVoyages(){
       $data=Voyage::model()->findAll(array('condition'=>"departure_date='{$_POST['ReportForm']['date']}'"));
       $data=CHtml::listData($data,'id','number');
        foreach($data as $value=>$name){
        echo CHtml::tag('option',
                   array('value'=>$value),CHtml::encode($name),true);
      }
    }
    public function actionTellers($excel=null){
      $rf = new ReportForm;
      $sc = array(1=>'BC',2=>'PE');
      $pt = array(1=>'FULL',2=>'STUDENT',3=>'SENIOR',4=>'CHILDREN',5=>'INFANT',6=>'PWD',7=>'W/PASS','8'=>'Weekday',9=>'Weekday',10=>'DRIVER/ASSISTANT');
      $output = array();
      $total=0;
      if(isset($_GET['ReportForm'])){
        $rf->attributes = $_GET['ReportForm'];
        $rf->date = $rf->date ? $rf->date : date('Y-m-d');
        $voyage='';
        if($rf->voyage)
          $voyage="AND v.id = '{$rf->voyage}'";
        $sql = "SELECT w.waybill_type,w.cargo_class,v.number voyage,w.price_paid amt,w.lading_no FROM waybill w,voyage v WHERE 
               v.departure_date='{$rf->date}' {$voyage} AND v.id=w.voyage AND v.route='{$rf->route}' AND w.status < 6 ";
        $sql2="SELECT v.number voyage ,t.series_no,t.price_paid,t.passenger_type,t.seating_class FROM ticket t,voyage v WHERE v.route={$rf->route} {$voyage} AND t.status AND v.id=t.voyage AND v.departure_date='{$rf->date}' < 6 ORDER BY series_no";
        $ch=Yii::app()->db->createCommand($sql)->queryAll();
        $bh=Yii::app()->db->createCommand($sql2)->queryAll();
        if(count($bh)){
          $i = 0;
          $tmp = null;
          $tmp2 = null;
          $cnt=1;
          $cnt2=array();
          foreach($bh as $b){
            if(is_numeric($b['series_no'])){
             if($tmp2 != $b['voyage']){
               $tmp = null;
               $i=0;
             }
             $tmp2=$b['voyage'];
             $kor=$sc[$b['seating_class']].'-'.$pt[$b['passenger_type']];
              if($tmp != $kor){
                $cnt=1;
                $i++;
                $output[$b['voyage']][$b['seating_class']][$i][0] = $pt[$b['passenger_type']];
                $output[$b['voyage']][$b['seating_class']][$i][1] = $b['series_no'];
                $output[$b['voyage']][$b['seating_class']][$i][2] = '-';
                $output[$b['voyage']][$b['seating_class']][$i][3] = '';
                $output[$b['voyage']][$b['seating_class']][$i][4] = $cnt.'x';
                $output[$b['voyage']][$b['seating_class']][$i][5] = number_format($b['price_paid'],2);
                $output[$b['voyage']][$b['seating_class']][$i][6] = number_format($b['price_paid']*$cnt,2);
              }else{
                $output[$b['voyage']][$b['seating_class']][$i][3] = $b['series_no'];
                $cnt++;
                $output[$b['voyage']][$b['seating_class']][$i][4] = $cnt.'x';
                $output[$b['voyage']][$b['seating_class']][$i][6] = number_format($b['price_paid']*$cnt,2);
              }
              $tmp=$kor;
            }else{
               $kor2=$sc[$b['seating_class']].'-'.$pt[$b['passenger_type']];
               @$cnt2[$kor2]++;
               $output[$b['voyage']][$b['seating_class']][$kor2][0] = $pt[$b['passenger_type']];
               $output[$b['voyage']][$b['seating_class']][$kor2][1] = '';
               $output[$b['voyage']][$b['seating_class']][$kor2][2] = '-';
               $output[$b['voyage']][$b['seating_class']][$kor2][3] = '';
               $output[$b['voyage']][$b['seating_class']][$kor2][4] = $cnt2[$kor2].'x';
               $output[$b['voyage']][$b['seating_class']][$kor2][5] = number_format($b['amt'],2);
               $output[$b['voyage']][$b['seating_class']][$kor2][6] = number_format($b['amt']*$cnt2[$kor2],2);
            }
            @$totalPerVoyage[$b['voyage']]['total']+=$b['price_paid'];;
            @$totalPerVoyage[$b['voyage']][$b['seating_class']]+=$b['price_paid'];;
            $total+=$b['price_paid'];
          }
        }
        if(count($ch)){
          foreach($ch as $c){
            @$output[$c['voyage']]['cargo']['per_cargo'][]=array($c['passenger_type'].','.$c['seating_class'],$c['tkt_no'],'-','','1x',
            number_format($c['amt'],2),number_format($c['amt'],2));
            @$output[$c['voyage']]['cargo']['total_revenue']+=$c['amt'];
          }
        }
      }
      if($excel)
        $this->renderPartial('tellers',array('data'=>compact('total','output','rf','excel','totalPerVoyage')));
      else
        $this->render('tellers',array('data'=>compact('total','output','rf','excel','totalPerVoyage')));

    }
  }
?>
