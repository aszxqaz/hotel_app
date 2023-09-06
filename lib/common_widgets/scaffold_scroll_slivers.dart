import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_app/assets.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

class ScaffoldScrollSlivers extends StatelessWidget {
  const ScaffoldScrollSlivers({
    super.key,
    required this.title,
    required this.child,
    this.floatingAppBar = false,
    this.expanded = false,
  });
  final Widget child;
  final String title;
  final bool floatingAppBar;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final canPop = NavigationHistoryObserver().navigator?.canPop() ?? false;

    return Scaffold(
      body: Container(
        color: theme.appBarTheme.backgroundColor,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 100,
              pinned: false,
              centerTitle: true,
              title: Column(
                children: [
                  const SizedBox(
                    height: 38,
                  ),
                  Text(
                    title,
                    softWrap: true,
                  ),
                ],
              ),
              leading: canPop
                  ? Column(
                      children: [
                        const SizedBox(
                          height: 44,
                        ),
                        IconButton(
                          icon: SvgPicture.asset(svgArrowLeft),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    )
                  : null,
            ),
            if (expanded)
              SliverFillRemaining(
                hasScrollBody: false,
                child: child,
              )
            else
              SliverToBoxAdapter(
                child: child,
              ),
          ],
        ),
      ),
    );
  }
}
