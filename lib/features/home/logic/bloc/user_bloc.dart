import 'package:flutter_application_1/features/home/data/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_event.dart';
import 'user_state.dart';


class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserInitial()) {
    on<FetchUserName>(_onFetchUserName);
  }

  void _onFetchUserName(FetchUserName event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final name = await userRepository.getUserName();
      emit(UserLoaded(name));
    } catch (e) {
      emit(UserError("Failed to load user data"));
    }
  }
}