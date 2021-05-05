import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskii/logout_page.dart';
import 'package:taskii/widgets/addtodo_widget.dart';
import 'package:taskii/widgets/authentication_service.dart';
import 'package:taskii/widgets/completed_widget.dart';
import 'package:taskii/widgets/current_todos.dart';
import 'package:taskii/widgets/todo_class.dart';
import 'package:taskii/widgets/todolist_provider.dart';

import 'api/firebase_api.dart';
import 'main.dart';

class PrimaryPage extends StatefulWidget {
  @override
  _PrimaryPageState createState() => _PrimaryPageState();
}

class _PrimaryPageState extends State<PrimaryPage> {
  int selectedIndex = 0;
  final List<Widget> children = [
    TodoListWidget(),
    LogOutPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("To-Dos"),),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white.withOpacity(1),
          selectedItemColor: Colors.pink,
          currentIndex: selectedIndex,
          onTap: (index) =>
              setState(() {
                selectedIndex = index;
              }),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.precision_manufacturing_outlined),
              label: 'To-do',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.outbond, size: 28),
              label: 'Logout :(',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          onPressed: () =>
              showDialog(
                context: context,
                builder: (context) => AddTodoDialogWidget()
                , barrierDismissible: true,
              ),

          child: Icon(Icons.add),
        ),
        body: StreamBuilder<List<Todo>>(
          stream: FirebaseApi.readTodos(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return buildText('Something Went Wrong Try later');
                } else {
                  final todos = snapshot.data;

                  final provider = Provider.of<TodosProvider>(context);
                  provider.setTodos(todos);

                  return children[selectedIndex];
                }
            }
          },
        ),
      );
  }
}

Widget buildText(String text) =>
    Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );

