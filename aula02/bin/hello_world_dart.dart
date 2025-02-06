void main() {
  String frase = 'essa é uma frase';
  int numero = 999;
  double divisao = numero / 333;
  bool verdade = true;

  List<int> lista = [3, 9, 7];

  Map<String, double> dicionario = {'chave': 9.7, 'outra chave': 7.3};

  print('$frase $numero $divisao $verdade');

  MinhaClasse variavel = MinhaClasse(
    idade: 9,
    nome: 'abc',
  );
}

String minhaFuncao(String palavra) {
  return '$palavra olá';
}

class MinhaClasse {
  String nome;
  int idade;

  MinhaClasse({
    required this.nome,
    required this.idade,
  });
}
