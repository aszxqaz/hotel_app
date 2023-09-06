// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hotel_app/common_widgets/common_widgets.dart';
import 'package:test/test.dart';

void main() {
  group('EmailTextInputFormatter', () {
    final formatter = EmailTextInputFormatter();

    test('isValid() acts as expected', () {
      String text = '+7 (999)****-**-**';
      expect(formatter.isValid(text), equals(false));

      text = '+7 (***) 1***-**-**';
      expect(formatter.isValid(text), equals(false));

      text = '+7 (***) **-**-**';
      expect(formatter.isValid(text), equals(false));

      text = '+7 (***) ***-**-**';
      expect(formatter.isValid(text), equals(true));

      text = '+7 (***) ***-**-***';
      expect(formatter.isValid(text), equals(false));

      text = '+7 (*** ***-**-**';
      expect(formatter.isValid(text), equals(false));

      text = '+7 (999) **-***-**';
      expect(formatter.isValid(text), equals(false));

      text = '+7 (***) **-***-**';
      expect(formatter.isValid(text), equals(false));

      text = '+7 (999) ***-**-**';
      expect(formatter.isValid(text), equals(true));

      text = '+7*(999) 1**-**-**';
      expect(formatter.isValid(text), equals(false));

      text = '+77 (9**) 1**-**-**';
      expect(formatter.isValid(text), equals(false));

      text = '+7 (999) ***-**-11';
      expect(formatter.isValid(text), equals(true));

      text = '+7 (999) *23-**-*1';
      expect(formatter.isValid(text), equals(true));
    });

    test('nextEditablePos() acts as expected', () {
      var value = TextEditingValue(
        text: '+7 (***) ***-**-**',
        selection: TextSelection.collapsed(offset: 0),
      );
      expect(formatter.nextEditablePos(value), equals(4));

      value = TextEditingValue(
        text: '+7 (999) ***-**-**',
        selection: TextSelection.collapsed(offset: 7),
      );
      expect(formatter.nextEditablePos(value), equals(9));

      value = TextEditingValue(
        text: '+7 (999) 2**-**-**',
        selection: TextSelection.collapsed(offset: 10),
      );
      expect(formatter.nextEditablePos(value), equals(10));

      value = TextEditingValue(
        text: '+7 (999) 22*-**-**',
        selection: TextSelection.collapsed(offset: 11),
      );
      expect(formatter.nextEditablePos(value), equals(11));

      value = TextEditingValue(
        text: '+7 (999) 222-**-**',
        selection: TextSelection.collapsed(offset: 12),
      );
      expect(formatter.nextEditablePos(value), equals(13));

      value = TextEditingValue(
        text: '+7 (999) 222-22-**',
        selection: TextSelection.collapsed(offset: 14),
      );
      expect(formatter.nextEditablePos(value), equals(14));

      value = TextEditingValue(
        text: '+7 (999) 222-22-**',
        selection: TextSelection.collapsed(offset: 15),
      );
      expect(formatter.nextEditablePos(value), equals(16));

      value = TextEditingValue(
        text: '+7 (999) 222-22-2*',
        selection: TextSelection.collapsed(offset: 17),
      );
      expect(formatter.nextEditablePos(value), equals(17));

      value = TextEditingValue(
        text: '+7 (999) 222-22-22',
        selection: TextSelection.collapsed(offset: 18),
      );
      expect(formatter.nextEditablePos(value), equals(null));

      value = TextEditingValue(
        text: '+7 (999) 222-22-22',
        selection: TextSelection.collapsed(offset: 18),
      );
      expect(formatter.nextEditablePos(value, reverseDir: true), equals(17));

      value = TextEditingValue(
        text: '+7 (999) 222-22-2*',
        selection: TextSelection.collapsed(offset: 17),
      );
      expect(formatter.nextEditablePos(value, reverseDir: true), equals(16));

      value = TextEditingValue(
        text: '+7 (999) 222-22-**',
        selection: TextSelection.collapsed(offset: 16),
      );
      expect(formatter.nextEditablePos(value, reverseDir: true), equals(14));

      value = TextEditingValue(
        text: '+7 (999) 222-2*-**',
        selection: TextSelection.collapsed(offset: 14),
      );
      expect(formatter.nextEditablePos(value, reverseDir: true), equals(13));

      value = TextEditingValue(
        text: '+7 (999) 222-**-**',
        selection: TextSelection.collapsed(offset: 13),
      );
      expect(formatter.nextEditablePos(value, reverseDir: true), equals(11));

      value = TextEditingValue(
        text: '+7 (999) 22*-**-**',
        selection: TextSelection.collapsed(offset: 11),
      );
      expect(formatter.nextEditablePos(value, reverseDir: true), equals(10));

      value = TextEditingValue(
        text: '+7 (999) 2**-**-**',
        selection: TextSelection.collapsed(offset: 10),
      );
      expect(formatter.nextEditablePos(value, reverseDir: true), equals(9));

      value = TextEditingValue(
        text: '+7 (999) ***-**-**',
        selection: TextSelection.collapsed(offset: 9),
      );
      expect(formatter.nextEditablePos(value, reverseDir: true), equals(6));

      value = TextEditingValue(
        text: '+7 (99*) ***-**-**',
        selection: TextSelection.collapsed(offset: 6),
      );
      expect(formatter.nextEditablePos(value, reverseDir: true), equals(5));

      value = TextEditingValue(
        text: '+7 (9**) ***-**-**',
        selection: TextSelection.collapsed(offset: 5),
      );
      expect(formatter.nextEditablePos(value, reverseDir: true), equals(4));

      value = TextEditingValue(
        text: '+7 (***) ***-**-**',
        selection: TextSelection.collapsed(offset: 4),
      );
      expect(formatter.nextEditablePos(value, reverseDir: true), equals(null));
    });
  });
}
