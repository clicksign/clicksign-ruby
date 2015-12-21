# language: pt
Funcionalidade: Achar um documento

  Como parceiro
  Quero achar um documento
  Para ver seus dados

  Cenário: Chave com documento
    Dado que tenho a chave do documento
    Quando busco o documento pela sua chave
    Então obtenho o documento

  Cenário: Chave sem documento
    Dado que minha conta não tem documentos
    Quando busco o documento com a chave "BAD"
    Então obtenho uma exeção de documento não encontrado
