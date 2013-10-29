<?php

/**
 * This is the model class for table "passenger_fare".
 *
 * The followings are the available columns in table 'passenger_fare':
 * @property integer $id
 * @property integer $type
 * @property integer $route
 * @property integer $class
 * @property string $price
 * @property string $active
 *
 * The followings are the available model relations:
 * @property SeatingClass $class0
 * @property Route $route0
 * @property PassengerType $type0
 */
class PassengerFare extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'passenger_fare';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('type, route, class', 'required'),
			array('id,type, route, class', 'numerical', 'integerOnly'=>true),
			array('price', 'length', 'max'=>20),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, type, route, class, price', 'safe', 'on'=>'search'),
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
			'class0' => array(self::BELONGS_TO, 'SeatingClass', 'class'),
			'route0' => array(self::BELONGS_TO, 'Route', 'route'),
			'type0' => array(self::BELONGS_TO, 'PassengerType', 'type'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'type' => Yii::t('app','model.passengerFare.type'),
			'route' => Yii::t('app','model.passengerFare.route'),
			'class' => Yii::t('app','model.passengerFare.class'),
			'price' => Yii::t('app','model.passengerFare.price'),
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
		$criteria->compare('type',$this->type);
		$criteria->compare('route',$this->route);
		$criteria->compare('class',$this->class);
		$criteria->compare('price',$this->price,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return PassengerFare the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
