import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIKey = 'A2E20E3A-C680-4486-B283-EAD20E01B190';
const apiURl = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String , String> prices = {};
    for(String crypto in cryptoList){
      Uri url = Uri.parse('$apiURl/$crypto/$selectedCurrency?apikey=$coinAPIKey');
      http.Response response = await http.get(url);

      if(response.statusCode == 200){
        double data = jsonDecode(response.body)['rate'];
        prices[crypto] = data.toStringAsFixed(0);
      }
      else{
        print(response.statusCode);
      }
    }
    return prices;
  }
}
