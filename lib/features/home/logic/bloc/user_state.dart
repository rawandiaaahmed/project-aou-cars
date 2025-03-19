
abstract class UserState  {
}
class UserInitial extends UserState {
}
class UserLoading extends UserState {
}
class UserLoaded extends UserState {
  final String name;
  
  UserLoaded(
     this.name,

  );
  
}
class UserError extends UserState{
  final String message;
  UserError(
     this.message,
  );
  
}