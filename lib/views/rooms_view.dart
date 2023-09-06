import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/api_client/api_client.dart';
import 'package:hotel_app/api_client/models/models.dart';
import 'package:hotel_app/common_widgets/common_widgets.dart';
import 'package:hotel_app/helper_fns/price_format_ext.dart';
import 'package:hotel_app/views/booking_view.dart';

class RoomsView extends StatelessWidget {
  const RoomsView({
    super.key,
    required this.hotelName,
    required this.rooms,
    required this.hotel,
  });
  final String hotelName;
  final Hotel hotel;
  final List<Room> rooms;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ScaffoldScrollSlivers(
      floatingAppBar: true,
      title: hotelName,
      child: Container(
        color: theme.colorScheme.background,
        child: Column(
          children: rooms
                  .mapIndexed<Widget>(
                    (idx, room) => PaddedCard(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      margin: EdgeInsets.fromLTRB(0, idx == 0 ? 8 : 4, 0, 4),
                      child: Column(
                        children: [
                          PhotoCarousel(images: room.imageUrls),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                TitleLarge(room.name),
                                const SizedBox(height: 8),
                                ChipsWrap(labels: room.peculiarities),
                                const SizedBox(height: 8),
                                AuxButton(
                                  text: 'Подробнее о номере',
                                  onPressed: () {},
                                ),
                                const SizedBox(height: 16),
                                DetailedDisplay(
                                  display: room.price.toFormattedCurrency(),
                                  details: room.pricePer,
                                ),
                                const SizedBox(height: 16),
                                CtaButton(
                                  text: 'Выбрать номер',
                                  onPressed: () async {
                                    showDialog(
                                      context: context,
                                      builder: (context) => LoadingView(
                                        text: 'Собираем данные...',
                                        backgroundColor: theme
                                            .colorScheme.onTertiary
                                            .withAlpha(40),
                                      ),
                                    );

                                    final booking =
                                        await ApiClient().fetchBooking();

                                    if (context.mounted) {
                                      Navigator.pop(context, true);
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => BookingView(
                                            hotel: hotel,
                                            room: room,
                                            booking: booking,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList() +
              [const SizedBox(height: 12)],
        ),
      ),
    );
  }
}
