import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthenticationState {}
class Unauthenticated extends AuthenticationState {}

class AuthenticationBloc extends Cubit<AuthenticationState> {
  AuthenticationBloc() : super(Unauthenticated());

  void logIn() => emit(Authenticated());
  void logOut() => emit(Unauthenticated());
}
