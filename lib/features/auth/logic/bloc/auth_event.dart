abstract class AuthEvent {}
class SignInEvent extends AuthEvent {
  final String email;
  final String password;
  
  
  SignInEvent( {required this.email, required this.password, });
}
class SignUpEvent extends AuthEvent {
 final String email;
 final String firstName;
  final String lastName;
  final String password;
  final String phoneNumber;
  
  
  SignUpEvent({required this.email, required this.firstName, required this.lastName, required this.password, required this.phoneNumber});
}
class ResetPasswordEvent extends AuthEvent {
  final String email;
  ResetPasswordEvent({required this.email});
}

