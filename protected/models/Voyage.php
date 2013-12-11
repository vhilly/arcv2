<?php

/**
 * This is the model class for table "voyage".
 *
 * The followings are the available columns in table 'voyage':
 * @property integer $id
 * @property integer $voyage_number
 * @property integer $vessel_id
 * @property integer $route_id
 * @property string $departure_date
 * @property string $departure_time
 * @property string $arrival_time
 * @property integer $capacity
 * @property integer $available_seats
 * @property integer $voyage_status_id
 *
 * The followings are the available model relations:
 * @property Vessel $vessel
 * @property Route $route
 */
class Voyage extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'voyage';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('number, vessel, route, departure_date, departure_time, arrival_time', 'required'),
			array('vessel, route, capacity, available_seats, status', 'numerical', 'integerOnly'=>true),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, number, vessel, route, departure_date, departure_time, arrival_time, capacity, available_seats, ', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'vessel0' => array(self::BELONGS_TO, 'Vessel', 'vessel'),
			'voyageStatus' => array(self::BELONGS_TO, 'Status', 'status'),
			'route0' => array(self::BELONGS_TO, 'Route', 'route'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'number' => Yii::t('app','model.voyage.voyageNumber'),
			'vessel' =>  Yii::t('app','model.voyage.vessel_id'), 
			'route' =>  Yii::t('app','model.voyage.route_id'),
			'departure_date' =>  Yii::t('app','model.voyage.departure_date'),
			'departure_time' =>  Yii::t('app','model.voyage.departure_time'),
			'arrival_time' =>  Yii::t('app','model.voyage.arrival_time'),
			'capacity' =>  Yii::t('app','model.voyage.capacity'),
			'available_seats' =>  Yii::t('app','model.voyage.available_seats'),
			'status' =>  Yii::t('app','model.voyage.voyage_status'),
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('number',$this->number,true);
		$criteria->compare('vessel',$this->vessel);
		$criteria->compare('route',$this->route);
		$criteria->compare('departure_date',$this->departure_date,true);
		$criteria->compare('departure_time',$this->departure_time,true);
		$criteria->compare('arrival_time',$this->arrival_time,true);
		$criteria->compare('capacity',$this->capacity);
		$criteria->compare('available_seats',$this->available_seats);
		$criteria->compare('status',$this->status);
                $criteria->order = 'id DESC';

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Voyage the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
