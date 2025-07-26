// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSucces extends AuthState {
  final String message;
  AuthSucces({required this.message});
}



class AuthFailure extends AuthState {
  final String error;
  AuthFailure({required this.error});
}

