import 'package:flutter/material.dart';

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
                // BlocProvider.of<AuthenticationBloc>(
                //   context,
                // ).add(AuthenticationLoginEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
