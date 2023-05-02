import 'dart:convert';
import 'package:crypto_app/constants/path/api_path.dart';
import 'package:crypto_app/services/crypto_services/crypto_service_interface.dart';
import 'package:http/http.dart' as http;
import 'package:crypto_app/modules/crypto/crypto_model.dart';

class CryptoService implements CryptoServiceInterface {
  Future<CryptoModel> fetchItemByCurrency({required CryptoModel cryptoData}) async {
    cryptoData.primaryCurrency = cryptoData.primaryCurrency.toUpperCase();
    cryptoData.secondaryCurrency = cryptoData.secondaryCurrency.toUpperCase();
    ApiPath api = ApiPath();
    String apiConvertPath = api.cryptoConvert(primaryCur: cryptoData.primaryCurrency, secondCur: cryptoData.secondaryCurrency, amount: cryptoData.amount);
    final url = Uri.parse(apiConvertPath);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      cryptoData.value = jsonData[cryptoData.secondaryCurrency];
      cryptoData.status = jsonData['status'];
      return cryptoData;
    }
    cryptoData.status = "error";
    throw Exception();
  }
}


