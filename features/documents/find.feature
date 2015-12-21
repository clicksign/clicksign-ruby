# language: pt
Funcionalidade: Achar um documento

  Como parceiro
  Quero achar um documento
  Para ver seus dados

  Cenário: Chave com documento
    Dado que tenho uma chave válida de documento
    Quando busco o documento pela sua chave
    Então obtenho o documento

  Cenário: Chave sem documento
    Dado que tenho uma chave inválida de documento
    Quando busco o documento pela sua chave
    Então obtenho um documento vazio
