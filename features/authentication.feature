# language: pt
Funcionalidade: Autenticação

  Como programador
  Quero me autenticar
  Para executar ações na Clicksign

  Cenário: Autenticação com sucesso
    Dado que tenho uma chave de API válida
    Quando obtenho um cliente da biblioteca
    Então ele deve estar autenticado
