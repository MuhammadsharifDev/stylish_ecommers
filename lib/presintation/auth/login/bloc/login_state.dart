part of 'login_bloc.dart';

@immutable

class LoginState extends Equatable{
  final bool isVisible;
  const LoginState({this.isVisible=false});

  LoginState copyWith({bool? isVisible}){
    return LoginState(isVisible:isVisible?? this.isVisible);
  }

  @override
  List<Object?> get props => [isVisible];
}