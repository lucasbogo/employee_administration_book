import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/local/db/app_db.dart';
import '../notifiers/employee_change_notifier.dart';

class EmployeeFutureNotifierScreen extends StatefulWidget {
  const EmployeeFutureNotifierScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeFutureNotifierScreen> createState() =>
      _EmployeeFutureNotifierScreenState();
}

class _EmployeeFutureNotifierScreenState
    extends State<EmployeeFutureNotifierScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('BuildContext');
    final employees =
        context.watch<EmployeeChangeNotifier>().employeeListFuture;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Future'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          final employee = employees[index];
          return GestureDetector(
            onTap: () {
              context.read<EmployeeChangeNotifier>().getEmployee(employee.id);
              //context.read<EmployeeAddressChangeNotifier>().getEmployeeAddress(employee.id);
              Navigator.pushNamed(context, '/edit_employee',
                  arguments: employee.id);
            },
            child: Card(
              //color: Colors.grey.shade400,
              shape: const RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.green,
                      style: BorderStyle.solid,
                      width: 1.2),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0))),
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
