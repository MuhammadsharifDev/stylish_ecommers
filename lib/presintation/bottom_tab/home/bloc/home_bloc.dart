import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:stylish_ecommers_app/presintation/const/utils/app_images.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<ListItemsEvent>(_putItems);
  }
    void _putItems(ListItemsEvent event,Emitter<HomeState> emit){
      emit(state.copyWith(items: productItems));
    }
  }


final List<ListProduct> productItems=[
  ListProduct(text: 'Beauty', image: 'assets/image_png/list1_image.jpg'),
  ListProduct(text: 'Fashion', image: 'assets/image_png/list2_image.jpg'),
  ListProduct(text: 'Kids', image: 'assets/image_png/list3_image.jpg'),
  ListProduct(text: 'Mens', image: 'assets/image_png/list4_image.jpg'),
  ListProduct(text: 'Womens', image: 'assets/image_png/list5_image.jpg'),
];