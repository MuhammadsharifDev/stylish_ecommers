

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<IsVisibleEvent>(_isVisibleIcon);
    on<GmailEvent>(_login);
  }
  void _isVisibleIcon(IsVisibleEvent event,Emitter<LoginState> emit){
    emit(state.copyWith(isVisible:event.isVisibleIcon));
  }

  Future<void> _login(GmailEvent event,Emitter<LoginState> emit) async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: event.email, password: event.password);
  }
}
