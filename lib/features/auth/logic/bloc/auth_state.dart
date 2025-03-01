abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSucces extends AuthState {
  final String message;
  AuthSucces({required this.message});
}
class AuthFailure
    extends AuthState {
  final String error;
  AuthFailure({required this.error});
}
