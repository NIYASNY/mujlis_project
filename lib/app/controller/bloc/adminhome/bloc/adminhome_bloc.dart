import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_for_college/app/controller/bloc/adminhome/bloc/adminhome_event.dart';
import 'package:ui_for_college/app/controller/bloc/adminhome/bloc/adminhome_state.dart';

// admin home bloc

class AdminPageBloc extends Bloc<AdminPageEvent, AdminPageState> {
  AdminPageBloc() : super(IndexState(0)) {
    on<UpdateIndexEvent>((event, emit) {
      emit(IndexState(event.newIndex));
    });
  }
}
