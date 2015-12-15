# language: pt
Funcionalidade: Cancelar documento

  Como parceiro
  Quero cancelar um documento
  Para que ele não possa mais ser assindo

  Cenário: Alterar status
    Dado que há um documento sendo assinado
    Quando cancelo o documento
    Então o status do documento é "canceled"

  Cenário: Notificar signatários
    Dado que há um documento sendo assinado
    Quando cancelo o documento
    Então os signatários que já assinaram não notificados
