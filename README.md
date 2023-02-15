# employee_book

#### O objetivo deste projeto Flutter é fornecer uma aplicação de gestão de funcionários. Trata-se de uma aplicação simples com ```CRUD``` contendo 5 campos para ```adicionar```, ```editar``` e ```excluir``` funcionário.

#### Os 5 campos são:
- fullName;
- lastName;
- email;
- phone; e
- dateOfBirth.

#### O projeto possui 3 telas:
- Home ``` '/' ```: onde consta a lista de funcionários adicionas;
- Editar Funcionário ``` '/edit_employee' ```: nesta tela é possível editar, atualizar e excluir funcionários ja cadastrados no sistema; e
- Adicionar Funcionário  ``` '/add_employee'```: Tela para adicionar funcionário inserindo os 5 tipos de informações necessárias, ja mencionadas acima.

#### Este projeto possui 12 widgets 

- Scaffold
- AppBar
- IconButton
- Column
- Form
- CustomTextFormField (used 4 times)
- CustomDatePickerFormField
- SizedBox (used 5 times)
- Padding
- Text
- Icon
- Fluttertoast.showToast (invoked in the listener method)

#### O arquivo ```main.dart```é o principal O ponto de entrada da aplicação e contém o código para inicializar a aplicação e configurar os provedores.

A função ```main()``` cria um widget MultiProvider que fornece três provedores:

### AppDb: 
Esta é uma instância da classe AppDb, que é responsável pelo manuseio do banco de dados local da aplicação. Este provedor permite que outras partes do aplicativo tenham acesso ao banco de dados local.

### EmployeeChangeNotifier: 
Esta é uma instância da classe EmployeeChangeNotifier, que é responsável por gerenciar o estado dos dados dos funcionários. Este provedor permite que outras partes do aplicativo acessem e modifiquem os dados dos funcionários.


- A classe ```MyApp``` é um widget sem estado que configura o widget MaterialApp com várias opções de configuração. O widget MaterialApp é um widget Flutter pré-construído que fornece uma estrutura de aplicação no estilo Material Design.

- A propriedade inicialRoute do widget MaterialApp define a rota inicial do aplicativo como ```'/'```, o que significa que a tela inicial será a primeira tela que o usuário vê.

A propriedade ```onGenerateRoute``` do widget MaterialApp especifica uma função RouteGenerator que gera as rotas para o aplicativo. A função RouteGenerator pega uma rota e retorna um widget que deve ser exibido para essa rota.

### EmployeeStreamScreen:

Este código é um trecho de um aplicativo em Flutter que exibe uma lista de funcionários utilizando uma Stream que fornece os dados dos funcionários. A lista é exibida em um ListView.Builder com cada funcionário exibido em um Card.

Na classe EmployeeStreamScreen, a tela é construída com um Scaffold contendo um AppBar com o título "Funcionários stream". O corpo do **Scaffold** contém um StreamBuilder que recebe uma instância de AppDb por meio do ```Provider.of<AppDb>(context).getEmployeeStream()```.

O **StreamBuilder** reage a mudanças na Stream, exibindo um indicador de progresso enquanto a conexão não estiver pronta  ```(ConnectionState.done)``` e exibindo uma mensagem de erro se houver erro na Stream. Caso a conexão esteja pronta e não haja erro, é exibida a lista de funcionários em um **ListView.Builder** com um **GestureDetector** que permite navegar para uma tela de edição de funcionário.

As informações dos funcionários são exibidas em cada **Card**, onde cada funcionário é representado por um objeto **EmployeeData** que contém as informações de:]
- id, 
- primeiro nome, 
- sobrenome, 
- e-mail, 
- telefone e 
- data de nascimento.

### EmployeeFutureScreen:

Esta tela exibe uma lista de funcionários com base em dados fornecidos por um banco de dados local, **SQLite3**. Ele usa o widget **FutureBuilder** para buscar os dados dos funcionários em uma chamada assíncrona ao método ```getEmployees()``` do **AppDb** (banco de dados local). Se a chamada assíncrona ainda não foi concluída, é exibido um **indicador de progresso**. Quando os dados são carregados com sucesso, eles são exibidos em um ```ListView.builder()```, onde cada item da lista é construído a partir de um **Card** contendo as informações do funcionário. Quando o usuário clica em um funcionário, ele é levado para a tela de edição correspondente. Se ocorrer um erro na chamada assíncrona, uma mensagem de erro é exibida na tela. Se não houver dados a serem exibidos, é exibido um Placeholder. Além disso, este código é uma classe que estende **StatefulWidget**.

### AddEmployeeScreen:

Tela Adicionar Funcionário: Aqui implementa-se uma tela para adicionar um novo funcionário a uma lista de funcionários em um banco de dados SQLite.

A tela contém um formulário com campos para:
- primeiro nome, 
- sobrenome, 
- email, 
- telefone e 
- data de nascimento 

do novo funcionário. Quando o usuário clica no botão **"salvar"**, as informações são validadas e, se válidas, o novo funcionário é adicionado ao banco de dados por meio da chamada ao método ```createEmployee()``` do ```EmployeeChangeNotifier```. Além disso, um **listener** é adicionado a **EmployeeChangeNotifier** que exibe um **toast** na tela se o novo funcionário for adicionado com sucesso.

O código utiliza vários widgets do Flutter, como: 
- Scaffold, 
- AppBar, 
- Column, 
- Form, 
- TextFormField, 
- DatePicker, 
- IconButton e 
- SnackBar, bem como os pacotes: 
- drift, 
- provider e 
- fluttertoast.

