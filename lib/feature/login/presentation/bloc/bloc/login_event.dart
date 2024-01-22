part of 'login_bloc.dart';

sealed class LoginEvent {}

final class OnLoginRequested extends LoginEvent {
  final String username;
  final String password;

  OnLoginRequested({required this.username, required this.password});
}

