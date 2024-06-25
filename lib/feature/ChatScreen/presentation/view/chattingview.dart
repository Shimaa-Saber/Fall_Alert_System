// import './pusher_services.dart';
import 'dart:convert';
import 'package:fall_detection/feature/ChatScreen/presentation/services/pusher_services.dart';
import 'package:fall_detection/feature/ChatScreen/presentation/widget/chattingbuble.dart';
import 'package:fall_detection/feature/ChatScreen/presentation/widget/recevingchatbuble.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
// import 'package:pusher_chat_flutter/chatbuble.dart';
// import 'package:pusher_chat_flutter/recievingchatbuble.dart';
// import 'pusher_service.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  static String id = 'chat_view';

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final PusherService _pusherService = PusherService();
  final Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    //private-chat.$_controller.$receiverID
    _pusherService.subscribeToChannel('chat', (dynamic data) {
      final message = json.decode(data);
      setState(() {
        _messages.add({
          'message': message['message'],
          // 'sender': message['sender'],
        });
      });
    });
  }

  @override
  void dispose() {
    _pusherService.disconnect();
    super.dispose();
  }

  Future<void> _sendMessage(String message) async {
    try {
      final response = await _dio.post(
        "https://fallyguardapi.me/api/v1/chat/31",
        data: {
          'message': message,
          // 'sender': _controller.text,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer 20|jjFlJn2EIq3Ah6CLcpydb9mVNstWGJUrkOPJDsSoa57a0f8a',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        setState(() {
          _messages.add({
            'message': message,
            // 'sender': _controller.text,
          });
        });
      }
    } catch (e) {
      print('Error sending message: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Karine',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Online',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Image.asset(
              'assets/images/patientfall.png',
              height: 50,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                if (message['sender'] == 'you') {
                  return ChatBuble(message: message['message']!);
                } else {
                  return RecevingChatBuble(message: message['message']!);
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: ' message...',
                      prefixIcon: const Icon(
                        Icons.add,
                        color: Colors.grey,
                      ),
                      suffixIcon: const Icon(
                        Icons.emoji_emotions,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.lightBlue,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      final message = _controller.text;
                      if (message.isNotEmpty) {
                        _sendMessage(message);
                        _controller.clear();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



