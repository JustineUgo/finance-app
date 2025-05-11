class TransactionResponse {
  final int? id;
  final String? name;
  final String? merchant;
  final String? merchantLogo;
  final num? amount;
  final String? status;
  final String? paymentMethod;
  final DateTime? time;

  TransactionResponse({
    this.id,
    this.name,
    this.merchant,
    this.merchantLogo,
    this.amount,
    this.status,
    this.paymentMethod,
    this.time,
  });

  factory TransactionResponse.fromJson(Map<String, dynamic> json) {
    return TransactionResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      merchant: json['merchant'] as String?,
      merchantLogo: json['merchantLogo'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      status: json['status'] as String?,
      paymentMethod: json['paymentMethod'] as String?,
      time: json['time'] != null ? DateTime.tryParse(json['time']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'merchant': merchant,
      'merchantLogo': merchantLogo,
      'amount': amount,
      'status': status,
      'paymentMethod': paymentMethod,
      'time': time?.toIso8601String(),
    };
  }
}
