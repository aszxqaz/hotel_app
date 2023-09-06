import 'package:flutter/material.dart';

class Tourist {
  const Tourist({
    required this.firstname,
    required this.lastname,
    required this.birthdate,
    required this.nationality,
    required this.passportNumber,
    required this.passportExpiry,
  });

  factory Tourist.empty() {
    return const Tourist(
      firstname: '',
      lastname: '',
      birthdate: '',
      nationality: '',
      passportNumber: '',
      passportExpiry: '',
    );
  }

  factory Tourist.fromMap(Map<String, String> tourist) {
    return Tourist(
      firstname: tourist['firstname']!,
      lastname: tourist['lastname']!,
      birthdate: tourist['birthdate']!,
      nationality: tourist['nationality']!,
      passportNumber: tourist['passportNumber']!,
      passportExpiry: tourist['passportExpiry']!,
    );
  }

  final String firstname;
  final String lastname;
  final String birthdate;
  final String nationality;
  final String passportNumber;
  final String passportExpiry;

  Map<String, String> toMap([Map<String, String>? mapping]) {
    final Map<String, String> map = {};
    map[mapping?['firstname'] ?? 'firstname'] = firstname;
    map[mapping?['lastname'] ?? 'lastname'] = lastname;
    map[mapping?['birthdate'] ?? 'birthdate'] = birthdate;
    map[mapping?['nationality'] ?? 'nationality'] = nationality;
    map[mapping?['passportNumber'] ?? 'passportNumber'] = passportNumber;
    map[mapping?['passportExpiry'] ?? 'passportExpiry'] = passportExpiry;
    return map;
  }

  Tourist copyWith({
    String? firstname,
    String? lastname,
    String? birthdate,
    String? nationality,
    String? passportNumber,
    String? passportExpiry,
  }) {
    return Tourist(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      birthdate: birthdate ?? this.birthdate,
      nationality: nationality ?? this.nationality,
      passportNumber: passportNumber ?? this.passportNumber,
      passportExpiry: passportExpiry ?? this.passportExpiry,
    );
  }
}

const touristHumanMapping = {
  'firstname': 'имя',
  'lastname': 'фамилия',
  'birthdate': 'дата рождения',
  'nationality': 'гражданство',
  'passportNumber': 'номер загранпаспорта',
  'passportExpiry': 'срок действия загранпаспорта',
};

const touristInputTypeMapping = {
  'firstname': TextInputType.text,
  'lastname': TextInputType.text,
  'birthdate': TextInputType.number,
  'nationality': TextInputType.text,
  'passportNumber': TextInputType.number,
  'passportExpiry': TextInputType.text,
};
