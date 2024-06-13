import 'package:crypto_exchanger/repository/coins_repository.dart';
import 'package:crypto_exchanger/repository/models/coin_details.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

class Coin extends Equatable {
  final String name;
  final double price;
  final String image;
 // final CoinDetails? coinDetails;

  Coin(
      {required this.name,
      required this.price,
      required this.image,
     // this.coinDetails
      });

  @override
  List<Object?> get props => [name, price, image];
}
