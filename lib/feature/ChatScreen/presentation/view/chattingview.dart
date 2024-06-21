import 'package:fall_detection/feature/ChatScreen/presentation/widget/chattingbuble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fall_detection/core/styles/colors/colors.dart';

import '../widget/recevingchatbuble.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  static String id = 'chat_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
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
            SizedBox(width: 8),
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
              itemCount: 2, // Adjust itemCount to include both chat bubbles
              itemBuilder: (context, index) {
                if (index == 0) {
                  return ChatBuble(); // First chat bubble
                } else {
                  return RecevingChatBuble(); // Second chat bubble
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
                    decoration: InputDecoration(
                      hintText: ' message...',
                      prefixIcon: Icon(
                        Icons.add,
                        color: Colors.grey,
                      ),
                      suffixIcon: Icon(
                        Icons.emoji_emotions,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: IconButton(
                    icon: Icon(Icons.mic),
                    onPressed: () {
                      // Handle record button press
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
