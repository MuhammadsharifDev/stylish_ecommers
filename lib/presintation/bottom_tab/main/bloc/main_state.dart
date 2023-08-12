part of 'main_bloc.dart';


class MainState extends Equatable {

  final BottomMenu bottomMenu;

  const MainState({this.bottomMenu = BottomMenu.home});

  MainState copyWith({BottomMenu? bottomMenu}) =>
      MainState(bottomMenu: bottomMenu ?? this.bottomMenu);

  @override
  List<Object?> get props => [
    bottomMenu,
  ];

}