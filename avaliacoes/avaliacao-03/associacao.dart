import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }
  
  Map<String, String> toJson() => {
    "Nome do Dependente": _nome
  };
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  Map<String, dynamic> toJson() => {
    "Nome": _nome,
    "Dependentes": _dependentes.map((f) => f.toJson()).toList()
  };
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  Map <String, dynamic> toJson() => {
    "Nome do Projeto" : _nomeProjeto,
    "Funcionarios" : _funcionarios.map((f) => f.toJson()).toList()
    };
}

void main() {
  Dependente dep1 = Dependente("José");
  Dependente dep2 = Dependente("João");
  Dependente dep3 = Dependente("Mario");
  Dependente dep4 = Dependente("Tatiana");
  Dependente dep5 = Dependente("Julia");
  Dependente dep6 = Dependente("Natan");
  Dependente dep7 = Dependente("Mendes");
  Dependente dep8 = Dependente("Junior");
  Dependente dep9 = Dependente("Paulo");
  Dependente dep10 = Dependente("Pedro");

  Funcionario func1 = Funcionario("Nonato", [dep1, dep2]);
  Funcionario func2 = Funcionario("Maria", [dep3, dep4]);
  Funcionario func3 = Funcionario("Anastacia", [dep5, dep6]);
  Funcionario func4 = Funcionario("Cleber", [dep7, dep8]);
  Funcionario func5 = Funcionario("Leticia", [dep9, dep10]);

  List<Funcionario> funcs = [func1, func2, func3, func4, func5];
  EquipeProjeto Projeto = EquipeProjeto("Projeto PDM", funcs);

  
  print(jsonEncode(Projeto));
  
}
