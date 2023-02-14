# employee_book

#### O objetivo deste projeto Flutter é fornecer uma aplicação de gestão de funcionários. O arquivo main.dart é o principal ponto de entrada da aplicação e contém o código para inicializar a aplicação e configurar os provedores.

A função ```main()``` cria um widget MultiProvider que fornece três provedores:

# AppDb: 
Esta é uma instância da classe AppDb, que é responsável pelo manuseio do banco de dados local da aplicação. Este provedor permite que outras partes do aplicativo tenham acesso ao banco de dados local.

# EmployeeChangeNotifier: 
Esta é uma instância da classe EmployeeChangeNotifier, que é responsável por gerenciar o estado dos dados dos funcionários. Este provedor permite que outras partes do aplicativo acessem e modifiquem os dados dos funcionários.


- A classe ```MyApp``` é um widget sem estado que configura o widget MaterialApp com várias opções de configuração. O widget MaterialApp é um widget Flutter pré-construído que fornece uma estrutura de aplicação no estilo Material Design.

- A propriedade inicialRoute do widget MaterialApp define a rota inicial do aplicativo como ```'/'```, o que significa que a tela inicial será a primeira tela que o usuário vê.

A propriedade ```onGenerateRoute``` do widget MaterialApp especifica uma função RouteGenerator que gera as rotas para o aplicativo. A função RouteGenerator pega uma rota e retorna um widget que deve ser exibido para essa rota.

