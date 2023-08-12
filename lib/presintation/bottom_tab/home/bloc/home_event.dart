part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}


class ListItemsEvent extends HomeEvent{
  ListItemsEvent();

  @override
  List<Object?> get props => [];

}

class ProductsEvent extends HomeEvent{
  ProductsEvent();

  @override
  List<Object?> get props => [];

}

class IsLikeEvent extends HomeEvent{
  final bool isLike;
  IsLikeEvent({required this.isLike});

  @override
  List<Object?> get props => [isLike];
}