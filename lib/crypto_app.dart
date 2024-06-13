import 'package:crypto_exchanger/routes.dart';
import 'package:crypto_exchanger/theme/theme.dart';
import 'package:flutter/material.dart';

class CryptoCurrenciesApp extends StatelessWidget {
  const CryptoCurrenciesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Crypto Currencies",
      theme: whiteTheme,
      routes: routes,
      // navigatorObservers: [
      //   TalkerRouteObserver(
      //     GetIt.instance<Talker>(),
      //   ),
      // ],
    );
  }
}
