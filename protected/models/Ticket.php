<?php

/**
 * This is the model class for table "ticket".
 *
 * The followings are the available columns in table 'ticket':
 * @property integer $id
 * @property integer $passenger_id
 * @property integer $voyage_id
 * @property integer $seat_id
 * @property integer $seating_class_id
 * @property string $transaction_no
 * @property string $ticket_no
 * @property string $series_no
 * @property string $booking_no
 * @property integer $ticket_type_id
 * @property integer $passenger_type_id
 * @property string $price_paid
 *
 * The followings are the available model relations:
 * @property PassengerType $passengerType
 * @property Voyage $voyage
 * @property SeatingClass $seatingClass
 * @property Passenger $passenger
 */
class Ticket extends CActiveRecord
{
    public $last_name;
    public $first_name;
    public $age;

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'ticket';
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
			array('passenger_id, voyage_id, seat_id, seating_class_id,created_by, ticket_type_id, passenger_type_id', 'numerical', 'integerOnly'=>true),
			array('transaction_no, ticket_no, series_no, booking_no', 'length', 'max'=>32),
			array('price_paid', 'length', 'max'=>20),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, passenger_id, voyage_id, seat_id, seating_class_id, transaction_no, ticket_no, series_no, booking_no, ticket_type_id, passenger_type_id, price_paid,last_name,first_name', 'safe', 'on'=>'search'),
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
			'passengerType' => array(self::BELONGS_TO, 'PassengerType', 'passenger_type_id'),
			'voyage' => array(self::BELONGS_TO, 'Voyage', 'voyage_id'),
			'seatingClass' => array(self::BELONGS_TO, 'SeatingClass', 'seating_class_id'),
			'passenger' => array(self::BELONGS_TO, 'Passenger', 'passenger_id'),
			'createdby' => array(self::BELONGS_TO, 'Users', 'created_by'),
			'seat' => array(self::BELONGS_TO, 'Seat', 'seat_id'),
			'status' => array(self::BELONGS_TO, 'BookingStatus', 'status_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'passenger_id' => 'Passenger',
			'voyage_id' => 'Voyage',
			'seat_id' => 'Seat',
			'seating_class_id' => 'Seating Class',
			'transaction_no' => 'Transaction No',
			'ticket_no' => 'Ticket No',
			'series_no' => 'Series No',
			'booking_no' => 'Booking No',
			'ticket_type_id' => 'Ticket Type',
			'passenger_type_id' => 'Passenger Type',
			'price_paid' => 'Price Paid',
			'last_name' => 'Last Name',
			'first_name' => 'First Name',
			'age' => 'Age',
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
                $criteria->with=array(
                  'passenger'=>array(
                    'together'=>false,
                    'select'=>false
                  ),
                );


		$criteria->compare('id',$this->id);
		$criteria->compare('passenger_id',$this->passenger_id);
		$criteria->compare('voyage_id',$this->voyage_id);
		$criteria->compare('seat_id',$this->seat_id);
		$criteria->compare('seating_class_id',$this->seating_class_id);
		$criteria->compare('transaction_no',$this->transaction_no,true);
		$criteria->compare('ticket_no',$this->ticket_no,true);
		$criteria->compare('series_no',$this->series_no,true);
		$criteria->compare('booking_no',$this->booking_no,true);
		$criteria->compare('ticket_type_id',$this->ticket_type_id);
		$criteria->compare('passenger_type_id',$this->passenger_type_id);
		$criteria->compare('price_paid',$this->price_paid,true);
                $criteria->compare('passenger.first_name',$this->first_name,true);
                $criteria->compare('passenger.last_name',$this->last_name,true);


		return new CActiveDataProvider($this, array(
		  'criteria'=>$criteria,
                  'sort'=>array(
                    'attributes'=>array(
                      'passenger.first_name'=>array(
                        'asc'=>'passenger.first_name',
                        'desc'=>'passenger.first_name DESC'
                      ),
                      'passenger.last_name'=>array(
                        'asc'=>'passenger.last_name',
                        'desc'=>'passenger.last_name DESC'
                      ),
                      'passenger.age'=>array(
                        'asc'=>'passenger.age',
                        'desc'=>'passenger.age DESC'
                      ),
                      '*',
                    )
                  ),

		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Ticket the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
