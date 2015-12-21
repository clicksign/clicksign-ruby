# language: pt
Funcionalidade: Achar um documento

  Como parceiro
  Quero achar um documento
  Para ver seus dados

  Cenário: Conta sem documentos
    Dado que minha conta não tem documentos
    Quando obtenho a listagem dos documento
    Então a listagem dos documentos deve estar vazia
