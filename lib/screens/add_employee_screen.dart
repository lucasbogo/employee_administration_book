import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Funcionário'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              // TODO: Salvar funcionário
            },
          ),
        ],
      ),
      body: Column(children: [
        TextFormField(
          controller: ,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            labelText: 'Nome',
            hintText: 'Digite o nome do funcionário',
          ),
        ),
        TextFormField(
          controller: ,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            labelText: 'Sobrenome',
            hintText: 'Digite o sobrenome do funcionário',
          ),
        ),
        TextFormField(
          controller: ,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            labelText: 'Cargo',
            hintText: 'Digite o cargo do funcionário',
          ),
        ),
        TextFormField(
          controller: ,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            labelText: 'Salário',
            hintText: 'Digite o salário do funcionário',
          ),
        ),
        TextFormField(
          controller: ,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            labelText: 'Data de Nascimento',
            hintText: 'Digite a data de nascimento do funcionário',
          ),
        ),
        TextFormField(
          controller: ,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            labelText: 'Data de Admissão',
            hintText: 'Digite a data de admissão do funcionário',
          ),
        ),
        TextFormField(
          controller: ,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            labelText: 'Data de Demissão',
            hintText: 'Digite a data de demissão do funcionário',
          ),
        ),
        TextFormField(
          controller: ,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            labelText: 'CPF',
            hintText: 'Digite o CPF do funcionário',
          ),
        ),
        TextFormField(
          controller: ,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            labelText: 'RG',
            hintText: 'Digite o RG do funcionário',
          ),
        ),
        TextFormField(
          controller: ,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            labelText: 'Endereço',
            hintText: 'Digite o endereço do funcionário',
          ),
        ),
        TextFormField(
          controller: ,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            labelText: 'Telefone',
            hintText: 'Digite o telefone do funcionário',
          ),
        ),
        TextFormField(
          controller: ,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            labelText: 'E-mail',
            hintText: 'Digite o e-mail do funcionário',
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),

    );  
  }
}
