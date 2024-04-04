class Currency {
  final String sigla;
  final String pais;

  Currency({required this.sigla, required this.pais});

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      sigla: json.keys.first,
      pais: json.values.first,
    );
  }

  @override
  String toString() {
    return 'Currency: { sigla: $sigla, pais: $pais }';
  }
}
