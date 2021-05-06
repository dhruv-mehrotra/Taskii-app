import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SingleTodo extends StatelessWidget {
  final String title;
  SingleTodo(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(title),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
      ),
    );
  }
}