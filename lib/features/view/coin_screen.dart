import 'package:flutter/material.dart';

import '../../repository/models/coin.dart';

class CryptoCoinScreen extends StatelessWidget {
  final Coin coin;

  const CryptoCoinScreen(
      {super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coin.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(coin.image),
          Text(coin.name),
         Text(coin.price.toString()),
          Column(
            children: [
              Text('hight'),
              Text('low'),
            ],
          ),
        ],
      ),
    );
  }
}
