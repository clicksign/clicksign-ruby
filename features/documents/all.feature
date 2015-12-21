# language: pt
Funcionalidade: Listar os documentos

  Como parceiro
  Quero listar os documentos
  Para ver seus dados

  Cenário: Conta sem documentos
    Dado que minha conta não tem documentos
    Quando obtenho a listagem dos documento
    Então a listagem dos documentos deve estar vazia

  Cenário: Conta com documentos
    Dado que minha conta tem alguns documentos
    Quando obtenho a listagem dos documento
    Então a listagem dos documentos não deve estar vazia
