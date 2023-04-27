import 'package:crypto_app/services/crypto_services/crypto_service.dart';
import 'package:crypto_app/modules/crypto/crypto_model.dart';
import 'package:crypto_app/services/crypto_services/crypto_service_interface.dart';


class CryptoViewModel {
  CryptoModel myData = CryptoModel(status: "error", primaryCurrency: '', secondaryCurrency: '', amount: 0, value: 0);
  CryptoServiceInterface service = CryptoService();
  Future<bool> onUserTabConvert({required CryptoModel cryptoData}) async{
    try{
      myData = await service.fetchItemByCurrency(cryptoData: cryptoData);
      return true;
    }catch(_){
      return false;
    }
  }
}



