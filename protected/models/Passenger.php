<?php

/**
 * This is the model class for table "passenger".
 *
 * The followings are the available columns in table 'passenger':
 * @property integer $id
 * @property string $first_name
 * @property string $last_name
 * @property integer $age
 * @property string $email
 * @property string $contact
 * @property string $middle_name
 * @property string $prefix
 * @property string $gender
 * @property string $civil_status
 * @property string $nationality
 * @property string $address
 * @property string $birth_date
 */
class Passenger extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'passenger';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('', 'required'),
			array('age', 'numerical', 'integerOnly'=>true),
			array('first_name, last_name, email, contact, middle_name, nationality', 'length', 'max'=>100),
			array('prefix', 'length', 'max'=>5),
			array('gender, civil_status', 'length', 'max'=>1),
			array('address', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, first_name, last_name, age, email, contact, middle_name, prefix, gender, civil_status, nationality, address, birth_date', 'safe', 'on'=>'search'),
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
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'first_name' => Yii::t('app','model.passenger.fname'),
			'last_name' =>Yii::t('app','model.passenger.lname'),
			'middle_name' => Yii::t('app','model.passenger.mname'),
			'age' => Yii::t('app','model.passenger.age'),
			'email' => Yii::t('app','model.passenger.email'),
			'contact' => Yii::t('app','model.passenger.contact'),
			'prefix' => Yii::t('app','model.passenger.prefix'),
			'gender' => Yii::t('app','model.passenger.gender'),
			'civil_status' => Yii::t('app','model.passenger.civil'),
			'nationality' => Yii::t('app','model.passenger.nationality'),
			'address' => Yii::t('app','model.passenger.address'),
			'birth_date' => Yii::t('app','model.passenger.birthdate'),
		);
	}

	/**,
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
		$criteria->compare('first_name',$this->first_name,true);
		$criteria->compare('last_name',$this->last_name,true);
		$criteria->compare('age',$this->age);
		$criteria->compare('email',$this->email,true);
		$criteria->compare('contact',$this->contact,true);
		$criteria->compare('middle_name',$this->middle_name,true);
		$criteria->compare('prefix',$this->prefix,true);
		$criteria->compare('gender',$this->gender,true);
		$criteria->compare('civil_status',$this->civil_status,true);
		$criteria->compare('nationality',$this->nationality,true);
		$criteria->compare('address',$this->address,true);
		$criteria->compare('birth_date',$this->birth_date,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Passenger the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
