import 'package:fall_detection/core/services/network/api/api_consumer.dart';
import 'package:fall_detection/feature/patient/data/model/PatientModel.dart';
import 'package:fall_detection/feature/patient/presentation/manger/PatientCubits/PatientStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/services/network/api/api_endpoints.dart';
import '../../../../../../core/services/network/error/exceptions.dart';

class PatientCubit extends Cubit<PatientState> {
  final ApiConsumer api;

  PatientCubit(super.initialState, this.api);

  PatientModel? patient;

  getPatientProfile() async {
    try {
      emit(PatientLoading());
      final bool deep = true;
      final response = await api.get(
        EndPoints.getPatientProfile,
        queryParameters: {'deep': deep},
      );
      emit(PatientSucess(patient: PatientModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(PatientFailer(errorMessage: e.errModel.message!));
    }
  }
}
