import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final ValueChanged<String> onChangedTitle;
  final VoidCallback onSavedTodo;

  const TodoFormWidget({
    Key key,
    this.title = '',
    @required this.onChangedTitle,
    @required this.onSavedTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTitle(),
        SizedBox(height: 25),
        buildButton(),
        SizedBox(height: 15,)
      ],
    ),
  );

  Widget buildTitle() => TextFormField(
    maxLines: 3,
    initialValue: title,
      style: TextStyle(color: Colors.teal),
    onChanged: onChangedTitle,
    validator: (title) {
      if (title.isEmpty) {
        return 'The title cannot be empty';
      }
      return null;
    },
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.teal,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      border: UnderlineInputBorder(),
      labelText: 'Title',
    ),
  );

  Widget buildButton() => SizedBox(
    width: 150,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.pink),
      ),
      onPressed: onSavedTodo,
      child: Text('Save'),
    ),
  );
}
