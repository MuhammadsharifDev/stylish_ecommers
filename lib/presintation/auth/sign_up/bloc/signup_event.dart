part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class VisibleEvent extends SignupEvent{
  final bool isVisible;
  VisibleEvent({required this.isVisible});

  @override
  List<Object?> get props => [isVisible];
}