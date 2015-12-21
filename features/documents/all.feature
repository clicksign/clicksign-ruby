# language: pt
Funcionalidade: Listar todos os documentos

  Como parceiro
  Quero listar todos os documentos
  Para para consultar quais documentos estão na minha conta

  Cenário: Conta sem documentos
    Dado que minha conta não tem documentos
    Quando obtenho a listagem dos documento
    Então a listagem dos documentos deve estar vazia

  Cenário: Conta com documentos
    Dado que minha conta tem alguns documentos
    Quando obtenho a listagem dos documento
    Então a listagem dos documentos não deve estar vazia
