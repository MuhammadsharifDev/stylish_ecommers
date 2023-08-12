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
  ListProduct(text: 'Beauty', image: AppImages.list1_image),
  ListProduct(text: 'Fashion', image: AppImages.list2_image),
  ListProduct(text: 'Kids', image: AppImages.list3_image),
  ListProduct(text: 'Mens', image: AppImages.list4_image),
  ListProduct(text: 'Womens', image: AppImages.list5_image),
];