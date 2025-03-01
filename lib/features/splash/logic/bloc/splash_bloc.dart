import 'package:flutter_application_1/features/splash/logic/bloc/splash_event.dart';
import 'package:flutter_application_1/features/splash/logic/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(splashInital()) {
    on<StartSplash>((event, emit) async {
      await Future.delayed(Duration(seconds: 4));
      emit(splashFinished());
    });
  }
}
