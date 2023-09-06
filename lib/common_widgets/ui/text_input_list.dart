import 'package:flutter/material.dart';
import 'package:hotel_app/common_widgets/common_widgets.dart';

class TextInputProps {
  const TextInputProps({
    required this.key,
    required this.label,
    this.type,
    this.initialValue = '',
    this.validator,
    this.isError = false,
  });
  final String key;
  final String label;
  final String? initialValue;
  final TextInputType? type;
  final StringValidator? validator;
  final bool isError;
}

class TextInputList extends StatelessWidget {
  const TextInputList({
    super.key,
    required this.options,
    required this.onChange,
  });
  final List<TextInputProps> options;
  final void Function(String key, String value) onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        options.length * 2 - 1,
        (i) => i % 2 == 0
            ? TextInputField(
                initalValue: options[i ~/ 2].initialValue,
                label: options[i ~/ 2].label,
                type: options[i ~/ 2].type,
                validator: options[i ~/ 2].validator,
                onChange: carriedOnChange(options[i ~/ 2].key),
                isError: options[i ~/ 2].isError,
              )
            : const SizedBox(height: 8),
      ),
    );
  }

  Function(String value) carriedOnChange(String key) => (String value) {
        onChange(key, value);
      };
}
