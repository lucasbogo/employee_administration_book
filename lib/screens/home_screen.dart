import 'package:drift/drift.dart';
import 'package:employee_book/screens/employee_future_notifier.dart';
import 'package:employee_book/screens/employee_stream.dart';
import 'package:employee_book/screens/employee_future.dart';
import 'package:employee_book/notifiers/employee_change_notifier.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:employee_book/data/local/db/app_db.dart';

import 'employee_stream_notifier.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  //late AppDb _db; // created singleton in main.dart. no need to create here
  final pages = [
    EmployeeFutureScreen(),
    EmployeeStreamNotifierScreen(),
    EmployeeFutureNotifierScreen()
  ];

  @override
  void initState() {
    super.initState();

    // _db = AppDb();
  }

  @override
  void dispose() {
    // _db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[index],
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          tooltip: 'Adicionar Funcionário',
          onPressed: () {
            Navigator.pushNamed(context, '/add_employee');
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            if (value == 1) {
              context.read<EmployeeChangeNotifier>().getEmployeeStream();
            }
            setState(() {
              index = value;
            });
          },
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.black,
          unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
          showSelectedLabels: false,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              activeIcon: Icon(Icons.list_alt_outlined),
              label: 'Lista de funcionários',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              activeIcon: Icon(Icons.business_center_outlined),
              label: 'tela2',
            ),
          ],
        ));
  }
}
