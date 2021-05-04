import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskii/signin_page.dart';
import 'package:taskii/widgets/authentication_service.dart';

class LogOutPage extends StatelessWidget{
  get selectedIndex => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout'),
      ),
      body: Center(
      child: RaisedButton(
        color: Colors.pink,
        textColor: Colors.white54,
        onPressed: () {
          context.read<AuthenticationService>().signOut();
        },
        child: Text("Logout"),
      ),
      ),
    );
  }

}