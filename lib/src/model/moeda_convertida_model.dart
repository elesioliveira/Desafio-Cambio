class ConverterMoeda {
  final double quantia;
  final String base;
  final String data;
  final Map<String, double> cotacao;

  ConverterMoeda({
    required this.quantia,
    required this.base,
    required this.data,
    required this.cotacao,
  });

  factory ConverterMoeda.fromJson(Map<dynamic, dynamic> json) {
    return ConverterMoeda(
      quantia: json['amount'] ?? 0.0,
      base: json['base'] ?? '',
      data: json['date'] ?? '',
      cotacao: Map<String, double>.from(json['rates'] ?? {}),
    );
  }

  @override
  String toString() {
    return 'Currency: { amount: $quantia, base: $base, date: $data, rate: $cotacao }';
  }
}
