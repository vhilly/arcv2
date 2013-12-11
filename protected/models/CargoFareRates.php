<?php

/**
 * This is the model class for table "cargo_fare_rates".
 *
 * The followings are the available columns in table 'cargo_fare_rates':
 * @property integer $id
 * @property integer $route
 * @property integer $class
 * @property integer $lane_meter_rate
 * @property string $discounted_rate
 * @property integer $discount
 * @property string $regular_rate
 * @property string $active
 *
 * The followings are the available model relations:
 * @property Route $route0
 * @property CargoClass $class0
 */
class CargoFareRates extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'cargo_fare_rates';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('route, class', 'required'),
			array('id,route, class,active, lane_meter_rate, discount', 'numerical', 'integerOnly'=>true),
			array('discounted_rate, regular_rate', 'length', 'max'=>20),
			array('active', 'length', 'max'=>1),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, route, class, lane_meter_rate, discounted_rate, discount, regular_rate, active', 'safe', 'on'=>'search'),
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
			'route0' => array(self::BELONGS_TO, 'Route', 'route'),
			'class0' => array(self::BELONGS_TO, 'CargoClass', 'class'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'route' => 'Route',
			'class' => 'Class',
			'lane_meter_rate' => 'Lane Meter Rate',
			'discounted_rate' => 'Discounted Rate',
			'discount' => 'Discount',
			'regular_rate' => 'Regular Rate',
			'active' => 'Active',
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
		$criteria->compare('route',$this->route);
		$criteria->compare('class',$this->class);
		$criteria->compare('lane_meter_rate',$this->lane_meter_rate);
		$criteria->compare('discounted_rate',$this->discounted_rate,true);
		$criteria->compare('discount',$this->discount);
		$criteria->compare('regular_rate',$this->regular_rate,true);
		$criteria->compare('active',$this->active,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return CargoFareRates the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
