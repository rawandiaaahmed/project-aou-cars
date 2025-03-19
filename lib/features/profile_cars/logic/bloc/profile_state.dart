// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class ProfileState  {
}
class ProfileInitial extends ProfileState {
}
class ProfileLoading extends ProfileState {
}
class ProfileLoaded extends ProfileState {
  final String firstname;
  final String phonenumber;
  ProfileLoaded({
    required this.firstname,
    required this.phonenumber,
  });
  
}
class ProfileError extends ProfileState {
  final String message;
  ProfileError({
    required this.message,
  });
  
}
