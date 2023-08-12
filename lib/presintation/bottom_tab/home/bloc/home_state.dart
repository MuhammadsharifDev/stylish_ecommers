part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {

  final List<ListProduct> items;

  const HomeState({this.items = const []});

  HomeState copyWith({List<ListProduct>? items})=>HomeState(items: items?? this.items);

  @override
  List<Object?> get props => [items];
}

class ListProduct {
  final String image;
  final String text;

  ListProduct({required this.text, required this.image});
}