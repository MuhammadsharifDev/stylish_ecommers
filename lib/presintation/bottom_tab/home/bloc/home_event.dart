part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}


class ListItemsEvent extends HomeEvent{
  ListItemsEvent();

  @override
  List<Object?> get props => [];

}