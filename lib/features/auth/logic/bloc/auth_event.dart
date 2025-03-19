abstract class AuthEvent {}
class SignInEvent extends AuthEvent {
  final String email;
  final String password;
  
  
  SignInEvent( {required this.email, required this.password, });
}
class SignUpEvent extends AuthEvent {
 final String email;
 final String firstname;
  final String lastname;
  final String password;
  final String phonenumber;
  
  
  SignUpEvent({required this.email, required this.firstname, required this.lastname, required this.password, required this.phonenumber});
}
class ResetPasswordEvent extends AuthEvent {
  final String email;
  ResetPasswordEvent({required this.email});
}

