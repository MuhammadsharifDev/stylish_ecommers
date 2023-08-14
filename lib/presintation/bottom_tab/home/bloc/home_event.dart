part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LoadDataEvent extends HomeEvent {
  LoadDataEvent();

  @override
  List<Object?> get props => [];
}

class ProductsLikeEvent extends HomeEvent {
  final ComeProduct product;
  final int index;

  ProductsLikeEvent({required this.product, required this.index});

  @override
  List<Object?> get props => [product, index];
}

class ChangeStarsEvent extends HomeEvent {
  final bool changeBottom;

  ChangeStarsEvent({required this.changeBottom});

  @override
  List<Object?> get props => [changeBottom];
}
