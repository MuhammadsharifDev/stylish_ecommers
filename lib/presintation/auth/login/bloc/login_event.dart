part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}


class IsVisibleEvent extends LoginEvent{
  final bool isVisibleIcon;
  IsVisibleEvent({required this.isVisibleIcon});

  @override
  List<Object?> get props => [isVisibleIcon];
}

class GmailEvent extends LoginEvent{
 final String email;
 final String password;
  GmailEvent({required this.email,required this.password});

  @override
  List<Object?> get props => [email,password];
}