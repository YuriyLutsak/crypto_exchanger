import 'package:bloc/bloc.dart';
import 'package:crypto_exchanger/repository/coins_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

import '../../../repository/models/coin_details.dart';
import '../bloc_status.dart';

part 'coin_details_event.dart';
part 'coin_details_state.dart';

class CoinDetailsBloc extends Bloc<CoinDetailsEvent, CoinDetailsState> {
  CoinDetailsBloc()
      : super(const CoinDetailsState(status: BlocStatus.NONE)) {
    on<CoinDetailsEvent>((event, emit) async {
      emit(state.copyWith(status: BlocStatus.LOADING));

      try {
        final coinDetails = await GetIt.instance<CoinRepository>()
            .getCoinDetails(event.currensyCode);

        emit(state.copyWith(status: BlocStatus.LOADED, details: coinDetails));
      } catch (e, st) {
        emit(state.copyWith(
            status: BlocStatus.ERROR, error: 'BlocStatus.ERROR'));
     //   GetIt.instance<Talker>().handle(e, st);
      }
    });
  }

  // @override
  // void onError(Object error, StackTrace stackTrace) {
  //   super.onError(error, stackTrace);
  //   GetIt.instance<Talker>().handle(error, stackTrace);
  // }
}
