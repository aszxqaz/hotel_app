import 'package:flutter/material.dart';
import 'package:hotel_app/common_widgets/common_widgets.dart';
import 'package:hotel_app/assets.dart';

class Expandable extends StatefulWidget {
  const Expandable({
    super.key,
    required this.child,
    required this.title,
    this.expanded = false,
  });
  final Widget child;
  final String title;
  final bool expanded;

  @override
  State<Expandable> createState() => _ExpandableState();
}

class _ExpandableState extends State<Expandable> {
  late bool hfSwitch;

  @override
  void initState() {
    hfSwitch = widget.expanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TitleLarge(widget.title),
            AnimatedRotation(
              turns: hfSwitch ? 0.5 : 0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              child: AppIconButton(
                svgSrc: svgArrowDown,
                onPressed: () {
                  setState(() {
                    hfSwitch = !hfSwitch;
                  });
                },
                inversed: true,
              ),
            ),
          ],
        ),
        ClipRect(
          child: AnimatedAlign(
            alignment: Alignment.topCenter,
            heightFactor: hfSwitch ? 1 : 0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            child: widget.child,
          ),
        ),
      ],
    );
  }
}
