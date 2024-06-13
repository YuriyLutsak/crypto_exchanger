import 'package:crypto_exchanger/features/bloc/bloc_for_coin_details/coin_details_bloc.dart';
import 'package:crypto_exchanger/features/bloc/bloc_status.dart';
import 'package:crypto_exchanger/repository/models/coin_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../repository/models/coin.dart';

class CryptoCoinScreenDetails extends StatelessWidget {
  final String coinName;
  var bloc = GetIt.instance<CoinDetailsBloc>();

  CryptoCoinScreenDetails({Key? key, required this.coinName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bloc.add(CoinDetailsEvent(currensyCode: coinName));
    return BlocBuilder<CoinDetailsBloc, CoinDetailsState>(
      bloc: bloc,
      builder: (context, state) {
        if (state.status == BlocStatus.LOADING||  state.status == BlocStatus.NONE) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state.status == BlocStatus.LOADED) {
          return Scaffold(
            appBar: AppBar(
              title: Text(state.coinDetails!.coinName),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(state.coinDetails?.urlImg ?? ''),
                  Text(state.coinDetails!.coinName),
                  Text('price in USD:'),
                  Text(state.coinDetails!.price.toString()),
                  Column(
                    children: [
                      Text('max price per 24 hours:  ${state.coinDetails!.higestPrice.toString()}'),
                      Text("min price per 24 hours: ${state.coinDetails!.lowerPrice.toString()}"),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  bloc.add(CoinDetailsEvent(currensyCode: coinName));
                },
                child: const Text('Try Again'),
              ),
            ),
          );
        }
      },
    );
  }
}
