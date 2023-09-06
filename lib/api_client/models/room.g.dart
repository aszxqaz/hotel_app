// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Room',
      json,
      ($checkedConvert) {
        final val = Room(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
          price: $checkedConvert('price', (v) => v as int),
          pricePer: $checkedConvert('price_per', (v) => v as String),
          peculiarities: $checkedConvert('peculiarities',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          imageUrls: $checkedConvert('image_urls',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
        );
        return val;
      },
      fieldKeyMap: const {'pricePer': 'price_per', 'imageUrls': 'image_urls'},
    );
