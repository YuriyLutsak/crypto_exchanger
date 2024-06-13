part of 'crypto_bloc.dart';

class CryptoState extends Equatable {
  final BlocStatus status;
  final List<Coin>? cryptoList;
  final String? error;

  const CryptoState({required this.status, this.cryptoList, this.error});

  CryptoState copyWith(
      {required BlocStatus status, List<Coin>? cryptoList, String? error}) {
    return CryptoState(status: status, cryptoList: cryptoList, error: error);
  }

  @override
  List<Object?> get props => [status, cryptoList, error];
}
