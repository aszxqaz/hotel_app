import 'package:flutter/material.dart';
import 'package:hotel_app/api_client/api_client.dart';
import 'package:hotel_app/api_client/models/models.dart';
import 'package:hotel_app/common_widgets/common_widgets.dart';
import 'package:hotel_app/assets.dart';
import 'package:hotel_app/helper_fns/get_theme.dart';
import 'package:hotel_app/helper_fns/price_format_ext.dart';
import 'package:hotel_app/views/rooms_view.dart';
import 'package:hotel_app/theme.dart';

class HotelPage extends StatelessWidget {
  const HotelPage({super.key, required this.hotel});
  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    final theme = getTheme(context);

    return ScaffoldScrollSlivers(
      title: 'Отель',
      child: Container(
        color: theme.colorScheme.background,
        child: Column(
          children: [
            _HeaderWithSlider(hotel: hotel),
            _AboutWithDescription(hotel: hotel),
            _PageBottomCta(hotel: hotel),
          ],
        ),
      ),
    );
  }
}

class _AboutWithDescription extends StatelessWidget {
  const _AboutWithDescription({required this.hotel});

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return PaddedCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TitleLarge('Об отеле'),
          const SizedBox(height: 16),
          ChipsWrap(labels: hotel.aboutTheHotel.peculiarities),
          const SizedBox(height: 12),
          BodyMedium(hotel.aboutTheHotel.description),
          const SizedBox(height: 16),
          ArrowRightButtonsPanel(
            items: [
              ArrowRightButtonsPanelItem(
                title: 'Удобства',
                desc: 'Самое необходимое',
                svgImgSrc: svgEmojiHappy,
                callback: () {},
              ),
              ArrowRightButtonsPanelItem(
                title: 'Что включено',
                desc: 'Самое необходимое',
                svgImgSrc: svgTickSquare,
                callback: () {},
              ),
              ArrowRightButtonsPanelItem(
                title: 'Что не включено',
                desc: 'Самое необходимое',
                svgImgSrc: svgCloseSquare,
                callback: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeaderWithSlider extends StatelessWidget {
  const _HeaderWithSlider({required this.hotel});

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return PaddedCard(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: cardRadius,
          bottomRight: cardRadius,
        ),
      ),
      padding: const EdgeInsets.only(bottom: 16),
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          PhotoCarousel(
            images: hotel.imageUrls,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HotelInfoHeader(hotel: hotel),
                const SizedBox(height: 16),
                DetailedDisplay(
                  display: 'от ${(hotel.minimalPrice.toFormattedCurrency())}',
                  details: hotel.priceForIt,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PageBottomCta extends StatelessWidget {
  const _PageBottomCta({required this.hotel});

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return BottomCta(
      text: 'К выбору номера',
      ctaClickHandler: () async {
        showDialog(
          context: context,
          builder: (context) => LoadingView(
            text: 'Ищем номера\nв ${hotel.name}...',
            backgroundColor: colorScheme.onTertiary.withAlpha(40),
          ),
        );
        final rooms = await ApiClient().fetchRooms();
        if (context.mounted) {
          Navigator.pop(context, true);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RoomsView(
                hotelName: hotel.name,
                rooms: rooms,
                hotel: hotel,
              ),
            ),
          );
        }
      },
    );
  }
}
