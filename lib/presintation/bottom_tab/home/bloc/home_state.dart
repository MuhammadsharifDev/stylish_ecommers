part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  final List<ListProduct> items;

  final List<ComeProduct> products;

  final bool isLike;

  const HomeState(
      {this.items = const [], this.products = const [], this.isLike = false});

  HomeState copyWith(
          {List<ListProduct>? items,
          List<ComeProduct>? products,
          bool? isLike}) =>
      HomeState(
          items: items ?? this.items,
          products: products ?? this.products,
          isLike: isLike ?? this.isLike);

  @override
  List<Object?> get props => [items, products,isLike];
}

class ListProduct {
  final String image;
  final String text;

  ListProduct({required this.text, required this.image});
}

class ComeProduct {
  final String image;
  final String text;
  final String description;
  final String newCoast;
  final String oldCoast;
  final String offer;
  final String quantity;

  ComeProduct(
      {required this.text,
      required this.image,
      required this.description,
      required this.newCoast,
      required this.oldCoast,
      required this.offer,
      required this.quantity});
}
