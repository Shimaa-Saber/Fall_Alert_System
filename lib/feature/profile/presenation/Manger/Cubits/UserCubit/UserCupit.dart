import 'package:fall_detection/feature/messages/presentation/Manger/Cubits/MessagesCubit/MessagesStates.dart';
import 'package:fall_detection/feature/profile/presenation/Manger/Cubits/UserCubit/UserStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/services/network/api/api_consumer.dart';
import '../../../../../../core/services/network/api/api_endpoints.dart';
import '../../../../../../core/services/network/error/exceptions.dart';
import '../../../../data/Models/UserModel.dart';

class UserCubit extends Cubit<UserState>{

  UserCubit( this.api) : super(UserInitialstate());


  final ApiConsumer api;

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
      emit(Userfailer(errorMessage: e.errModel.message!));
    }
  }

// Future<void> fetchChats() async {
//     emit(ChatLoading());

//     try {
//       final response = await api.get(EndPoints.chats);
//       final chatResponse = ChatResponse.fromJson(response);
//       emit(ChatLoadedSuccess(chatResponse));
//     } on ServerException catch (error) {
//       emit(ChatError(message: error.errModel.message!));
//     }
//   }




}