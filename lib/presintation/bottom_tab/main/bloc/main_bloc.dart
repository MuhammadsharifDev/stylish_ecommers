import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState()) {
    on<SetBottomMenuEvent>(_onChanged);
  }

  void _onChanged(SetBottomMenuEvent event,Emitter<MainState> emit){
    emit(state.copyWith(bottomMenu: event.menu));
  }

}
enum BottomMenu { home, wishlist, basket,search,setting }