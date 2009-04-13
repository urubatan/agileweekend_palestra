Caracteristica: Autenticação e Autorização
  Para que seja possível saber quem esta operando o sistema
  Qualquer usuário
  Precisa se autenticar para acessar qualquer coisa diferente da página de login
  
  Cenário: Tentativa de acesso de usuário não logado
    Dado eu estou na página de novo usuário
    Então eu devo ver "É necessário se autenticar para acessar o sistema"
    E eu devo ver "Name"
    E eu devo ver "Password"
    
  Cenário: Login de usuário inexistente
    Dado eu estou na página de nova sessão
    Quando eu preencho "Name" com "user5"
    E eu preencho "Password" com "Password7"
    E eu presciono "Login"
    Então eu devo ver "Usuário ou senha inválidos"
  
  Cenário: Login de usuário existente
    Dado eu estou na página de nova sessão
    Quando eu preencho "Name" com "user1"
    E eu preencho "Password" com "Password1"
    E eu presciono "Login"
    Então eu devo ver "Usuários do sistema"
    E eu devo ver "Bem vindo"
    E eu devo ver "Usuário 1"

