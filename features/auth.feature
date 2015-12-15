# language: pt
Funcionalidade: Autenticação do usuário

  Como parceiro
  Quero me autenticar
  Para executar ações na Clicksign

  Cenário: Autenticação com sucesso
    Dado que tenho uma chave de API válida
    Quando obtenho um cliente da biblioteca
    Então o cliente deve estar autenticado

  Cenário: Autenticação com falha
    Dado que tenho uma chave de API inválida
    Quando obtenho um cliente da biblioteca
    Então o cliente não deve estar autenticado
