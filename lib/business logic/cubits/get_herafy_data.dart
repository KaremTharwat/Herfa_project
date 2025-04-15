import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herfa/business%20logic/states/user_state.dart';
import 'package:herfa/data/models/MaintenanceMan_model/herafy_model.dart';
import 'package:herfa/helper/get_herafy_data.dart';

class GetHerafyDataCubit extends Cubit<GetDataState> {
  GetHerafyDataCubit() : super(InitState());
  HerafyModel? herafyModel;
  

 Future<HerafyModel?> getHerafyDataMethodCubit() async {
    emit(LoadingState());
    herafyModel = await getHerafyData();
    emit(LoadedState());
    return herafyModel;
  }
}
