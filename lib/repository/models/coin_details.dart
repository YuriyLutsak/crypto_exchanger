import 'package:equatable/equatable.dart';

class CoinDetails extends Equatable {
  final String coinName;
  final String urlImg;
  final double price;
  final double higestPrice;
  final double lowerPrice;

  const CoinDetails(
      {required this.coinName,
      required this.urlImg,
      required this.price,
      required this.higestPrice,
      required this.lowerPrice});

  @override
  List<Object?> get props => [];
}
