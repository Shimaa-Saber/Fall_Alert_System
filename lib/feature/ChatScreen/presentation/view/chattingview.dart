import 'package:fall_detection/feature/ChatScreen/presentation/widget/chattingbuble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fall_detection/core/styles/colors/colors.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});
  static String id = 'chat_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/images/patientfall.png',
              height: 50,
            ),
            SizedBox(width: 8), // Add spacing between image and text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return ChatBuble();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.send,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
