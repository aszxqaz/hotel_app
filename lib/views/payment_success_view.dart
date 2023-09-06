import 'package:flutter/material.dart';
import 'package:hotel_app/common_widgets/common_widgets.dart';
import 'package:hotel_app/assets.dart';
import 'package:hotel_app/views/home_view.dart';

class PaymentSuccessView extends StatelessWidget {
  const PaymentSuccessView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScaffoldScrollSlivers(
      title: 'Заказ оплачен',
      expanded: true,
      floatingAppBar: true,
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Column(
          children: [
            const Spacer(flex: 122),
            Image.asset(successImg),
            const SizedBox(height: 32),
            const TitleLarge('Ваш заказ принят в работу'),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: BodyMediumSecondary(
                'Подтверждение заказа №123123 может занять некоторое время'
                '(от 1 часа до суток). Как только мы получим ответ от туроператора, '
                'вам на почту придет уведомление.',
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(flex: 234),
            BottomCta(
              text: 'Супер!',
              ctaClickHandler: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => HomeView()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
