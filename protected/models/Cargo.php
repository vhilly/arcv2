<?php

/**
 * This is the model class for table "cargo".
 *
 * The followings are the available columns in table 'cargo':
 * @property integer $id
 * @property string $plate_num
 * @property string $shipper
 * @property string $address
 * @property string $article_no
 * @property string $article_desc
 * @property integer $weight
 * @property integer $length
 * @property string $contact
 *
 * The followings are the available model relations:
 * @property Waybill[] $waybills
 */
class Cargo extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'cargo';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('plate_num', 'required'),
			array('weight, length', 'numerical', 'integerOnly'=>true),
			array('plate_num', 'length', 'max'=>10),
			array('shipper, article_no, contact', 'length', 'max'=>100),
			array('address', 'length', 'max'=>255),
			array('article_desc', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, plate_num, shipper, address, article_no, article_desc, weight, length, contact', 'safe', 'on'=>'search'),
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
			'waybills' => array(self::HAS_MANY, 'Waybill', 'cargo_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'plate_num' => 'Plate Num',
			'shipper' => 'Shipper',
			'address' => 'Address',
			'article_no' => 'Article No',
			'article_desc' => 'Article Desc',
			'weight' => 'Weight',
			'length' => 'Length',
			'contact' => 'Contact',
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
		$criteria->compare('plate_num',$this->plate_num,true);
		$criteria->compare('shipper',$this->shipper,true);
		$criteria->compare('address',$this->address,true);
		$criteria->compare('article_no',$this->article_no,true);
		$criteria->compare('article_desc',$this->article_desc,true);
		$criteria->compare('weight',$this->weight);
		$criteria->compare('length',$this->length);
		$criteria->compare('contact',$this->contact,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Cargo the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
