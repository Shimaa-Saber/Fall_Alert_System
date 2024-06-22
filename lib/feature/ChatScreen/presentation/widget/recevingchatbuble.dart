import 'package:flutter/material.dart';
import 'package:fall_detection/core/styles/colors/colors.dart';

class RecevingChatBuble extends StatelessWidget {
  const RecevingChatBuble({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 16), // Ensure all padding values are provided
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: AppColors.primaryColor,
        ),
        child: Text(
          "Please, I need help here",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}