# CodigoParaLogicaDeProgramacao

Criei este código enquanto treinava minha lógica de programação em Swift. Recomendo que você dê uma olhada no código e tente recriá-lo do zero para aprimorar suas habilidades de programação e aprender sobre herança de classes.

## Descrição

Este repositório contém um exemplo de código em Swift que simula um sistema bancário simples com funcionalidades de conta corrente, conta poupança e uma loja online.

## Funcionalidades

- **Conta Corrente**:
  - Saque e depósito.
  - Exibição de saldo.
- **Conta Poupança**:
  - Solicitação de cartão de débito.
  - Solicitação de cartão de crédito.
  - Exibição de informações adicionais sobre os cartões.
  - Taxa de saque.
- **Loja Online**:
  - Compra de produtos utilizando saldo ou limite de crédito.

## Estrutura do Código

O código está dividido em três classes principais:

- `Conta`: Classe base que implementa as funcionalidades básicas de uma conta bancária, como saque, depósito e exibição de saldo.
- `ContaPoupanca`: Subclasse de `Conta` que adiciona funcionalidades específicas de uma conta poupança, incluindo a solicitação de cartões de débito e crédito, além de uma taxa de saque.
- `LojaOnline`: Subclasse de `ContaPoupanca` que simula uma loja online, permitindo a compra de produtos usando o saldo disponível ou o limite de crédito.

## Exemplo de Uso

```Swift
var contaLucas = LojaOnline(nome: "Lucas Testa", nomeDaLoja: "LucasStore")
contaLucas.depositar(10000)
contaLucas.sacar(500)
contaLucas.solicitarCartaoDebito()
contaLucas.solicitarCartaoCredito()
contaLucas.comprarProdutos()
contaLucas.exibirSaldo()
```

## Recomendações

Tente recriar este código do zero para melhorar suas habilidades de programação e compreensão sobre herança de classes em Swift. Isso ajudará você a consolidar seu aprendizado e a desenvolver uma lógica de programação mais robusta.

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests.

	1.	Fork o repositório
	2.	Crie uma branch para sua feature (git checkout -b feature/AmazingFeature)
	3.	Commit suas mudanças (git commit -m 'Add some AmazingFeature')
	4.	Push para a branch (git push origin feature/AmazingFeature)
	5.	Abra um Pull Request

 ## Autor

- Lucas Testa
