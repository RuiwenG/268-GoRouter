import 'package:flutter/material.dart';
import 'package:hw4/bloc/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: Column(
          children: [
            Text("Router Demo Login"),
            FilledButton(
              child: Text("Login"),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(
                  context,
                ).add(AuthenticationLoginEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
