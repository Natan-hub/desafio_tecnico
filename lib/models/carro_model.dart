class CarroModel {
  final int id;
  final int timestampCadastro;
  final int modeloId;
  final int ano;
  final String combustivel;
  final int numPortas;
  final String cor;
  final String nomeModelo;
  final double valor;

  CarroModel({
    required this.id,
    required this.timestampCadastro,
    required this.modeloId,
    required this.ano,
    required this.combustivel,
    required this.numPortas,
    required this.cor,
    required this.nomeModelo,
    required this.valor,
  });

  factory CarroModel.fromJson(Map<String, dynamic> json) {
    return CarroModel(
      id: json['id'],
      timestampCadastro: json['timestamp_cadastro'],
      modeloId: json['modelo_id'],
      ano: json['ano'],
      combustivel: json['combustivel'],
      numPortas: json['num_portas'],
      cor: json['cor'],
      nomeModelo: json['nome_modelo'],
      valor: json['valor'],
    );
  }
}
