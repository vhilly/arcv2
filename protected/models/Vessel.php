<?php

/**
 * This is the model class for table "vessel".
 *
 * The followings are the available columns in table 'vessel':
 * @property integer $id
 * @property string $name
 * @property string $code
 * @property integer $capacity
 * @property string $blocked_seats
 *
 * The followings are the available model relations:
 * @property Voyage[] $voyages
 */
class Vessel extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'vessel';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('name, code,capacity', 'required'),
			array('capacity', 'numerical', 'integerOnly'=>true),
			array('name', 'length', 'max'=>100),
			array('code', 'length', 'max'=>32),
			array('blocked_seats', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, name, code, capacity, blocked_seats', 'safe', 'on'=>'search'),
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
			'voyages' => array(self::HAS_MANY, 'Voyage', 'vessel_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'name' => Yii::t('app','model.vessel.name'),
			'code' => Yii::t('app','model.vessel.code'),
			'capacity' => Yii::t('app','model.vessel.capacity'),
			'blocked_seats' => Yii::t('app','model.vessel.blocked_seats'),
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
		$criteria->compare('name',$this->name,true);
		$criteria->compare('code',$this->code,true);
		$criteria->compare('capacity',$this->capacity);
		$criteria->compare('blocked_seats',$this->blocked_seats,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Vessel the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
