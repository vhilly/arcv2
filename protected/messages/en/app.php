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

    //labels
    'label.ticket.booth'=>'Ticket Booth',
    'label.ticket.cargo'=>'Cargo',
    'label.checkin'=>'Checkin',
    'label.tickets'=>'Tickets',
    'label.waybills'=>'Way Bills',
    'label.voyage'=>'Voyage',
    'label.seatingclass'=>'Seat Class',
    'label.seat'=>'Seats',
    'label.passengertype'=>'Pass Type',
    'label.cargoclass'=>'Cargo Class',
    'label.voyage.add'=>'Add Voyage',
    'label.vessel.add'=>'Add Vessel',
    'label.route.add'=>'Add Route',
    'label.seatingclass.add'=>'Add New',
    'label.passengertype.add'=>'Add New Passenger Type',
    
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

    'label.ticketing.preloader.message'=>'PROCESSING PLEASE... WAIT...',
    'label.ticketing.departure'=>'DEPARTURE',
    'label.ticketing.seatsAvailable'=>'SEATS AVAILABLE',
    'label.ticketing.seriesBeginsAt'=>'Series Begins At',
    //notices
    'notice.success.vessel.create'=>'Vessel has been added!',
    'notice.failed.vessel.create'=>'Unable to add vessel! Vessel name and code must be unique.',

    'notice.success.vessel.update'=>'Vessel has been updated!',
    'notice.failed.vessel.update'=>'Unable to update vessel! Vessel name and code must be unique.',

    //alert
    'alert.ticketing.series.beginsAt'=>'Series Begins At',
    'alert.ticketing.series.invalidNumber'=>'Invalid Number!',
    'alert.ticketing.series.pleaseInput'=>'Invalid Number!',
    'alert.ticketing.series.confirm'=>'Are you sure?',
  );
?>
