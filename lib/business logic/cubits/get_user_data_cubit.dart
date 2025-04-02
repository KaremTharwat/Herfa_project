import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herfa/business%20logic/states/user_state.dart';
import 'package:herfa/data/models/user_model/user_model.dart';
import 'package:herfa/helper/get_user_data.dart';

class GetUserDataCubit extends Cubit<GetDataState> {
  GetUserDataCubit() : super(InitState());
  UserModel? userModel;

  getUserDataMethodCubit() async {
    emit(LoadingState());
    userModel= await getUserData();
    emit(LoadedState());
  }
}
