import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_app/api_client/models/models.dart';
import 'package:hotel_app/common_widgets/ui/typography.dart';
import 'package:hotel_app/assets.dart';

class HotelInfoHeader extends StatelessWidget {
  const HotelInfoHeader({super.key, required this.hotel});

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StarsRank(
          rating: hotel.rating,
          ratingName: hotel.ratingName,
        ),
        const SizedBox(height: 8),
        TitleLarge(hotel.name),
        const SizedBox(height: 8),
        Text(
          hotel.address,
          style: theme.textTheme.bodySmall!.copyWith(
            color: theme.colorScheme.onTertiary,
          ),
        ),
      ],
    );
  }
}

class _StarsRank extends StatelessWidget {
  const _StarsRank({
    required this.ratingName,
    required this.rating,
  });
  final String ratingName;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color.fromRGBO(255, 199, 0, 0.2),
          ),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                svgStar,
                colorFilter: const ColorFilter.mode(
                  Color.fromRGBO(255, 168, 0, 1),
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                '$ratingName $rating',
                style: const TextStyle(
                  color: Color.fromRGBO(255, 168, 0, 1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
