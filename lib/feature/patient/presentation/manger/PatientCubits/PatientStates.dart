import 'package:fall_detection/feature/patient/data/model/PatientModel.dart';

abstract class PatientState{}

class PatientLoading extends PatientState{}
class PatientSucess extends PatientState{
  final  PatientModel patient;

  PatientSucess({required this.patient});
}
class PatientFailer extends PatientState{
  final String errorMessage;

  PatientFailer({ required this.errorMessage});


}