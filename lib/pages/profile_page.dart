import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw4/bloc/authentication_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilledButton(
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(
                  context,
                ).add(AuthenticationLogoutEvent());
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
