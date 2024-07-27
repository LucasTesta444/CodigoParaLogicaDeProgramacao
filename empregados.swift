class Empregado {
  var nome: String

  init(nome: String) {
      self.nome = nome
  }
}

class Cargos: Empregado {
    var cargo: String
    var cargos: [String: Double] = [
        "AUXILIAR": 1800.0,
        "CLASSIFICADOR": 2400.0,
        "GERENTE": 5000.0
    ]

    init(nome: String, cargo: String) {
        self.cargo = cargo.uppercased()
        super.init(nome: nome)
    }

    func cadastrarCargo() {
        while true {
            print("Digite o novo cargo ('CANCELAR' para sair):")
            if let novoCargo = readLine()?.uppercased(), novoCargo != "CANCELAR" {
                print("Digite o novo salário:")
                if let entradaSalario = readLine(), let novoSalario = Double(entradaSalario) {
                    cargos[novoCargo] = novoSalario
                    print("Novo Cargo adicionado com sucesso!")
                } else {
                    print("Salário inválido. Por favor, insira um valor numérico.")
                }
            } else {
                print("Cancelando...")
                break
            }
        }
    }

    func exibirCargos() {
        print("CARGOS")
        for cargo in cargos {
            print("Cargo: \(cargo.key) - Salario: \(cargo.value)")
        }
    }
}

class Funcionarios: Cargos {
    var funcionarios: [String: String] = [:]

    override init(nome: String, cargo: String) {
        super.init(nome: nome, cargo: cargo)
    }

    func mostrarFuncionarios() {
        print("EMPREGADOS")
        for (nome, cargo) in funcionarios {
            print("Funcionário: \(nome) - Cargo: \(cargo) - Salário: \(cargos[cargo] ?? 0.0)")
        }
    }

    
    func cadastrarFuncionario() {
        print("Digite o nome do funcionario:")
        if let nome = readLine() {
            print("Qual o cargo do funcionario?")
            if let cargo = readLine()?.uppercased() {
                if cargos.keys.contains(cargo) {
                    funcionarios[nome] = cargo
                    print("Funcionário cadastrado com sucesso!")
                } else {
                    print("Cargo não encontrado. Por favor, cadastre o cargo primeiro.")
                }
            } else {
                print("Cargo inválido.")
            }
        } else {
            print("Nome inválido.")
        }
    }
}

let emp = Funcionarios(nome: "", cargo: "")
emp.cadastrarCargo()
emp.cadastrarFuncionario()
emp.cadastrarFuncionario()
emp.cadastrarFuncionario()

emp.mostrarFuncionarios()
emp.exibirCargos()