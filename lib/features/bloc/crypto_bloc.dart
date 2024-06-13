import 'package:bloc/bloc.dart';
import 'package:crypto_exchanger/features/bloc/bloc_status.dart';
import 'package:crypto_exchanger/repository/coins_repository.dart';
import 'package:crypto_exchanger/repository/models/coin.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'crypto_event.dart';

part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  CryptoBloc() : super(CryptoState(status: BlocStatus.NONE)) {
    on<CryptoEvent>((event, emit) async {
      emit(state.copyWith(status: BlocStatus.LOADING));
      //  await Future.delayed(const Duration(seconds: 1));

      try {
        final cryptoList = await GetIt.instance<CoinRepository>().getCoinList();
        // throw Exception('data not load');
        emit(state.copyWith(status: BlocStatus.LOADED, cryptoList: cryptoList));
      } catch (error, st) {
        emit(state.copyWith(
            status: BlocStatus.ERROR,
            error: '${error.toString()} =  BlocStatus.ERROR'));
     //  GetIt.instance<Talker>().handle(error, st);
      }
    });
  }
}
