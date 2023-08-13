part of 'unsplash_bloc.dart';

@immutable
abstract class UnsplashEvent {}

class PageViewEvent extends UnsplashEvent{
  PageViewEvent();
  @override
  List<Object?> get props =>[];
}