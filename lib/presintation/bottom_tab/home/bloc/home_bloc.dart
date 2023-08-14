import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:stylish_ecommers_app/presintation/const/utils/app_images.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<LoadDataEvent>(_loadData);
    on<ProductsLikeEvent>(_productsLike);
    on<ChangeStarsEvent>(_changeStarBottom);
  }

  void _loadData(LoadDataEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      items: productItems,
      products: products,
    ));
  }

  void _productsLike(ProductsLikeEvent event, Emitter<HomeState> emit) {
    var newProduct = event.product;
    newProduct = newProduct.copyWith(isLike: !newProduct.isLike);

    var list = [...state.products];

    list.removeAt(event.index);

    list.insert(event.index, newProduct);

    emit(state.copyWith(
      products: list,
    ));
  }

  void _changeStarBottom(ChangeStarsEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(clickStarBottom: event.changeBottom));
  }
}

final List<ListProduct> productItems = [
  ListProduct(text: 'Beauty', image: AppImages.list1_image),
  ListProduct(text: 'Fashion', image: AppImages.list2_image),
  ListProduct(text: 'Kids', image: AppImages.list3_image),
  ListProduct(text: 'Mens', image: AppImages.list4_image),
  ListProduct(text: 'Womens', image: AppImages.list5_image),
];

final List<ComeProduct> products = [
  ComeProduct(
    text: 'Women Printed Kurta',
    image: AppImages.women_image,
    description: 'Neque porro quisquam est qui\ndolorem ipsum quia',
    newCoast: "\$ 1500",
    oldCoast: '\$ 2499',
    offer: '40 % Off',
    quantity: '514078',
    isLike: false,
    favouriteIcon: 'assets/icons_svg/like_icon.svg',
  ),
  ComeProduct(
      favouriteIcon: 'assets/icons_svg/like_icon.svg',
      text: 'HRX by Hrithik Roshan',
      image: AppImages.barsofka_image,
      description: 'Neque porro quisquam est qui\ndolorem ipsum quia',
      newCoast: '\$2499',
      oldCoast: '\$4999',
      offer: '50 % Offer',
      quantity: '481727',
      isLike: false),
];
