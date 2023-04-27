import 'package:crypto_app/modules/crypto/crypto_model.dart';
import 'package:crypto_app/services/crypto_services/crypto_service_interface.dart';

class CryptoMockService implements CryptoServiceInterface {
  @override
  Future<CryptoModel> fetchItemByCurrency({required CryptoModel cryptoData}) async {
    return CryptoModel(
      status: "success",
      primaryCurrency: "BTC",
      secondaryCurrency: "THB",
      amount: 1,
      value: 1000000,
    );
  }
}