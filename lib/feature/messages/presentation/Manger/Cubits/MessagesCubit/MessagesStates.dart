<<<<<<< HEAD
=======


>>>>>>> 8ccabb90406c8dc60c298a6e2177b2a212c3b6ed
import '../../../../Models/MessagesModel/MessagesModel.dart';

abstract class ChatState {
  const ChatState();
<<<<<<< HEAD
}

class ChatInitialState extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoadedSuccess extends ChatState {
  final ChatResponse chatResponse;

  ChatLoadedSuccess(this.chatResponse);
}

class ChatError extends ChatState {
  final String message;

  const ChatError({required this.message});
}
=======

}
  class ChatInitialState extends ChatState {}

  class ChatLoading extends ChatState {}

  class ChatLoadedSuccess extends ChatState {
    final ChatResponse chatResponse;


     ChatLoadedSuccess(this.chatResponse);


  }


  class ChatError extends ChatState {
  final String message;

  const ChatError({required this.message});


  }


>>>>>>> 8ccabb90406c8dc60c298a6e2177b2a212c3b6ed
