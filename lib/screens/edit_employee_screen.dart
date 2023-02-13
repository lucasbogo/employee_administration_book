import 'package:drift/drift.dart' as drift;
import 'package:employee_book/widgets/custom_date_picker_form_field.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  late EmployeeData _employee;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
