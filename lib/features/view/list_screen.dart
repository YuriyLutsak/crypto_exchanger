import 'package:crypto_exchanger/features/bloc/bloc_for_coin_details/coin_details_bloc.dart';
import 'package:crypto_exchanger/features/bloc/bloc_status.dart';
import 'package:crypto_exchanger/features/view/widgets/coin_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../bloc/crypto_bloc.dart';

class CryptoListScreen extends StatelessWidget {
  CryptoListScreen({Key? key}) : super(key: key);

  var bloc = GetIt.instance<CryptoBloc>();
  var blocDetail = GetIt.instance<CoinDetailsBloc>();

  @override
  Widget build(BuildContext context) {
    bloc.add(CryptoEvent());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Currencies'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          bloc.add(CryptoEvent());
        },
        child: BlocBuilder<CryptoBloc, CryptoState>(
          bloc: bloc,
          builder: (context, state) {
            if (state.status == BlocStatus.LOADING ||
                state.status == BlocStatus.NONE) {
              return const CircularProgressIndicator();
            } else if (state.status == BlocStatus.LOADED) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return CryptoCoinTile(coin: state.cryptoList![index]);
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: state.cryptoList!.length,
              );
            } else
              return TextButton(
                  onPressed: () {
                     bloc.add(CryptoEvent());
                  },
                  child: const Text('TRY AGAIN LATER'));
          },
        ),
      ),
    );
  }

// Future<void> fetchData() async {
//     coinList = await GetIt.instance<CoinRepository>().getData();
//    setState(() {}); // without this didn't load UI
// }
}
