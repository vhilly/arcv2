<?php

/**
 * This is the model class for table "baggage".
 *
 * The followings are the available columns in table 'baggage':
 * @property integer $id
 * @property integer $passenger
 * @property integer $ticket
 * @property integer $waybill
 * @property integer $voyage
 * @property string $price_paid
 * @property integer $baggage_type
 * @property integer $status
 * @property integer $created_by
 *
 * The followings are the available model relations:
 * @property Status $status0
 * @property Users $createdBy
 * @property Passenger $passenger0
 * @property Ticket $ticket0
 * @property Waybill $waybill0
 * @property Voyage $voyage0
 * @property BaggageType $baggageType
 */
class Baggage extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Baggage the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'baggage';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('passenger, ticket, waybill, voyage, baggage_type, status, created_by', 'numerical', 'integerOnly'=>true),
			array('price_paid', 'length', 'max'=>20),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, passenger, ticket, waybill, voyage, price_paid, baggage_type, status, created_by', 'safe', 'on'=>'search'),
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
			'status0' => array(self::BELONGS_TO, 'Status', 'status'),
			'createdBy' => array(self::BELONGS_TO, 'Users', 'created_by'),
			'passenger0' => array(self::BELONGS_TO, 'Passenger', 'passenger'),
			'ticket0' => array(self::BELONGS_TO, 'Ticket', 'ticket'),
			'waybill0' => array(self::BELONGS_TO, 'Waybill', 'waybill'),
			'voyage0' => array(self::BELONGS_TO, 'Voyage', 'voyage'),
			'baggageType' => array(self::BELONGS_TO, 'BaggageType', 'baggage_type'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'passenger' => 'Passenger',
			'ticket' => 'Ticket',
			'waybill' => 'Waybill',
			'voyage' => 'Voyage',
			'price_paid' => 'Price Paid',
			'baggage_type' => 'Baggage Type',
			'status' => 'Status',
			'created_by' => 'Created By',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('passenger',$this->passenger);
		$criteria->compare('ticket',$this->ticket);
		$criteria->compare('waybill',$this->waybill);
		$criteria->compare('voyage',$this->voyage);
		$criteria->compare('price_paid',$this->price_paid,true);
		$criteria->compare('baggage_type',$this->baggage_type);
		$criteria->compare('status',$this->status);
		$criteria->compare('created_by',$this->created_by);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}