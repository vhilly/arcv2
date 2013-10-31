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
			array('cargo_id, voyage_id, cargo_class_id, lading_no, series_no, booking_no, waybill_type_id, price_paid', 'required'),
			array('cargo_id, voyage_id, stowage_id, cargo_class_id, waybill_type_id, status_id, created_by, client_id', 'numerical', 'integerOnly'=>true),
			array('transaction_no, lading_no, series_no, booking_no', 'length', 'max'=>32),
			array('price_paid', 'length', 'max'=>20),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, cargo_id, voyage_id, stowage_id, cargo_class_id, transaction_no, lading_no, series_no, booking_no, waybill_type_id, price_paid, status_id, created_by, client_id', 'safe', 'on'=>'search'),
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
			'cargo' => array(self::BELONGS_TO, 'Cargo', 'cargo_id'),
			'voyage' => array(self::BELONGS_TO, 'Voyage', 'voyage_id'),
			'cargoClass' => array(self::BELONGS_TO, 'CargoClass', 'cargo_class_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'cargo_id' => 'Cargo',
			'voyage_id' => 'Voyage',
			'stowage_id' => 'Stowage',
			'cargo_class_id' => 'Cargo Class',
			'transaction_no' => 'Transaction No',
			'lading_no' => 'Lading No',
			'series_no' => 'Series No',
			'booking_no' => 'Booking No',
			'waybill_type_id' => 'Waybill Type',
			'price_paid' => 'Price Paid',
			'status_id' => 'Status',
			'created_by' => 'Created By',
			'client_id' => 'Client',
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
		$criteria->compare('cargo_id',$this->cargo_id);
		$criteria->compare('voyage_id',$this->voyage_id);
		$criteria->compare('stowage_id',$this->stowage_id);
		$criteria->compare('cargo_class_id',$this->cargo_class_id);
		$criteria->compare('transaction_no',$this->transaction_no,true);
		$criteria->compare('lading_no',$this->lading_no,true);
		$criteria->compare('series_no',$this->series_no,true);
		$criteria->compare('booking_no',$this->booking_no,true);
		$criteria->compare('waybill_type_id',$this->waybill_type_id);
		$criteria->compare('price_paid',$this->price_paid,true);
		$criteria->compare('status_id',$this->status_id);
		$criteria->compare('created_by',$this->created_by);
		$criteria->compare('client_id',$this->client_id);

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
