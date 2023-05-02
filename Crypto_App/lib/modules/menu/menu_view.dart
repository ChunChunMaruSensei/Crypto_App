import 'package:flutter/material.dart';
import 'package:crypto_app/constants/decorations/text_style.dart';
import 'package:crypto_app/constants/decorations/input_box.dart';
import 'package:crypto_app/modules/crypto/crypto_view_model.dart';
import 'package:crypto_app/modules/crypto/crypto_model.dart';

class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  final TextEditingController _primaryCur = TextEditingController(); // Text editing controller for first TextField
  final TextEditingController _secondCur = TextEditingController(); // Text editing controller for second TextField
  final TextEditingController _amount = TextEditingController(); // Text editing controller for third TextField
  final CryptoViewModel _viewModel = CryptoViewModel();


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
                child: FutureBuilder(
                  future: _viewModel.onUserTabConvert(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if(_viewModel.myData?.status == "success")
                            Text(
                              '${_viewModel.myData?.value} ${_viewModel.myData?.secondaryCurrency}',
                              style: kHighLightBodyTextStyle,
                            ),
                        ],
                      );
                    } else {
                      return const Text('Error');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.check),
          onPressed: () async {
            _viewModel.myData = CryptoModel(
              status: 'loading',
              primaryCurrency: _primaryCur.text,
              secondaryCurrency: _secondCur.text,
              amount: double.parse(_amount.text),
              value: 0,
            );
            setState(() {});
          },
        ),
      ),
    );
  }
}
