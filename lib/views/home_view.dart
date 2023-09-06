import 'package:flutter/material.dart';
import 'package:hotel_app/api_client/api_client.dart';
import 'package:hotel_app/common_widgets/loading_view.dart';
import 'package:hotel_app/helper_fns/get_theme.dart';
import 'package:hotel_app/views/hotel_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final hotelFut = ApiClient().fetchHotel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: hotelFut,
      builder: (context, snapshot) => snapshot.hasData
          ? HotelPage(hotel: snapshot.data!)
          : LoadingView(
              text: 'Ищем отель...',
              backgroundColor: getTheme(context).colorScheme.onTertiary,
            ),
    );
  }
}

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final userData = InheritedUserData.of(context);

//     return userData.state.user == null
//         ? FetchingUserData()
//         : FutureBuilder(
//             future: FakeApi().fetchHotel(),
//             builder: (context, snapshot) => snapshot.hasData
//                 ? HotelPage(hotel: snapshot.data!)
//                 : LoadingView(
//                     text: 'Ищем отель...',
//                     backgroundColor: getTheme(context).colorScheme.onTertiary,
//                   ),
//           );
//   }
// }

// class FetchingUserData extends StatelessWidget {
//   FetchingUserData({super.key});

//   final user = FakeApi().fetchUserData(FAKE_USER_ID);

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: user,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             InheritedUserData.of(context).state.setUser(snapshot.data);
//           });
//           return const HomeView();
//         } else {
//           return LoadingView(
//             text: 'Вход...',
//             backgroundColor: getTheme(context).colorScheme.onTertiary,
//           );
//         }
//       },
//     );
//   }
// }
