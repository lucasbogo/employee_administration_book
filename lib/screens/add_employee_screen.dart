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

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
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
                    controller: _userNameController,
                    txtLable: 'User Name',
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  CustomTextFormField(
                    controller: _firstNameController,
                    txtLable: 'First Name',
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  CustomTextFormField(
                    controller: _lastNameController,
                    txtLable: 'Last Name',
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
                  CustomTextFormField(
                    controller: _dateOfBirthController,
                    txtLable: 'Date of Birth',
                  ),
                  const SizedBox(
                    height: 8.0,
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
    if (newDate == null) return;
    _dateOfBirthController.text = newDate.toString();
  }
}
