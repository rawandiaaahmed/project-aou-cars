// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/features/profile_cars/data/repository/profile_repository.dart';
import 'package:flutter_application_1/features/profile_cars/logic/bloc/profile_event.dart';
import 'package:flutter_application_1/features/profile_cars/logic/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;
  ProfileBloc({
    required this.profileRepository,
  }) : super(ProfileInitial()) {
    on<LoadProfile>((event, emit) async {
      emit(ProfileLoading());
      try {
        final userData = await profileRepository.getUserData();
        if (userData != null) {
          emit(ProfileLoaded(
            firstname: userData['firstname'] ?? 'unknown',
            phonenumber: userData['phonenumber'] ?? 'no phone',
          ));
        } else {
          emit(ProfileError(message: 'User not found'));
        }
      } catch (e) {
        emit(ProfileError(message: e.toString()));
      }
    });
  }
}
