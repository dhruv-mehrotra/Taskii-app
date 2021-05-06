import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:taskii/widgets/singleitem_builder.dart';
import 'package:taskii/widgets/todo_functionality_widget.dart';
import 'package:taskii/widgets/todolist_provider.dart';

import '../signin_page.dart';

class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return todos.isEmpty
        ? Center(
      child: Text(
        'No todos.',
        style: TextStyle(fontSize: 20),
      ),
    )
    : GridView.builder(
        itemCount: todos.length,
        padding: EdgeInsets.all(5),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 0.85,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final todo = todos[index];
          return TodoFunctionalityWidget(todo: todo);
        },
      );

  }
}
