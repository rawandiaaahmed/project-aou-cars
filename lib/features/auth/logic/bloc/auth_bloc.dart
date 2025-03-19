import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/features/auth/data/repository/auth_repository.dart';
import 'package:flutter_application_1/features/auth/logic/bloc/auth_event.dart';
import 'package:flutter_application_1/features/auth/logic/bloc/auth_state.dart';



class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()){
    on<SignInEvent>((event, emit) async {
      emit(AuthLoading());
      try {
       await authRepository.signIn(event.email, event.password);
         emit(AuthSucces(message: 'password reset email sent'));
        
      } catch (e) {
        emit(AuthFailure(error: e.toString()));
      }
    });
    on<SignUpEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.signUp(event.email, event.password,event.firstname,event.phonenumber,event.lastname );
        emit(AuthSucces(message: 'password reset email sent'));
      } catch (e) {
        emit(AuthFailure(error: e.toString()));
      }
    });
    on<ResetPasswordEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.resetPassword(event.email);
       emit(AuthSucces(message: 'password reset email sent'));
      } catch (e) {
        emit(AuthFailure(error: e.toString()));
      }
    });
 
    
  }
  
}
