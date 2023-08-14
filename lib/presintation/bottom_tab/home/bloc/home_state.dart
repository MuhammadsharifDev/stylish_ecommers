part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  final List<ListProduct> items;
  final List<ComeProduct> products;
  final bool clickStarBottom;
  final bool isLike;

  const HomeState(
      {this.items = const [],
      this.products = const [],
      this.clickStarBottom = false,
      this.isLike = false});

  HomeState copyWith(
          {List<ListProduct>? items,
          List<ComeProduct>? products,
          bool? isLike,
          bool? clickStarBottom}) =>
      HomeState(
          items: items ?? this.items,
          products: products ?? this.products,
          isLike: isLike ?? this.isLike,
          clickStarBottom: clickStarBottom ?? this.clickStarBottom);

  @override
  List<Object?> get props => [items, products, clickStarBottom, isLike];
}

class ListProduct {
  final String image;
  final String text;

  ListProduct({required this.text, required this.image});
}

class ComeProduct {
  final String image;
  final String favouriteIcon;
  final String text;
  final String description;
  final String newCoast;
  final String oldCoast;
  final String offer;
  final String quantity;
  final bool isLike;

  ComeProduct({
    required this.isLike,
    required this.favouriteIcon,
    required this.text,
    required this.image,
    required this.description,
    required this.newCoast,
    required this.oldCoast,
    required this.offer,
    required this.quantity,
  });

  ComeProduct copyWith({
    bool? isLike,
  }) {
    return ComeProduct(
      isLike: isLike ?? this.isLike,
      favouriteIcon: favouriteIcon,
      text: text,
      image: image,
      description: description,
      newCoast: newCoast,
      oldCoast: oldCoast,
      offer: offer,
      quantity: quantity,
    );
  }
}
