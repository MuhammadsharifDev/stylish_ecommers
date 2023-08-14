import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(const SignupState()) {
    on<VisibleEvent>(_visibleIcon);
  }
  void _visibleIcon(VisibleEvent event,Emitter<SignupState> emit){
    emit(state.copyWith(isVisibleIcon: event.isVisible));
  }
}
