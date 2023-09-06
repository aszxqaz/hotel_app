import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/api_client/models/models.dart';
import 'package:hotel_app/assets.dart';
import 'package:hotel_app/common_widgets/common_widgets.dart';
import 'package:hotel_app/common_widgets/ui/show_alert.dart';
import 'package:hotel_app/helper_fns/capitalize_ext.dart';
import 'package:hotel_app/helper_fns/price_format_ext.dart';
import 'package:hotel_app/helper_fns/validators.dart';
import 'package:hotel_app/models/models.dart';
import 'package:hotel_app/views/payment_success_view.dart';

class BookingView extends StatefulWidget {
  const BookingView({
    super.key,
    required this.booking,
    required this.hotel,
    required this.room,
  });

  final Hotel hotel;
  final Room room;
  final Booking booking;

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  final List<Map<String, String>> tourists = [Tourist.empty().toMap()];
  final customer = Customer.empty().toMap();

  List<Map<String, bool>> touristErrors = [{}];
  Map<String, bool> customerErrors = {};

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ScaffoldScrollSlivers(
      floatingAppBar: true,
      title: 'Бронирование',
      child: Container(
        color: theme.colorScheme.background,
        child: Column(
          children: [
            PaddedCard(
              margin: const EdgeInsets.only(top: 8, bottom: 4),
              child: HotelInfoHeader(hotel: widget.hotel),
            ),
            PaddedCard(
              child: SimpleTable(
                data: getBookingDetails(
                  widget.hotel,
                  widget.room,
                  widget.booking,
                ),
              ),
            ),
            PaddedCard(
              child: _CustomerInfo(
                customer: customer,
                emailError: customerErrors['email'] ?? false,
                phoneError: customerErrors['phone'] ?? false,
              ),
            ),
            ...tourists.mapIndexed(
              (i, tourist) => PaddedCard(
                child: Expandable(
                  expanded: i == 0 ? true : false,
                  title: contentBookViewTouristNumeralTitle(i + 1),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextInputList(
                      options: getTouristTextInputOptions(
                        tourist,
                        touristErrors[i],
                      ),
                      onChange: (key, value) {
                        tourist[key] = value;
                      },
                    ),
                  ),
                ),
              ),
            ),
            PaddedCard(
              child: OptionAction(
                text: 'Добавить туриста',
                svgSrc: svgPlus,
                handleActionClick: addTourist,
              ),
            ),
            PaddedCard(
              child: SpaceBetweenTable(
                accentLast: true,
                data: getSummaryPriceData(widget.booking),
              ),
            ),
            BottomCta(
              text:
                  'Оплатить ${calcTotalPrice(widget.booking).toFormattedCurrency()}',
              ctaClickHandler: () async {
                if (!validateAllMutable()) {
                  setState(() {});
                  showAlert(context, text: 'Поля необходимо заполнить');
                } else {
                  if (context.mounted) {
                    Navigator.pop(context, true);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const PaymentSuccessView(),
                      ),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  bool validateAllMutable() {
    bool valid = true;
    for (int i = 0; i < tourists.length; i++) {
      for (var entry in tourists[i].entries) {
        if (entry.value.trim().isEmpty) {
          touristErrors[i][entry.key] = true;
          valid = false;
        } else {
          touristErrors[i][entry.key] = false;
        }
      }
    }

    final p =
        customerErrors['phone'] = !validatePhoneNumber(customer['phone'] ?? '');
    final e = customerErrors['email'] = !validateEmail(customer['email'] ?? '');

    return valid && !p & !e;
  }

  void addTourist() {
    if (validateAllMutable()) {
      setState(() {
        tourists.add(Tourist.empty().toMap());
        touristErrors.add({});
      });
    } else {
      setState(() {});
      showAlert(context, text: 'Не все поля заполнены, чтобы добавить туриста');
    }
  }

  Map<String, String> getSummaryPriceData(Booking booking) => {
        'Тур': booking.tourPrice.toFormattedCurrency(),
        'Топливный сбор': booking.fuelCharge.toFormattedCurrency(),
        'Сервисный сбор': booking.serviceCharge.toFormattedCurrency(),
        'К оплате': calcTotalPrice(booking).toFormattedCurrency(),
      };

  int calcTotalPrice(Booking booking) =>
      booking.tourPrice + booking.fuelCharge + booking.serviceCharge;

  Map<String, String> getBookingDetails(
    Hotel hotel,
    Room room,
    Booking booking,
  ) {
    final nights = booking.numberOfNights;

    return {
      'Вылет из': booking.departure,
      'Страна, город': booking.arrivalCountry,
      'Даты': '${booking.tourDateStart} – ${booking.tourDateStop}',
      'Кол-во ночей:': nights == 1
          ? '1 ночь'
          : nights < 5
              ? '$nights ночи'
              : '$nights ночей',
      'Отель': hotel.name,
      'Номер': room.name,
      'Питание': booking.nutrition,
    };
  }

  List<TextInputProps> getTouristTextInputOptions(
    Map<String, String> tourist,
    Map<String, bool> errMap,
  ) {
    return tourist.keys.map((key) {
      return TextInputProps(
        initialValue: tourist[key],
        key: key,
        label: touristHumanMapping[key]!.capitalize(),
        type: touristInputTypeMapping[key],
        isError: errMap[key] ?? false,
      );
    }).toList();
  }

  String contentBookViewTouristNumeralTitle(int count) {
    const numerals = [
      'первый',
      'второй',
      'третий',
      'четвертый',
      'пятый',
      'шестой',
      'седьмой',
      'восьмой',
      'девятый',
      'десятый',
    ];

    return count <= numerals.length
        ? '${numerals[count - 1].capitalize()} турист'
        : '$count-ый турист';
  }
}

class _CustomerInfo extends StatelessWidget {
  const _CustomerInfo({
    required this.customer,
    this.phoneError = false,
    this.emailError = false,
  });

  final Map<String, String> customer;
  final bool phoneError;
  final bool emailError;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const TitleLarge('Информация о покупателе'),
        const SizedBox(height: 16),
        PhoneTextInput(
          label: 'Номер телефона',
          onChange: (s) {
            customer['phone'] = s;
          },
          validator: validatePhoneNumber,
          validateOnBlur: true,
          isError: phoneError,
        ),
        const SizedBox(height: 8),
        TextInputField(
          label: 'Почта',
          type: TextInputType.emailAddress,
          onChange: (s) {
            customer['email'] = s;
          },
          validator: validateEmail,
          validateOnBlur: true,
          isError: emailError,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            'Эти данные никому не передаются. '
            'После оплаты мы вышли чек на указанный вами номер и почту.',
            style: TextStyle(
              color: theme.colorScheme.onSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
