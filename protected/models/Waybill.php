<?php

/**
 * This is the model class for table "waybill".
 *
 * The followings are the available columns in table 'waybill':
 * @property integer $id
 * @property integer $cargo_id
 * @property integer $voyage_id
 * @property integer $stowage_id
 * @property integer $cargo_class_id
 * @property string $transaction_no
 * @property string $lading_no
 * @property string $series_no
 * @property string $booking_no
 * @property integer $waybill_type_id
 * @property string $price_paid
 * @property integer $status_id
 * @property integer $created_by
 * @property integer $client_id
 *
 * The followings are the available model relations:
 * @property Users $createdBy
 * @property Cargo $cargo
 * @property Voyage $voyage
 * @property CargoClass $cargoClass
 */
class Waybill extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'waybill';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('cargo, voyage,original_price, cargo_class, lading_no, series_no, booking_no, waybill_type, price_paid', 'required'),
			array('cargo, voyage, stowage,discount, cargo_class, waybill_type, status, created_by, client', 'numerical', 'integerOnly'=>true),
			array('transaction_no, lading_no, series_no, booking_no', 'length', 'max'=>32),
			array('price_paid', 'length', 'max'=>20),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, cargo, voyage, stowage, cargo_class, transaction_no, lading_no, series_no, booking_no, waybill_type, price_paid, status, created_by, client', 'safe', 'on'=>'search'),
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
			'createdBy' => array(self::BELONGS_TO, 'Users', 'created_by'),
			'cargo0' => array(self::BELONGS_TO, 'Cargo', 'cargo'),
			'voyage0' => array(self::BELONGS_TO, 'Voyage', 'voyage'),
			'status0' => array(self::BELONGS_TO, 'Status', 'status'),
			'cargoClass' => array(self::BELONGS_TO, 'CargoClass', 'cargo_class'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'cargo' => 'Cargo',
			'voyage' => 'Voyage',
			'stowage' => 'Stowage',
			'cargo_class' => 'Cargo Class',
			'transaction_no' => 'Transaction No',
			'lading_no' => 'Lading No',
			'series_no' => 'Series No',
			'booking_no' => 'Booking No',
			'waybill_type' => 'Waybill Type',
			'price_paid' => 'Rate',
			'status' => 'Status',
			'created_by' => 'Created By',
			'client' => 'Client',
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
		$criteria->compare('cargo',$this->cargo);
		$criteria->compare('voyage',$this->voyage);
		$criteria->compare('stowage',$this->stowage);
		$criteria->compare('cargo_class',$this->cargo_class);
		$criteria->compare('transaction_no',$this->transaction_no,true);
		$criteria->compare('lading_no',$this->lading_no,true);
		$criteria->compare('series_no',$this->series_no,true);
		$criteria->compare('booking_no',$this->booking_no,true);
		$criteria->compare('waybill_type',$this->waybill_type);
		$criteria->compare('price_paid',$this->price_paid,true);
		$criteria->compare('status',$this->status);
		$criteria->compare('created_by',$this->created_by);
		$criteria->compare('client',$this->client);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Waybill the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
