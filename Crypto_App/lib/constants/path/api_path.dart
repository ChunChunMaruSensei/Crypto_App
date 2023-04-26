class ApiPath {
  String cryptoConvert({required String primaryCur, required String secondCur, required int amount}) {
    return ("https://api.coinconvert.net/convert/$primaryCur/$secondCur?amount=$amount");
  }
}