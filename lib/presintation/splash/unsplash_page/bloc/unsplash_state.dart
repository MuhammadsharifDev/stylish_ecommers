part of 'unsplash_bloc.dart';

@immutable
class UnsplashState extends Equatable{
  final  List<PageList> items;

  const UnsplashState({this.items=const []});

  UnsplashState copyWith({List<PageList>? items}){
   return UnsplashState(items: items?? this.items);
  }


  @override
  List<Object?> get props => [items];
  }

class PageList {
  final String image;
  final String title;
  final String description ;
  PageList({required this.description,required this.image,required this.title });
}