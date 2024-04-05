import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_for_college/app/controller/bloc/userhome/bloc/userhome_event.dart';
import 'package:ui_for_college/app/controller/bloc/userhome/bloc/userhome_state.dart';

// admin home bloc

class UserHomeBloc extends Bloc<UserHomeEvent, userHomeState> {
  UserHomeBloc() : super(Indexstate(0)) {
    on<UpdateUserIndexEvent>((event, emit) {
      emit(Indexstate(event.newIndex));
    });
  }
}
