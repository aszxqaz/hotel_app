// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Booking',
      json,
      ($checkedConvert) {
        final val = Booking(
          id: $checkedConvert('id', (v) => v as int),
          hotelName: $checkedConvert('hotel_name', (v) => v as String),
          hotelAddress: $checkedConvert('hotel_adress', (v) => v as String),
          horating: $checkedConvert('horating', (v) => v as int),
          ratingName: $checkedConvert('rating_name', (v) => v as String),
          departure: $checkedConvert('departure', (v) => v as String),
          arrivalCountry:
              $checkedConvert('arrival_country', (v) => v as String),
          tourDateStart: $checkedConvert('tour_date_start', (v) => v as String),
          tourDateStop: $checkedConvert('tour_date_stop', (v) => v as String),
          numberOfNights: $checkedConvert('number_of_nights', (v) => v as int),
          room: $checkedConvert('room', (v) => v as String),
          nutrition: $checkedConvert('nutrition', (v) => v as String),
          tourPrice: $checkedConvert('tour_price', (v) => v as int),
          fuelCharge: $checkedConvert('fuel_charge', (v) => v as int),
          serviceCharge: $checkedConvert('service_charge', (v) => v as int),
        );
        return val;
      },
      fieldKeyMap: const {
        'hotelName': 'hotel_name',
        'hotelAddress': 'hotel_adress',
        'ratingName': 'rating_name',
        'arrivalCountry': 'arrival_country',
        'tourDateStart': 'tour_date_start',
        'tourDateStop': 'tour_date_stop',
        'numberOfNights': 'number_of_nights',
        'tourPrice': 'tour_price',
        'fuelCharge': 'fuel_charge',
        'serviceCharge': 'service_charge'
      },
    );
