# language: pt
Funcionalidade: Autenticação

  Como parceiro
  Quero obter a listagem dos documentos
  Para saber quais documentos estão na minha conta

  Cenário: Conta sem documentos
    Dado que minha conta não tem documentos
    Quando obtenho a listagem dos documento
    Então a listagem dos documentos deve estar vazia

  Cenário: Conta com documentos
    Dado que minha conta tem alguns documentos
    Quando obtenho a listagem dos documento
    Então a listagem dos documentos não deve estar vazia
