// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutHotel _$AboutHotelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'AboutHotel',
      json,
      ($checkedConvert) {
        final val = AboutHotel(
          description: $checkedConvert('description', (v) => v as String),
          peculiarities: $checkedConvert('peculiarities',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
        );
        return val;
      },
    );

Hotel _$HotelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Hotel',
      json,
      ($checkedConvert) {
        final val = Hotel(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
          address: $checkedConvert('adress', (v) => v as String),
          minimalPrice: $checkedConvert('minimal_price', (v) => v as int),
          priceForIt: $checkedConvert('price_for_it', (v) => v as String),
          rating: $checkedConvert('rating', (v) => v as int),
          ratingName: $checkedConvert('rating_name', (v) => v as String),
          imageUrls: $checkedConvert('image_urls',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          aboutTheHotel: $checkedConvert('about_the_hotel',
              (v) => AboutHotel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'address': 'adress',
        'minimalPrice': 'minimal_price',
        'priceForIt': 'price_for_it',
        'ratingName': 'rating_name',
        'imageUrls': 'image_urls',
        'aboutTheHotel': 'about_the_hotel'
      },
    );
