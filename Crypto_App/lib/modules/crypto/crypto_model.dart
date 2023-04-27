class CryptoModel{
  late String status;
  late String primaryCurrency;
  late String secondaryCurrency;
  late double amount;
  late double value;

  CryptoModel({
    required this.status,
    required this.primaryCurrency,
    required this.secondaryCurrency,
    required this.amount,
    required this.value,
  });
}