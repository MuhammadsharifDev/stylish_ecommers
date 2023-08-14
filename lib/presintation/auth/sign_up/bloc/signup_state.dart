part of 'signup_bloc.dart';

@immutable


class SignupInitial extends SignupState {}

class SignupState extends Equatable{
  final bool isVisibleIcon;

  const SignupState({this.isVisibleIcon=false});

  SignupState copyWith({bool? isVisibleIcon}){
    return SignupState(isVisibleIcon:isVisibleIcon?? this.isVisibleIcon);
  }

  @override

  List<Object?> get props => [isVisibleIcon];

}