import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:fall_detection/core/services/network/api/api_consumer.dart';
import 'package:fall_detection/core/services/network/error/exceptions.dart';
import 'package:fall_detection/core/services/shared_prefrences/shared_pref.dart';

import '../../../../../../core/services/network/api/api_endpoints.dart';
import '../../../../../auth/presentation/Manger/Cubits/AuthCubit/Auth_States.dart';
import '../../../../Models/MessagesModel/MessagesModel.dart';
import 'MessagesStates.dart';


// States


class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.api) : super(ChatInitialState());
  final ApiConsumer api;
  Chat? chats;



  Future<void> fetchChats() async {
    emit(ChatLoading());

    try {
      final response = await api.get(
          EndPoints.chats
      );
      final chatResponse = ChatResponse.fromJson(response);
      emit(ChatLoadedSuccess(chatResponse));
    }
      on ServerException catch (error) {
      emit(ChatError(message: error.errModel.message!));
    }
  }
}
