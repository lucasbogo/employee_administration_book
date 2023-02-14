import 'package:employee_book/notifiers/employee_change_notifier.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// stream

import '../data/local/db/app_db.dart';

class EmployeeStreamNotifierScreen extends StatefulWidget {
  const EmployeeStreamNotifierScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeStreamNotifierScreen> createState() =>
      _EmployeeStreamNotifierScreenState();
}

class _EmployeeStreamNotifierScreenState
    extends State<EmployeeStreamNotifierScreen> {
  // late AppDb _db; // created singleton in main.dart. no need to create here

  @override
  void initState() {
    super.initState();

    // _db = AppDb(); // created singleton in main.dart. no need to create here
  }

  @override
  void dispose() {
    //  _db.close(); // created singleton in main.dart. no need to create here
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final employees =
        context.watch<EmployeeChangeNotifier>().employeeListStream;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Funcionários stream'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          final employee = employees[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/edit_employee',
                  arguments: employee.id);
            },
            child: Card(
              color: Colors.grey[200],
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                    color: Color.fromARGB(179, 55, 201, 193), width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(employee.id.toString()),
                    Text(employee.firstName.toString()),
                    Text(employee.lastName.toString()),
                    Text(employee.email.toString()),
                    Text(employee.phone.toString()),
                    Text(employee.dateOfBirth.toString()),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
