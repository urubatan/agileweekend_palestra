Característica: Gerenciar chamados de suporte
  Para que seja possível registrar todas as ligações de suporte
  Um funcionário do help desk
  Precisa cadastrar as ligações recebidas, atribuir tarefas aos colegas e marcar tarefas como concluídas
  
  Contexto:
    Dado que existe um usuário padrão
    E que ele ja esta autenticado
    E os seguintes usuários:
      |name|password|email|
      |tecnico1|Password 1|email 1|
      |tecnico2|Password 2|email 2|

  Esquema do Cenário: Ligação recebida
    Dado eu estou na página inicial
    Quando eu clico "Nova Ligação"
    E eu preencho "Título" com "<titulo>"
    E eu preencho "Descrição" com "<descricao>"
    E eu presciono "Criar"
    Então eu devo ver "Ligação registrada com sucesso"
    
    Exemplos:
      |titulo|descricao|
      |Reclamação sobre velox|O usuário informa não conseguir acessar a internet depois que a telefônica entrou em coma|
      |Reclamação sobre BRT|O usuário informa não conseguir acessar a internet depois que a OI comprou a BRT|

  Esquema do Cenário: suporte offline
    Dado eu estou na página inicial
    E as seguintes ligações:
      |title|description|
      |Reclamação sobre velox|O usuário informa não conseguir acessar a internet depois que a telefônica entrou em coma|
      |Reclamação sobre BRT|O usuário informa não conseguir acessar a internet depois que a OI comprou a BRT|
    Quando eu clico "Solucionar Problema"
    E eu seleciono "<usuario>" de "Técnico"
    E eu seleciono "<ligacao>" de "Ligações"
    E eu seleciono "<status>" de "Soluções"
    E eu presciono "Salvar"
    Então eu devo ver "Status alterado com sucesso"
    
    Exemplos:
      |usuario|ligacao|status|
      |tecnico1|Reclamação sobre velox|Resolvido|
      |tecnico2|Reclamação sobre BRT|Desistencia|
      
