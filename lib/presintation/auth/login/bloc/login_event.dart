part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}


class IsVisibleEvent extends LoginEvent{
  final bool isVisibleIcon;
  IsVisibleEvent({required this.isVisibleIcon});

  @override
  List<Object?> get props => [isVisibleIcon];
}