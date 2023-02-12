import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

import '../data/local/db/app_db.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AppDb _db;

  @override
  void initState() {
    super.initState();

    _db = AppDb();
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controle de Funcionários'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<EmployeeData>>(
          future: _db.getEmployees(),
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
                    return Card(
                      color: Colors.grey[200],
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color.fromARGB(179, 55, 201, 193), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
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
                    );
                  });
            }
            return const Placeholder();
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        tooltip: 'Adicionar Funcionário',
        onPressed: () {
          Navigator.pushNamed(context, '/add_employee');
        },
      ),
    );
  }
}
