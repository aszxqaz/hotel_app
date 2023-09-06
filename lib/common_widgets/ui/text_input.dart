import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef StringValidator = bool Function(String value);

class TextInputField extends StatefulWidget {
  const TextInputField({
    super.key,
    required this.label,
    required this.onChange,
    this.controller,
    this.isError = false,
    this.inputFormatters,
    this.initalValue = '',
    this.type,
    this.validator,
    this.validateOnBlur = false,
    this.onTap,
  });

  final String label;
  final String? initalValue;
  final TextEditingController? controller;
  final StringValidator? validator;
  final TextInputType? type;
  final bool validateOnBlur;
  final bool isError;
  final List<TextInputFormatter>? inputFormatters;

  final void Function()? onTap;
  final void Function(String value) onChange;

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  late TextEditingController controller;
  bool isLabelShown = false;
  bool isError = false;

  @override
  void didUpdateWidget(covariant TextInputField oldWidget) {
    if (widget.isError != isError) {
      setState(() {
        isError = widget.isError;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    isError = widget.isError;

    controller =
        widget.controller ?? TextEditingController(text: widget.initalValue);
    controller.addListener(_controllerListener);

    focusNode.addListener(() {
      if (widget.validator != null) {
        if (!focusNode.hasFocus) {
          if (widget.validateOnBlur) {
            setState(() {
              isError = !widget.validator!(controller.text);
            });
          }
        } else if (isError) {
          final err = !widget.validator!(controller.text);
          if (!err) {
            setState(() {
              isError = err;
            });
          }
        }
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  static const withLabelPadding = EdgeInsets.fromLTRB(16, 22, 16, 10);
  static const noLabelPadding = EdgeInsets.all(16);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: isError
            ? const Color.fromRGBO(235, 87, 87, 0.15)
            : const Color.fromRGBO(246, 246, 249, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: isLabelShown ? withLabelPadding : noLabelPadding,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            TextFormField(
              controller: controller,
              focusNode: focusNode,
              inputFormatters: widget.inputFormatters,
              keyboardType: widget.type,
              decoration: InputDecoration(
                hintText: widget.label,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                isDense: true,
                hintStyle: const TextStyle(
                  color: Color.fromRGBO(169, 171, 183, 1),
                  fontSize: 17,
                  height: 1.2,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.17,
                ),
              ),
              style: const TextStyle(
                backgroundColor: Colors.transparent,
                color: Color.fromRGBO(20, 20, 43, 1),
                height: 1.1,
                letterSpacing: 0.75,
              ),
              cursorColor: theme.colorScheme.onPrimary,
              onTap: widget.onTap,
            ),
            if (isLabelShown)
              Positioned(
                top: -15,
                child: Text(
                  widget.label,
                  style: const TextStyle(
                    color: Color.fromRGBO(169, 171, 183, 1),
                    height: 1.2,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _controllerListener() {
    widget.onChange(controller.text);

    if (controller.text.isEmpty && isLabelShown) {
      setState(() {
        isLabelShown = false;
      });
    }

    if (controller.text.isNotEmpty && !isLabelShown) {
      setState(() {
        isLabelShown = true;
      });
    }
  }
}
