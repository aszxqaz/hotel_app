import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/models.dart';

class RequestFailure implements Exception {}

class RoomsNotFoundFailure implements Exception {}

class ApiClient {
  ApiClient._();
  factory ApiClient() => _instance;

  static final _instance = ApiClient._();

  static const _baseUrl = 'run.mocky.io';

  static const _hotelPath = '/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3';
  static const _roomsPath = 'v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd';
  static const _bookingPath = '/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8';

  final http.Client _httpClient = http.Client();

  Future<Hotel> fetchHotel([Uri? uri]) async {
    final url = uri ??
        Uri.http(
          _baseUrl,
          _hotelPath,
        );

    final response = await _httpClient.get(url);

    if (response.statusCode != 200) {
      throw RequestFailure();
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    return Hotel.fromJson(json);
  }

  Future<List<Room>> fetchRooms([Uri? uri]) async {
    final url = uri ??
        Uri.http(
          _baseUrl,
          _roomsPath,
        );

    final response = await _httpClient.get(url);

    if (response.statusCode != 200) {
      throw RequestFailure();
    }

    final json = jsonDecode(response.body) as Map;

    if (!json.containsKey('rooms')) throw RoomsNotFoundFailure();

    final results = json['rooms'] as List;

    return results.map((j) => Room.fromJson(j)).toList();
  }

  Future<Booking> fetchBooking([Uri? uri]) async {
    final url = uri ??
        Uri.http(
          _baseUrl,
          _bookingPath,
        );

    final response = await _httpClient.get(url);

    if (response.statusCode != 200) {
      throw RequestFailure();
    }

    final json = jsonDecode(response.body);

    return Booking.fromJson(json);
  }
}
