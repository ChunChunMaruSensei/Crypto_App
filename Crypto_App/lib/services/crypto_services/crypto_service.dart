import 'dart:convert';
import 'package:crypto_app/constants/path/api_path.dart';
import 'package:http/http.dart' as http;
import 'package:crypto_app/modules/crypto/crypto_model.dart';

Future<CryptoModel> fetchCrypto({required String primaryCur, required String secondCur, required int amount}) async {
  ApiPath api = ApiPath();
  String apiConvertPath = api.cryptoConvert(primaryCur: primaryCur, secondCur: secondCur, amount: amount);
  final url = Uri.parse(apiConvertPath);
  http.Response response = await http.get(url);
  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonData = json.decode(response.body);
    return CryptoModel(
        primaryCurrency: primaryCur.toUpperCase(),
        secondaryCurrency: secondCur.toUpperCase(),
        amount: amount,
        value: jsonData[secondCur.toUpperCase()],
    );
  } else {
    throw Exception('Failed to fetch crypto data');
  }
}
