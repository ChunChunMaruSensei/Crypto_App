class ApiPath {
  String cryptoConvert({required String primaryCur, required String secondCur, required double amount}) {
    return ("https://api.coinconvert.net/convert/$primaryCur/$secondCur?amount=$amount");
  }
}