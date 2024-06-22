import 'package:fall_detection/feature/profile/presenation/Manger/Cubits/UserCubit/UserStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/services/network/api/api_consumer.dart';
import '../../../../../../core/services/network/api/api_endpoints.dart';
import '../../../../../../core/services/network/error/exceptions.dart';
import '../../../../data/Models/UserModel.dart';

class UserCubit extends Cubit<UserState>{

  final ApiConsumer api;

  UserCubit(super.initialState, this.api);

UserModel? user;
  getUserProfile( ) async {
    try {
      emit(UserLoading());
      final bool deep=true;
      final response = await api.get(
          EndPoints.getUserProfile,
          queryParameters: {
            'deep': deep
          });


      emit(UserSuccess(user: UserModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(Userfailer(errorMessage: e.errModel.message));
    }
  }






}