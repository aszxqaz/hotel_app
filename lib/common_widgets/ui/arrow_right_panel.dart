import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_app/common_widgets/ui/typography.dart';
import 'package:hotel_app/assets.dart';
import 'package:hotel_app/helper_fns/get_theme.dart';
import 'package:hotel_app/theme.dart';

class ArrowRightButtonsPanelItem {
  const ArrowRightButtonsPanelItem({
    required this.title,
    required this.desc,
    required this.svgImgSrc,
    required this.callback,
  });

  final String title;
  final String desc;
  final String svgImgSrc;
  final void Function() callback;
}

class ArrowRightButtonsPanel extends StatelessWidget {
  const ArrowRightButtonsPanel({super.key, required this.items});
  final List<ArrowRightButtonsPanelItem> items;

  @override
  Widget build(BuildContext context) {
    final theme = getTheme(context);
    return ClipRRect(
      borderRadius: const BorderRadius.all(accordionRadius),
      child: Container(
        color: theme.chipTheme.backgroundColor,
        child: Column(
          children: List.generate(
            items.length * 2 - 1,
            (idx) {
              final realIdx = idx ~/ 2;
              final isButton = idx % 2 == 0;
              final lastIdx = items.length * 2 - 1;

              return isButton
                  ? Material(
                      child: InkWell(
                        borderRadius: borderRadiusFromPosition(idx, lastIdx),
                        onTap: items[realIdx].callback,
                        child: Padding(
                          padding: paddingFromPosition(idx, lastIdx),
                          child: Row(
                            children: [
                              SvgPicture.asset(items[realIdx].svgImgSrc),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    items[realIdx].title,
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  BodySmall(items[realIdx].desc),
                                ],
                              ),
                              const Spacer(),
                              SvgPicture.asset(svgArrowRight),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const Padding(
                      padding: EdgeInsets.only(left: 53, right: 15),
                      child: Divider(),
                    );
            },
          ),
        ),
      ),
    );
  }

  BorderRadius? borderRadiusFromPosition(int idx, int lastIdx) {
    return idx == 0
        ? const BorderRadius.only(
            topLeft: accordionRadius,
            topRight: accordionRadius,
          )
        : idx == lastIdx
            ? const BorderRadius.only(
                bottomLeft: accordionRadius,
                bottomRight: accordionRadius,
              )
            : null;
  }

  EdgeInsetsGeometry paddingFromPosition(int idx, int lastIdx) {
    return idx == 0
        ? const EdgeInsets.fromLTRB(15, 15, 15, 10)
        : idx == lastIdx
            ? const EdgeInsets.fromLTRB(15, 10, 15, 15)
            : const EdgeInsets.fromLTRB(15, 10, 15, 10);
  }
}
