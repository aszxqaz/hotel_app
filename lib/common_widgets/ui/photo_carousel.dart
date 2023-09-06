import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/assets.dart';
import 'package:hotel_app/common_widgets/common_widgets.dart';

class PhotoCarousel extends StatefulWidget {
  const PhotoCarousel({super.key, required this.images});

  final List<String> images;

  @override
  State<PhotoCarousel> createState() => _PhotoCarouselState();
}

class _PhotoCarouselState extends State<PhotoCarousel> {
  late PageController pageController;
  int activePage = 0;

  late Image errPlaceholder;

  @override
  void initState() {
    pageController = PageController(initialPage: activePage);
    errPlaceholder = Image.asset(errImgPlaceholder);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(errPlaceholder.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
          children: [
            AspectRatio(
              aspectRatio: 1.335,
              child: PageView.builder(
                itemCount: widget.images.length,
                onPageChanged: (page) {
                  setState(() {
                    activePage = page;
                  });
                },
                itemBuilder: (context, idx) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl: widget.images[idx],
                        errorWidget: (_, __, ___) => errPlaceholder,
                        placeholder: (_, __) => Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(238, 238, 238, 1),
                          ),
                          child: Spinner(),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 8,
              left: 0,
              child: SizedBox(
                width: constraints.constrainWidth(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _SliderIndicator(
                      activeIndex: activePage,
                      count: widget.images.length,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _SliderIndicator extends StatelessWidget {
  const _SliderIndicator({
    required this.activeIndex,
    required this.count,
  });

  final int activeIndex;
  final int count;

  static const opacities = [0.22, 0.17, 0.1, 0.05];
  // static const circleSize

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        // width: 200,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            children: List.generate(
              count * 2 - 1,
              (index) => index % 2 == 0
                  ? Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == activeIndex * 2
                            ? Colors.black
                            : Color.fromRGBO(
                                0,
                                0,
                                0,
                                opacities[(((index - activeIndex).abs() / 2)
                                            .truncate() -
                                        1)
                                    .clamp(0, opacities.length - 1)],
                              ),
                      ),
                    )
                  : const SizedBox(
                      width: 5,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
