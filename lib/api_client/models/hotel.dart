import 'package:json_annotation/json_annotation.dart';

part 'hotel.g.dart';

@JsonSerializable()
class AboutHotel {
  const AboutHotel({
    required this.description,
    required this.peculiarities,
  });

  factory AboutHotel.fromJson(Map<String, dynamic> json) =>
      _$AboutHotelFromJson(json);

  final String description;
  final List<String> peculiarities;
}

@JsonSerializable()
class Hotel {
  const Hotel({
    required this.id,
    required this.name,
    required this.address,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.aboutTheHotel,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);

  final int id;
  final String name;

  @JsonKey(name: 'adress')
  final String address;

  final int minimalPrice;
  final String priceForIt;
  final int rating;
  final String ratingName;
  final List<String> imageUrls;
  final AboutHotel aboutTheHotel;
}
