import 'package:crypto_app/modules/crypto/crypto_model.dart';

abstract class CryptoServiceInterface {
  Future<CryptoModel> fetchItemByCurrency({
    required CryptoModel cryptoData
  });
}
