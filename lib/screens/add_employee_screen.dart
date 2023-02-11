import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

import '../widgets/custom_text_form_field.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({Key? key}) : super(key: key);

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _dateOfBirthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Employee'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                // TODO: Save Employee
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: _firstNameController,
                    txtLable: 'Nome',
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  CustomTextFormField(
                    controller: _lastNameController,
                    txtLable: 'Sobrenome',
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  CustomTextFormField(
                    controller: _emailController,
                    txtLable: 'Email',
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  CustomTextFormField(
                    controller: _phoneController,
                    txtLable: 'Phone',
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    controller: _dateOfBirthController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        label: const Text('Data de Nascimento'),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () => pickDateOfBirth(context),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Data de nascimento não pode ser vazio';
                      }
                      return null;
                    },
                    onTap: () => pickDateOfBirth(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickDateOfBirth(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    builder:
    (context, child) => Theme(
        data: ThemeData.light().copyWith(
          colorScheme: ColorScheme.light(
            primary: Colors.blue,
            onPrimary: Colors.white,
            surface: Colors.blue,
            onSurface: Colors.black,
          ),
          dialogBackgroundColor: Colors.white,
        ),
        child: child ?? const Text(''));
    if (newDate == null) return;
    setState(() {
      _dateOfBirthController.text = newDate.toIso8601String();
    });
  }
}
