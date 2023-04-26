import 'package:flutter/material.dart';
import 'package:crypto_app/services/crypto_services/crypto_service.dart';
import 'package:crypto_app/modules/crypto/crypto_model.dart';
import 'package:crypto_app/constants/decorations/text_style.dart';
import 'package:crypto_app/constants/decorations/input_box.dart';

class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  final TextEditingController _primaryCur = TextEditingController(); // Text editing controller for first TextField
  final TextEditingController _secondCur = TextEditingController(); // Text editing controller for second TextField
  final TextEditingController _amount = TextEditingController(); // Text editing controller for third TextField
  CryptoModel myData = CryptoModel(primaryCurrency: '', secondaryCurrency: '', amount: 0, value: 0);
  String _curConvert = '';

  @override
  void dispose() {
    // Dispose the text editing controllers when the widget is disposed
    _primaryCur.dispose();
    _secondCur.dispose();
    _amount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Convert CryptoCurrency'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _primaryCur,
                      decoration: firstCurrency
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: TextField(
                      controller: _secondCur,
                      decoration: secondCurrency,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _amount,
                      decoration: amountBox,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (myData.primaryCurrency.isNotEmpty)
                      Text(
                        '${myData.value} $_curConvert',
                        style: kHighLightBodyTextStyle,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.check),
          onPressed: () async {
            // Call the fetchCrypto function and wait for the result
            myData = await fetchCrypto(
              primaryCur: _primaryCur.text,
              secondCur: _secondCur.text,
              amount: int.parse(_amount.text),
            );
            setState(() {
              _curConvert = _secondCur.text.toUpperCase();
            });
          },
        ),
      ),
    );
  }
}
