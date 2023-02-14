import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// stream

import '../data/local/db/app_db.dart';

class EmployeeStreamScreen extends StatefulWidget {
  const EmployeeStreamScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeStreamScreen> createState() => _EmployeeStreamScreenState();
}

class _EmployeeStreamScreenState extends State<EmployeeStreamScreen> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Funcionários stream'),
        centerTitle: true,
      ),
      body: StreamBuilder<List<EmployeeData>>(
          stream: Provider.of<AppDb>(context).getEmployeeStream(),
          builder: (context, snapshot) {
            final List<EmployeeData>? employees = snapshot.data;

            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (employees != null) {
              return ListView.builder(
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
                              color: Color.fromARGB(179, 55, 201, 193),
                              width: 1),
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
                  });
            }
            return const Placeholder();
          }),
    );
  }
}
