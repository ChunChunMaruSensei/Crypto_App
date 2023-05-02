import 'package:crypto_app/services/crypto_services/crypto_service.dart';
import 'package:crypto_app/modules/crypto/crypto_model.dart';
import 'package:crypto_app/services/crypto_services/crypto_service_interface.dart';


class CryptoViewModel {
  CryptoModel? myData;
  CryptoServiceInterface service = CryptoService();
  Future<bool> onUserTabConvert() async{
    try{
      await service.fetchItemByCurrency(cryptoData: myData!);
      return true;
    } catch(e){
      return false;
    }
  }
}



