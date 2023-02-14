import 'package:drift/drift.dart' as drift;
import 'package:employee_book/widgets/custom_date_picker_form_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../notifiers/employee_change_notifier.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../data/local/db/app_db.dart';
import '../widgets/custom_text_form_field.dart';

class EditEmployeeScreen extends StatefulWidget {
  final int id;
  const EditEmployeeScreen({required this.id, Key? key}) : super(key: key);

  @override
  State<EditEmployeeScreen> createState() => _EditEmployeeScreenState();
}

class _EditEmployeeScreenState extends State<EditEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();
  // late AppDb _db; // created singleton in main.dart. no need to create heres
  late EmployeeData _employeeData;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  DateTime? _dateOfBirth;
  late EmployeeChangeNotifier _employeeChangeNotifier;
  int _id = 0;
  int isActive = 0;

  @override
  void initState() {
    super.initState();
    _employeeChangeNotifier =
        Provider.of<EmployeeChangeNotifier>(context, listen: false);
    _employeeChangeNotifier.addListener(providerListener); // added listener

    getEmployee();
  }

  @override
  void dispose() {
    // _db.close(); // created singleton in main.dart. no need to create here
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _dateOfBirthController.dispose();
    _employeeChangeNotifier.removeListener(providerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Funcionário'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                editEmployee();
              },
              icon: const Icon(Icons.save)),
          IconButton(
              onPressed: () {
                deleteEmployee();
              },
              icon: const Icon(Icons.delete))
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
                    height: 2.0,
                  ),
                  CustomTextFormField(
                    controller: _lastNameController,
                    txtLable: 'Sobrenome',
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  CustomTextFormField(
                    controller: _emailController,
                    txtLable: 'Email',
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  CustomTextFormField(
                    controller: _phoneController,
                    txtLable: 'Phone',
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  CustomDatePickerFormField(
                      controller: _dateOfBirthController,
                      txtLable: 'Data de Nascimento',
                      callback: () {
                        pickDateOfBirth(context);
                      })
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
      initialDate: _dateOfBirth ?? initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (context, child) => Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
              surface: Colors.blue,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child ?? const Text('')),
    );
    if (newDate == null) {
      return;
    }
    setState(() {
      _dateOfBirth = newDate;
      String dob = DateFormat('dd/MM/yyyy').format(newDate);
      _dateOfBirthController.text = dob;
    });
  }

  void editEmployee() {
    final isValid = _formKey.currentState?.validate();

    if (isValid != null && isValid) {
      final entity = EmployeeCompanion(
        id: drift.Value(widget.id),
        firstName: drift.Value(_firstNameController.text),
        lastName: drift.Value(_lastNameController.text),
        email: drift.Value(_emailController.text),
        phone: drift.Value(_phoneController.text),
        dateOfBirth: drift.Value(_dateOfBirth!),
      );

      context.read<EmployeeChangeNotifier>().updateEmployee(entity);
      Navigator.popAndPushNamed(context, '/');
    }
  }

  void deleteEmployee() {
    context.read<EmployeeChangeNotifier>().deleteEmployee(widget.id);
    Navigator.popAndPushNamed(context, '/');
  }

  void providerListener() {
    if (_employeeChangeNotifier.isUpdated) {
      listenUpdateProvider();
      Navigator.popAndPushNamed(context, '/');
    } else if (_employeeChangeNotifier.isDeleted) {
      listenDeleteProvider();
      Navigator.popAndPushNamed(context, '/');
    }
  }

  void listenDeleteProvider() {
    // toast message
    Fluttertoast.showToast(
      msg: 'Funcionário deletado com sucesso',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    context.read<EmployeeChangeNotifier>().setIsDeleted(false);
  }

  void listenUpdateProvider() {
    // toast message that that pops automatically
    Fluttertoast.showToast(
      msg: 'Funcionário atualizado com sucesso',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    context.read<EmployeeChangeNotifier>().setIsUpdated(false);
  }

  Future<void> getEmployee() async {
    _employeeData =
        await Provider.of<AppDb>(context, listen: false).getEmployee(widget.id);
    _firstNameController.text = _employeeData.firstName;
    _lastNameController.text = _employeeData.lastName;
    _emailController.text = _employeeData.email;
    _phoneController.text = _employeeData.phone;
    _dateOfBirthController.text =
        _employeeData.dateOfBirth.toLocal().toString();
  }

  //void showSuccessToast(String message) {
  //  Fluttertoast.showToast(
  //    msg: message,
  //    toastLength: Toast.LENGTH_SHORT,
  //    gravity: ToastGravity.BOTTOM,
  //    timeInSecForIosWeb: 1,
  //    backgroundColor: Colors.green,
  //    textColor: Colors.white,
  //    fontSize: 16.0,
  //  );
  //}

  //void showErrorToast(String message) {
  //  Fluttertoast.showToast(
  //    msg: message,
  //    toastLength: Toast.LENGTH_SHORT,
  //    gravity: ToastGravity.BOTTOM,
  //    timeInSecForIosWeb: 1,
  //    backgroundColor: Colors.red,
  //    textColor: Colors.white,
  //    fontSize: 16.0,
  //  );
  //}
}
