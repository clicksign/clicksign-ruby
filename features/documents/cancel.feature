# language: pt
Funcionalidade: Cancelar documento

  Como parceiro
  Quero cancelar um documento
  Para que ele não possa mais ser assindo

  Cenário: Alterar status
    Dado que tenho um documento
    Quando cancelo o documento
    Então o documento possui uma data de cancelamento
