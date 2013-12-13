SET FOREIGN_KEY_CHECKS=0;
TRUNCATE baggage;
TRUNCATE cargo;
TRUNCATE passenger;
TRUNCATE price_history;
/*
TRUNCATE seat;
TRUNCATE passenger_fare;
TRUNCATE cargo_fare_rates;
TRUNCATE cargo_class;
TRUNCATE passenger_type;
TRUNCATE port;
TRUNCATE route;
TRUNCATE seating_class;
TRUNCATE vessel;
TRUNCATE schedule;
*/
TRUNCATE ticket;
TRUNCATE voyage;
TRUNCATE upgrades;
TRUNCATE waybill;

UPDATE counter SET value = 0 WHERE value > 0;

SET FOREIGN_KEY_CHECKS=1;
