import 'package:crypto_exchanger/features/view/coin_screen.dart';
import 'package:crypto_exchanger/features/view/widgets/coin_screen_details.dart';
import 'package:crypto_exchanger/repository/models/coin_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../repository/models/coin.dart';

class CryptoCoinTile extends StatelessWidget {
  final Coin coin;

  const CryptoCoinTile({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(coin.name),
      subtitle: Text(coin.price.toString()),
      leading: Image.network(coin.image),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CryptoCoinScreenDetails(coinName: coin.name),
          ),
        );

        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => CryptoCoinScreen(coin: coin)));
      },
    );
  }
}
