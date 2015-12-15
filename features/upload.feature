# language: pt
Funcionalidade: Subir documento

  Como parceiro
  Quero subir um documento
  Para submete-lo à assinatura

  Cenário: Subir documento sem assinaturas
    Dado que tenho um arquivo para ser assinado
    Quando subo o arquivo sem emails para assinaram
    Então o status do documento é "editing"

  Cenário: Subir documento com assinaturas
    Dado que tenho um arquivo para ser assinado
    Quando subo o arquivo com emails para assinaram
    Então o status do documento é "running"
