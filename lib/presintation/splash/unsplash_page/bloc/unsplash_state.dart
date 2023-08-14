part of 'unsplash_bloc.dart';

@immutable
class UnsplashState extends Equatable {
  final List<PageList> items;
  final bool changedPage;
  final int index;

  const UnsplashState({
    this.items = const [],
    this.changedPage = false,
    this.index = 0,
  });

  UnsplashState copyWith({
    List<PageList>? items,
    bool? changedPage,
    int? index,
  }) {
    return UnsplashState(
      items: items ?? this.items,
      changedPage: changedPage ?? this.changedPage,
      index: index ?? this.index,
    );
  }

  @override
  List<Object?> get props => [items, changedPage, index];
}

class PageList {
  final String image;
  final String title;
  final String description;

  PageList({
    required this.description,
    required this.image,
    required this.title,
  });
}
