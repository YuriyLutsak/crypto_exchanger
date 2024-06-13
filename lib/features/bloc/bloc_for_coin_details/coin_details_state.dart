part of 'coin_details_bloc.dart';

class CoinDetailsState extends Equatable {
  final BlocStatus status;
  final CoinDetails? coinDetails;
  final String? error;

  const CoinDetailsState({required this.status, this.coinDetails, this.error});

  CoinDetailsState copyWith({required BlocStatus status, CoinDetails? details,
      String? error}) {
    return CoinDetailsState(status: status, coinDetails: details, error: error);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, coinDetails, error];
}
