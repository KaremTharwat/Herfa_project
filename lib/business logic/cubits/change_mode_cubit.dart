import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herfa/business%20logic/states/change_mode_state.dart';

class ChangeModeCubit extends Cubit<ChangeModeState> {
  ChangeModeCubit() : super(WhiteModeState());
  bool isDark = false;
  changeMode(bool value) {
    if (isDark) {
      isDark = false;
      emit(WhiteModeState());
    } else {
      isDark = true;
      emit(DarkModeState());
    }
  }
}
