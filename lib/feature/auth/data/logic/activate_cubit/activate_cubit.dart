import 'package:fall_detection/core/services/network/api/api_endpoints.dart';
import 'package:fall_detection/core/services/network/api/dio_consumer.dart';
import 'package:fall_detection/feature/auth/data/logic/activate_cubit/activate_state.dart';
import 'package:fall_detection/feature/auth/data/model/activate_user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivateUserCubit extends Cubit<ActivateUserState> {
  ActivateUserCubit(this.dio) : super(ActivateUserInitial());
  DioConsumer dio;

  final List<TextEditingController> otpControllers =
      List.generate(4, (_) => TextEditingController());

  void onOTPChanged(String value) {
    // Handle OTP change
    print('OTP changed: $value');
  }

  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    
  }

  void clearControllers() {
    // emailController.clear();
    for (var controller in otpControllers) {
      controller.clear();
    }
  }

  ActivateUserModel? user;

  Future<void> activateUser(String email) async {
    try {
      emit(ActivateUserLoading());
      final otp = otpControllers.map((controller) => controller.text).join();
      final response = await dio.post(
        EndPoints.verifyUserAccount,
        data: {
          "email": email,
          "otp": int.parse(otp),
        },
      );
      if (response != null) {
        user = ActivateUserModel.fromJson(response);
        emit(ActivateUserSuccess());
      } else {
        // emit(ActivateUserErrorState(response.toString()));
      }
    } on Exception catch (e) {
      emit(ActivateUserError(e.toString()));
      // print(e);
    }
  }
}
