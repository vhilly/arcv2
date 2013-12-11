<?php

/**
 * This is the model class for table "ticket".
 *
 * The followings are the available columns in table 'ticket':
 * @property integer $id
 * @property integer $passenger
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
			array('passenger, voyage, seat, seating_class,created_by, ticket_type, passenger_type', 'numerical', 'integerOnly'=>true),
			array('transaction_no, ticket_no, series_no, booking_no', 'length', 'max'=>100),
			array('price_paid', 'length', 'max'=>20),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, passenger,status, voyage, seat, seating_class, transaction_no, ticket_no, series_no, booking_no, ticket_type, passenger_type, price_paid,last_name,first_name', 'safe', 'on'=>'search'),
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
			'passengerType' => array(self::BELONGS_TO, 'PassengerType', 'passenger_type'),
			'voyage0' => array(self::BELONGS_TO, 'Voyage', 'voyage'),
			'seatingClass' => array(self::BELONGS_TO, 'SeatingClass', 'seating_class'),
			'passenger0' => array(self::BELONGS_TO, 'Passenger', 'passenger'),
			'createdby' => array(self::BELONGS_TO, 'Users', 'created_by'),
			'seat0' => array(self::BELONGS_TO, 'Seat', 'seat'),
			'status0' => array(self::BELONGS_TO, 'Status', 'status'),
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
			'voyage' => 'Voyage',
			'seat' => 'Seat',
			'seating_class' => 'Seating Class',
			'transaction_no' => 'Transaction No',
			'ticket_no' => 'Ticket No',
			'series_no' => 'Series No',
			'status' => 'Status',
			'booking_no' => 'Booking No',
			'ticket_type' => 'Ticket Type',
			'passenger_type' => 'Passenger Type',
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
                  'passenger0'=>array(
                    'together'=>false,
                    'select'=>false
                  ),
                );


		$criteria->compare('id',$this->id);
		$criteria->compare('passenger',$this->passenger);
		$criteria->compare('voyage',$this->voyage);
		$criteria->compare('seat',$this->seat);
		$criteria->compare('status',$this->status);
		$criteria->compare('seating_class',$this->seating_class);
		$criteria->compare('transaction_no',$this->transaction_no,true);
		$criteria->compare('ticket_no',$this->ticket_no,true);
		$criteria->compare('series_no',$this->series_no,true);
		$criteria->compare('booking_no',$this->booking_no,true);
		$criteria->compare('ticket_type',$this->ticket_type);
		$criteria->compare('passenger_type',$this->passenger_type);
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
