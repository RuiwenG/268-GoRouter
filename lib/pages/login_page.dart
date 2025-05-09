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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
      ),
    );
  }
}
