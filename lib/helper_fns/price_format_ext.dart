import 'dart:math';

enum Locale { ru, en }

class PriceFormat {
  const PriceFormat(this.sign, this.separator, this.insertLeft);
  final String sign;
  final String separator;
  final bool insertLeft;
}

const Map<Locale, PriceFormat> priceFormats = {
  Locale.ru: PriceFormat('₽', ' ', false),
  Locale.en: PriceFormat('\$', ',', true),
};

extension ToFormattedCurrency on int {
  String toFormattedCurrency([Locale locale = Locale.ru]) {
    final str = toString();
    final len = str.length;
    final format = priceFormats[locale]!;

    final formatted = Iterable.generate(
      (len / 3).ceil(),
      (i) => str.substring(
        max(0, len - (i + 1) * 3),
        max(0, len - i * 3),
      ),
    ).toList().reversed.join(format.separator);

    return format.insertLeft
        ? '${format.sign} $formatted'
        : '$formatted ${format.sign}';
  }
}
