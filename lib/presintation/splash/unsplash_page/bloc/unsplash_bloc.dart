import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:stylish_ecommers_app/presintation/const/utils/app_images.dart';

part 'unsplash_event.dart';

part 'unsplash_state.dart';

class UnsplashBloc extends Bloc<UnsplashEvent, UnsplashState> {
  UnsplashBloc() : super(const UnsplashState()) {
    on<PageViewEvent>(_pageControl);
  }

  void _pageControl(PageViewEvent event, Emitter<UnsplashState> emit) {
    emit(state.copyWith(items:pageItems));
  }
}

final List<PageList> pageItems = [
  PageList(
      description: 'Amet minim mollit non deserunt ullamco est\nsit aliqua dolor do amet sint. Velit officia\nconsequat duis enim velit mollit.',
      image: 'assets/image_png/unsplash_1.jpg',
      title: 'Choose Products'),
  PageList(
      description: 'Amet minim mollit non deserunt ullamco est\nsit aliqua dolor do amet sint. Velit officia\nconsequat duis enim velit mollit.',
      image: AppImages.unsplash_2_image,
      title: 'Make Payment'),
  PageList(
      description: 'Amet minim mollit non deserunt ullamco est\nsit aliqua dolor do amet sint. Velit officia\nconsequat duis enim velit mollit.',
      image: AppImages.unsplash_3_image,
      title: 'Get Your Order'),
];