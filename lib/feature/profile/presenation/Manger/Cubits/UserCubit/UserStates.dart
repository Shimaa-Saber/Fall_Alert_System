import '../../../../data/Models/UserModel.dart';

abstract class UserState{}

class UserLoading extends UserState{}
class UserSuccess extends UserState{
  final  UserModel user;

  UserSuccess({required this.user});
}
class Userfailer extends UserState{
  final String errorMessage;

  Userfailer({ required this.errorMessage});


}