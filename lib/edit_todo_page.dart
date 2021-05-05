import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskii/widgets/todo_class.dart';
import 'package:taskii/widgets/todoform_widget.dart';
import 'package:taskii/widgets/todolist_provider.dart';


class EditTodoPage extends StatefulWidget {
  final Todo todo;

  const EditTodoPage({Key key, @required this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  void saveTodo() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);

      provider.updateTodo(widget.todo, title);

      Navigator.of(context).pop();
    }
  }

  final _formKey = GlobalKey<FormState>();

  String title;

  @override
  void initState() {
    super.initState();

    title = widget.todo.title;
  }



  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Edit Todo'),
      actions: [
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            final provider =
            Provider.of<TodosProvider>(context, listen: false);
            provider.removeTodo(widget.todo);

            Navigator.of(context).pop();
          },
        )
      ],
    ),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: TodoFormWidget(
          title: title,
          onChangedTitle: (title) => setState(() => this.title = title),
          onSavedTodo: saveTodo,
        ),
      ),
    ),
  );

}
