import 'package:hotel_app/helper_fns/price_format_ext.dart';
import 'package:test/test.dart';

void main() {
  test('toFormattedCurrency() acts as expected', () {
    int price = 123;
    expect(price.toFormattedCurrency(), equals('123 ₽'));
    expect(price.toFormattedCurrency(Locale.en), equals('\$ 123'));

    price = 1234;
    expect(price.toFormattedCurrency(), equals('1 234 ₽'));
    expect(price.toFormattedCurrency(Locale.en), equals('\$ 1,234'));

    price = 1234567;
    expect(price.toFormattedCurrency(), equals('1 234 567 ₽'));
    expect(price.toFormattedCurrency(Locale.en), equals('\$ 1,234,567'));

    price = 123456789;
    expect(price.toFormattedCurrency(), equals('123 456 789 ₽'));
    expect(price.toFormattedCurrency(Locale.en), equals('\$ 123,456,789'));
  });
}
