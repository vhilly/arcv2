<?php
 return array(
    //models
    'model.vessel.name' => 'Vessel',
    'model.vessel.code' => 'Code',
    'model.vessel.capacity' => 'Capacity',
    'model.vessel.blocked_seats' => 'Blocked Seats',
 
    'model.route.name' => 'Route',
    'model.route.source_port' => 'Source',
    'model.route.dest_port' => 'Destination',
     
    'model.seating_class.name' => 'Seating Class',
    'model.seating_class.code' => 'Code',
    'model.seating_class.description' => 'Description',
    'model.seating_class.active' => 'Active',

    'model.port.name' => 'Port',
    'model.port.code' => 'Code',
    'model.port.default' => 'Default',

    'model.passengerType.name' => 'Passenger Type',
    'model.passengerType.code' => 'Code',
    'model.passengerType.description' => 'Description',
    'model.passengerType.active' => 'Active',

    'model.passenger.fname' => 'First Name',
    'model.passenger.lname' => 'Last Name',
    'model.passenger.age' => 'Age',
 
    'model.baggageType.weight' => 'Weight',
    'model.baggageType.description' => 'Description',
    'model.baggageType.price' => 'Price',
    'model.baggageType.active' => 'Active',

    //labels
    'label.ticket.booth'=>'Ticket Booth',
    'label.ticket.cargo'=>'Cargo',
    'label.checkin'=>'Checkin',
    'label.tickets'=>'Tickets',
    'label.waybills'=>'Way Bills',
    'label.voyage'=>'Voyage',
    'label.seatingclass'=>'Seat Class',
    'label.seat'=>'Seats',
    'label.seat-available'=>'Seats View',
    'label.passengertype'=>'Pass Type',
    'label.passengerfare'=>'Pass Fare',
    'label.baggagetype'=>'Bagg Type',
    'label.cargoclass'=>'Cargo Class',
    'label.voyage.add'=>'Add Voyage',
    'label.vessel.add'=>'Add Vessel',
    'label.route.add'=>'Add Route',
    'label.seatingclass.add'=>'Add New',
    'label.cargoclass.add'=>'Add New Cargo Class',
    'label.passengertype.add'=>'Add New Passenger Type',
    'label.baggagetype.add'=>'Add New Baggage Type',
    'label.ticketing.seriesBeginAt'=>'Series Begins At',
    
     'model.voyage.voyageNumber'=>'Voyage Number',
     'model.voyage.vessel_id'=>'Vessel',
     'model.voyage.route_id'=>'Route',
     'model.voyage.departure_date'=>'Departure Date',
     'model.voyage.departure_time'=>'Departure Time',
     'model.voyage.arrival_time'=>'Arrival Time',
     'model.voyage.voyage_status'=>'Status',

    'label.add'=>'Add',
    'label.update'=>'Update',
    'label.cancel'=>'Cancel',
    'label.back'=>'Back',

    'label.vessel'=>'Vessel',
    'label.port'=>'Port',
    'label.port.add'=>'Add Port',
    'label.route'=>'Route',
    'label.vessel.update'=>'Update Vessel',
    'label.passengerFare'=>'Fares',
    'label.passengerFareFull'=>'Passenger Fares',
    'label.cargoRate'=>'Cargo Rate',
    'label.cargoRateFull'=>'Cargo Rates',

    'label.ticketing.preloader.message'=>'PROCESSING PLEASE... WAIT...',
    'label.ticketing.departure'=>'DEPARTURE',
    'label.ticketing.seatsAvailable'=>'SEATS AVAILABLE',
    'label.ticketing.seriesBeginsAt'=>'Series Begins At',
    //notices
    'notice.success.vessel.create'=>'Vessel has been added!',
    'notice.failed.vessel.create'=>'Unable to add vessel! Vessel name and code must be unique.',

    'notice.success.vessel.update'=>'Vessel has been updated!',
    'notice.failed.vessel.update'=>'Unable to update vessel! Vessel name and code must be unique.',

    'notice.success.voyage.create'=>'Voyage has been added!',
    'notice.failed.voyage.create'=>'Unable to add voyage! Voyage name and code must be unique.',

    'notice.success.voyage.update'=>'Voyage has been updated!',
    'notice.failed.voyage.update'=>'Unable to update voyage! Voyage name and code must be unique.',

    'notice.failed.ticket.emptySeat'=>'Not enough seat/s available!',
    'notice.success.ticket.create'=>'Ticket/s successfully created! Total Amount: ',

    'notice.success.seatingclass.create'=>'Seating Class has been added!',
    'notice.failed.seatingclass.create'=>'Unable to add Seating Class! Seating Class  must be unique.',

    'notice.success.seatingclass.update'=>'Seating Class has been updated!',
    'notice.update.seatingclass.create'=>'Unable to update Seating Class! Seating Class  must be unique.',

    'notice.success.passengertype.create'=>'Passenger Type has been added!',
    'notice.success.passengertype.update'=>'Passenger Type has been updated!',

    'notice.success.baggagetype.create'=>'Baggage Type has been added!',
    'notice.success.baggagetype.update'=>'Baggage Type has been updated!',

    'notice.success.route.create'=>'Route has been added!',
    'notice.failed.route.create'=>'Unable to add route! Route name must be unique.',
 
    'notice.success.route.update'=>'Route has been updated!',
    'notice.failed.route.update'=>'Unable to update route! Route name must be unique.',

    'notice.success.port.create'=>'Port has been created!',
    'notice.failed.port.create'=>'Unable to Create Port! Port name and Code must me unique!',

    'notice.success.port.update'=>'Port has been updated!',
    'notice.failed.port.update'=>'Unable to Update Port! Port name and Code must me unique!',

    'notice.success.passengerFare.update'=>'Passenger Fare has been updated!',

    'notice.success.voyage.statusUpdate'=>'Voyage Status has been updated!',

    'notice.failed.ticket.used'=>'Ticket Already Used!',
    'notice.success.cargoRate.update'=>'Cargo Rate has been updated',

    //alert
    'alert.ticketing.series.beginsAt'=>'Series Begins At',
    'alert.ticketing.series.invalidNumber'=>'Invalid Number!',
    'alert.ticketing.series.pleaseInput'=>'Invalid Number!',
    'alert.ticketing.series.confirm'=>'Are you sure?',


    'inst.req.seat'=>'You need to add seats first!',
    'inst.req.following'=>'Ooops! You need to fix the following:',
    'inst.req.seatingClass'=>'Seating Class (required)',
    'inst.req.passengerType'=>'Passenger Type (required)',
    'inst.req.route'=>'Route (required)',
    'inst.req.vessel'=>'Vessel (required)',
    'inst.req.port'=>'Port (required)',
  );
?>
