class Pessoa {
    var nome: String
    var idade: Int
    var altura: Double
    var peso: Double

    init(nome: String, idade: Int, altura: Double, peso: Double) {
        self.nome = nome
        self.idade = idade
        self.altura = altura
        self.peso = peso
    }

    func imc() {
        let imc: Double = peso / (altura * altura)
        print("O seu IMC é \(imc).")
    }

    func adulto() {
        if idade >= 18 {
            print("\(nome) é adulto!")
        } else {
            print("\(nome) nao é adulto!")
        }
    }
}

var pessoaNova = Pessoa(nome: "Lucas Testa", idade: 18, altura: 1.68, peso: 60)
pessoaNova.imc()
pessoaNova.adulto()