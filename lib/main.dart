import 'package:crypto_exchanger/crypto_app.dart';
import 'package:crypto_exchanger/features/bloc/bloc_for_coin_details/coin_details_bloc.dart';
import 'package:crypto_exchanger/features/bloc/crypto_bloc.dart';
import 'package:crypto_exchanger/repository/coins_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
//   final talker = TalkerFlutter.init();
//   GetIt.instance.registerSingleton(talker);
//   GetIt.instance<Talker>().debug('Talker started...');
//   GetIt.instance<Talker>().error('Talker started...');
//   GetIt.instance<Talker>().info('Talker started...');
//   FlutterError.onError = (details) =>
//       GetIt.instance<Talker>().handle(details.exception, details.stack);
  //
  // runZonedGuarded(() => runApp(const CryptoCurrenciesApp()), (error, stack) {
  //   return GetIt.instance<Talker>().handle(error, stack);
  // });

  runApp(const CryptoCurrenciesApp());

  final dio = Dio();
  // dio.interceptors.add(
  //   TalkerDioLogger(
  //     settings: const TalkerDioLoggerSettings(
  //       printResponseData: true,
  //       printRequestData: true,
  //       printResponseHeaders: true,
  //       printRequestHeaders: true,
  //     ),
  //   ),
  // );

  GetIt.instance.registerLazySingleton(() => Dio());
  GetIt.instance.registerLazySingleton(() => CoinRepository(dio: dio));
  GetIt.instance.registerLazySingleton(() => CryptoBloc());
  GetIt.instance.registerLazySingleton(() => CoinDetailsBloc());
}
