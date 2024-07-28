class Conta {
    var saldo: Double = 0.0
    var nome: String

    init(nome: String) {
        self.nome = nome
    }

    func sacar(_ valor: Double) {
        if saldo >= valor {
            saldo -= valor
            print("Saque de \(valor) realizado!")
        } else {
            print("Você não tem saldo suficiente disponível para sacar!")
        }
    }

    func depositar(_ valor: Double) {
        saldo += valor
        print("Depósito de \(valor) realizado com sucesso!")
    }

    func transferir(para contaDestino: Conta) {
        print("Qual o valor que deseja transferir? ('CANCELAR' para sair)")
        if let valorString = readLine(), valorString.uppercased() != "CANCELAR" {
            if let valorUser = Double(valorString) {
                sacar(valorUser)
                contaDestino.depositar(valorUser)
                print("Transferindo \(valorUser) para a conta \(contaDestino.nome)...")
                print("Transferência realizada com sucesso!!!")
            } else {
                print("Valor inválido. Por favor, insira um número válido.")
            }
        } else {
            print("CANCELANDO TRANSFERÊNCIA...")
        }
    }

    func exibirSaldo() {
        print("Conta: \(nome)")
        print("Saldo: R$\(saldo)")
    }
}

class ContaPoupanca: Conta {
    var cartaoDebito: Bool = false
    var cartaoCredito: Bool = false
    var limiteCredito: Double = 0.0
    var taxaDeSaque: Double = 5.0

    override init(nome: String) {
        super.init(nome: nome)
    }

    override func sacar(_ valor: Double) {
        print("Saques possuem uma taxa de R$ 5,00! Deseja continuar? (Sim ou Não)")
        var respostaUser: String? = readLine()

        while true {
            if let resposta = respostaUser?.uppercased() {
                if resposta == "SIM" {
                    if saldo >= (valor + taxaDeSaque) {
                        saldo -= (valor + taxaDeSaque)
                        print("Saque de \(valor) realizado!")
                        break
                    } else {
                        print("Você não tem saldo suficiente disponível para sacar!")
                        break
                    }
                } else if resposta == "NAO" || resposta == "NÃO" {
                    print("Obrigado! Volte quando precisar fazer um saque.")
                    break
                } else {
                    print("Resposta inválida! Por favor, responda com Sim ou Não.")
                }
            } else {
                print("Resposta inválida! Por favor, responda com Sim ou Não.")
            }

            respostaUser = readLine()
        }
    }

    override func exibirSaldo() {
        super.exibirSaldo()
        if cartaoDebito {
            print("Cartão de débito: Ativo.")
        } else {
            print("Cartão de débito: Desativado.")
        }
        if cartaoCredito {
            print("Cartão de crédito: Ativo")
            print("Limite do seu cartão: R$\(limiteCredito)")
        } else {
            print("Cartão de crédito: Desativado.")
        }
    }

    func solicitarCartaoDebito() {
        print("Você deseja solicitar um cartão de débito? (Sim ou Não)")
        var respostaUser: String? = readLine()

        while true {
            if let resposta = respostaUser?.uppercased() {
                if resposta == "SIM" {
                    cartaoDebito = true
                    print("Cartão de débito criado com sucesso!")
                    break
                } else if resposta == "NAO" || resposta == "NÃO" {
                    print("Obrigado! Volte quando precisar do cartão de débito.")
                    break
                } else {
                    print("Resposta inválida! Por favor, responda com Sim ou Não.")
                }
            } else {
                print("Resposta inválida! Por favor, responda com Sim ou Não.")
            }

            respostaUser = readLine()
        }
    }

    func solicitarCartaoCredito() {
        print("Você deseja solicitar um cartão de crédito? (Sim ou Não)")
        var respostaUser: String? = readLine()

        while true {
            if let resposta = respostaUser {
                if resposta.uppercased() == "SIM" {
                    print("Analisando seus dados...")
                    if saldo >= 4000 {
                        cartaoCredito = true
                        limiteCredito = 4000
                        print("Parabéns! Seu cartão de crédito foi aprovado com um limite de R$ \(limiteCredito)!")
                        break
                    } else {
                        print("Infelizmente seu cartão de crédito não foi aprovado! Tenha um saldo superior a R$ 4000,00 para maior chance de aprovação!")
                        break
                    }
                } else if resposta.uppercased() == "NAO" || resposta.uppercased() == "NÃO" {
                    print("Obrigado! Quando quiser uma análise de crédito, volte aqui.")
                    break
                } else {
                    print("Resposta inválida! Por favor, responda com Sim ou Não.")
                }
            } else {
                print("Resposta inválida! Por favor, responda com Sim ou Não.")
            }

            respostaUser = readLine()
        }
    }
}

class LojaOnline: ContaPoupanca {
    var nomeDaLoja: String

    var produtos: [String: Double] = [
        "iPhone 15": 4200.00,
        "iPad": 2800.00,
        "MacBook": 8000.00,
        "AirPods Pro": 1800.00
    ]

    init(nome: String, nomeDaLoja: String) {
        self.nomeDaLoja = nomeDaLoja
        super.init(nome: nome)
    }

    func comprarProdutos() {
        print("Bem-vindo à \(nomeDaLoja)!")
        for (produto, preco) in produtos {
            print("Produto: \(produto) Valor: R$ \(preco)")
        }

        print("Qual produto você deseja comprar? (Digite CANCELAR para cancelar a compra.)")
        let respostaUser: String? = readLine()

        while true {
            if let resposta = respostaUser, resposta.uppercased() != "CANCELAR" {
                print("Você deseja comprar no crédito ou débito?")
                let creditoOuDebito: String? = readLine()

                if creditoOuDebito?.uppercased() == "CREDITO" || creditoOuDebito?.uppercased() == "CRÉDITO" {
                    // lógica compra no crédito

                    if let preco = produtos[resposta] {
                        if limiteCredito >= preco {
                            limiteCredito -= preco
                            print("Você comprou \(resposta) por R$ \(preco) usando seu limite de crédito. Limite restante: R$ \(limiteCredito)")
                            break
                        } else {
                            print("Limite de crédito insuficiente para comprar \(resposta)! Volte mais tarde...")
                            break
                        }
                    } else {
                        print("Produto não encontrado. Por favor, tente novamente ou digite CANCELAR para cancelar a compra.")
                    }
                } else if creditoOuDebito?.uppercased() == "DEBITO" || creditoOuDebito?.uppercased() == "DÉBITO" {
                    // lógica compra no débito

                    if let preco = produtos[resposta] {
                        if saldo >= preco {
                            saldo -= preco
                            print("Você comprou \(resposta) por R$ \(preco) usando seu saldo de débito. Saldo restante: R$ \(saldo)")
                            break
                        } else {
                            print("Saldo insuficiente para comprar \(resposta)! Volte mais tarde...")
                            break
                        }
                    } else {
                        print("Produto não encontrado. Por favor, tente novamente ou digite CANCELAR para cancelar a compra.")
                    }
                } else {
                    print("Resposta inválida! Por favor escolha Crédito ou Débito.")
                }
            } else {
                print("Compra cancelada!")
                break
            }
        }
    }
}

var contaLucas = LojaOnline(nome: "Lucas Testa", nomeDaLoja: "LucasStore")
var contaLeo = LojaOnline(nome: "Leonardo Testa", nomeDaLoja: "LeonardoStore")
contaLucas.depositar(10000)
contaLucas.transferir(para: contaLeo)
print(contaLucas.saldo)
print(contaLeo.saldo)