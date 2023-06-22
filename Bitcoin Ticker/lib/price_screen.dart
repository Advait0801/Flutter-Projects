import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});
  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'INR';
  Map<String , String> coinValues = {};
  bool isWaiting = false;

  DropdownButton androidUI(){
    List<DropdownMenuItem<String>> dropDownItems = [];
    for(String currency in currenciesList){
      var item = DropdownMenuItem(value: currency,child: Text(currency) ,);
      dropDownItems.add(item);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
          getData();
        });
      },
    );
  }

  CupertinoPicker iOSUI(){
    List<Text> items = [];
    for(String currency in currenciesList){
      items.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          getData();
        });
      },
      children: items,
    );
  }

  void getData() async {
    isWaiting = true;
    try{
      var data = await CoinData().getCoinData(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    }
    catch(e){
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CryptoCard(
                crypto: 'BTC',
                cryptoValue: isWaiting ? '?' : coinValues['BTC'],
                selectedCurrency: selectedCurrency,
              ),
              CryptoCard(
                crypto: 'ETH',
                cryptoValue: isWaiting ? '?' : coinValues['ETH'],
                selectedCurrency: selectedCurrency,
              ),
              CryptoCard(
                crypto: 'LTC',
                cryptoValue: isWaiting ? '?' : coinValues['LTC'],
                selectedCurrency: selectedCurrency,
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSUI() : androidUI()
          ),
        ],
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {
  const CryptoCard({
    required this.crypto,
    required this.cryptoValue,
    required this.selectedCurrency,
  });

  final String? cryptoValue;
  final String? selectedCurrency;
  final String? crypto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $crypto = $cryptoValue $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
