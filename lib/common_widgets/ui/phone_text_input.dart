import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_app/common_widgets/common_widgets.dart';
import 'package:hotel_app/helper_fns/validators.dart';

class PhoneTextInput extends StatefulWidget {
  const PhoneTextInput({
    super.key,
    required this.label,
    required this.onChange,
    this.initalValue = '',
    this.isError = false,
    this.validator,
    this.validateOnBlur = false,
  });

  final String label;
  final bool isError;
  final bool validateOnBlur;
  final void Function(String value) onChange;

  final String? initalValue;
  final StringValidator? validator;

  @override
  State<PhoneTextInput> createState() => _PhoneTextInputState();
}

class _PhoneTextInputState extends State<PhoneTextInput> {
  late TextEditingController controller;
  bool isLabelShown = false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextInputField(
      controller: controller,
      type: TextInputType.phone,
      label: widget.label,
      isError: widget.isError,
      inputFormatters: [EmailTextInputFormatter()],
      validateOnBlur: widget.validateOnBlur,
      validator: widget.validator,
      onChange: widget.onChange,
      onTap: () {
        if (controller.text.isEmpty) {
          controller.text = '+7 (***) ***-**-**';
          controller.selection = TextSelection.fromPosition(
            const TextPosition(offset: 4),
          );
        }
      },
    );
  }
}

class EmailTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.length > oldValue.text.length) {
      final value = handleAddition(oldValue, newValue);
      return value ?? oldValue;
    } else if (newValue.text.length < oldValue.text.length) {
      final value = handleDeletion(oldValue, newValue);
      return value ?? oldValue;
    }

    if (newValue.selection != oldValue.selection) {
      return nextEditablePos(newValue) != null ||
              nextEditablePos(newValue, reverseDir: true) != null
          ? newValue
          : oldValue;
    }

    return isValid(newValue.text) ? newValue : oldValue;
  }

  TextEditingValue? handleDeletion(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final nextPos = nextEditablePos(oldValue, reverseDir: true);
    if (nextPos == null) {
      return null;
    }

    final tail = nextPos + 1 < oldValue.text.length
        ? oldValue.text.substring(nextPos + 1)
        : '';

    final edited = oldValue.copyWith(
      text: '${oldValue.text.substring(0, nextPos)}*$tail',
      selection: TextSelection.collapsed(offset: nextPos),
    );

    if (!isValid(edited.text)) {
      return null;
    }

    final offset = nextEditablePos(edited, reverseDir: true);

    return edited.copyWith(
      text: edited.text,
      selection: TextSelection.collapsed(
        offset: offset != null ? offset + 1 : 4,
      ),
    );
  }

  TextEditingValue? handleAddition(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final nextPos = nextEditablePos(newValue);
    if (nextPos == null) {
      return null;
    }

    final digit = newValue.text[newValue.selection.start - 1];

    final edited = newValue.copyWith(
      text: '${newValue.text.substring(0, newValue.selection.start - 1)}'
          '${newValue.text.substring(newValue.selection.start, nextPos)}$digit'
          '${newValue.text.substring(nextPos + 1)}',
      selection: TextSelection.collapsed(offset: nextPos),
    );

    if (!isValid(edited.text)) {
      return null;
    }

    final editedNextPos = nextEditablePos(edited);

    return edited.copyWith(
      text: edited.text,
      selection: TextSelection.collapsed(
        offset: editedNextPos ?? edited.text.length,
      ),
    );
  }

  int? nextEditablePos(TextEditingValue value, {bool reverseDir = false}) {
    final selectionStart = max(value.selection.start, 4);

    (int, int) pos = reverseDir
        ? (
            selectionStart - 1,
            4,
          )
        : (
            selectionStart,
            value.text.length - 1,
          );

    for (int i = pos.$1;
        reverseDir ? i >= pos.$2 : i <= pos.$2;
        reverseDir ? i-- : i++) {
      if (value.text[i] == '*' || (int.tryParse(value.text[i]) != null)) {
        return i;
      }
    }

    return null;
  }

  bool isValid(String text) {
    return validatePhoneFormat(text);
  }
}
