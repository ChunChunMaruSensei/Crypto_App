import 'package:crypto_app/modules/crypto/crypto_model.dart';

abstract class CryptoServiceInterface {
  Future<CryptoModel> fetchItemByCurrency({required String primaryCurrency, required String secondaryCurrency, required int amount, required double value}) async {
    throw UnimplementedError();
  }
}