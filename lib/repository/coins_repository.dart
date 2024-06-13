import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'models/coin.dart';
import 'models/coin_details.dart';

class CoinRepository {
  var dio = GetIt.instance<Dio>();

  CoinRepository({required dio});

  Future<List<Coin>> getCoinList() async {
    var response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AID,SOL,DOV&tsyms=USD');
    var allData = response.data['RAW'] as Map<String, dynamic>;
    return allData.entries.map((e) {
      var price = (e.value as Map<String, dynamic>)['USD']['PRICE'];
      var image = (e.value as Map<String, dynamic>)['USD']['IMAGEURL'];

      return Coin(
          name: e.key,
          price: price,
          image: 'https://www.cryptocompare.com/$image');
    }).toList();
  }

  Future<CoinDetails> getCoinDetails(String coin) async {
    var response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$coin&tsyms=USD,EUR');
    var data = response.data['RAW'][coin]['USD'];

    var coinName = data?['FROMSYMBOL'];
    var urlImg = data?['IMAGEURL'];
    var higestPrice = data?['HIGH24HOUR'];
    var lowerPrice = data?['LOW24HOUR'];
    // var prices = (response.data['RAW'] as Map<String, dynamic>)
    //     .entries
    //     .map((e) => e.value['PRICE'])
    //     .whereType<double>()
    //     .toList();

    var price = data?['PRICE'];

    return CoinDetails(
      coinName: coinName,
      urlImg: 'https://www.cryptocompare.com$urlImg',
      price: price,
      higestPrice: higestPrice,
      lowerPrice: lowerPrice,
    );
  }
}
