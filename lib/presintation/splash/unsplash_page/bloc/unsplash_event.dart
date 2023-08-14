part of 'unsplash_bloc.dart';

@immutable
abstract class UnsplashEvent {}

class PageViewEvent extends UnsplashEvent {
  PageViewEvent();

  @override
  List<Object?> get props => [];
}

class ChangeEvent extends UnsplashEvent {
  final int index;

  ChangeEvent({required this.index});

  @override
  List<Object>? get props => [index];
}
