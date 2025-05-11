class TransactionResponse {
  final int? id;
  final String? name;
  final String? merchantLogo;
  final num? amount;
  final String? status;
  final DateTime? time;

  TransactionResponse({
    this.id,
    this.name,
    this.merchantLogo,
    this.amount,
    this.status,
    this.time,
  });

  factory TransactionResponse.fromJson(Map<String, dynamic> json) {
    return TransactionResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      merchantLogo: json['merchantLogo'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      status: json['status'] as String?,
      time: json['time'] != null ? DateTime.tryParse(json['time']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'merchantLogo': merchantLogo,
      'amount': amount,
      'status': status,
      'time': time?.toIso8601String(),
    };
  }
}
