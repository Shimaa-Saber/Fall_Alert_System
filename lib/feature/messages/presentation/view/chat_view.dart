import 'package:fall_detection/core/styles/images/assets.dart';
import 'package:fall_detection/feature/messages/presentation/Manger/Cubits/MessagesCubit/MessagesCubit.dart';
import 'package:fall_detection/feature/messages/presentation/Manger/Cubits/MessagesCubit/MessagesStates.dart';
import 'package:fall_detection/feature/messages/presentation/widget/message_container_info.dart';
import 'package:fall_detection/feature/messages/presentation/widget/message_text_widget.dart';

import 'package:fall_detection/core/extensions/context_extension.dart';
import 'package:fall_detection/core/styles/colors/colors.dart';
import 'package:fall_detection/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/routes.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key});
  // static String id = 'notification_view';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit,ChatState>(
      listener: (context, state) {
        if (state is ChatError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.blue,
                content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        if (state is ChatLoading){
          return Center(child: const CircularProgressIndicator());
        }else if (state is ChatLoadedSuccess){
          final Chats=state.chatResponse.chats;
          return  Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: Column(
              children: [
                Padding(
                  // horizontal: context.width * 0.033,
                  // vertical: context.height * 0.053,
                  padding: EdgeInsets.only(
                    top: context.height * 0.053,
                    left: context.width * 0.033,
                    right: context.width * 0.033,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      verticalSpace(12),
                      const MessageTextWidget(),
                    ],
                  ),
                ),
                Container(
                  height: context.height * 0.76093,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: Chats.length,
                    itemBuilder: (context, index) {
                      final chat =Chats[index];
                      return GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, Routes.ChatView);
                        },
                        child:  Padding(
                            padding: EdgeInsets.all(8.0),
                            child: MessageContainerInfo(
                              image: chat.sender.photo!,
                              title: '${chat.sender.name}',
                              text: '${chat.message}',
                              min: '${chat.createdAt}',
                            )),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        }else {
          return Center(child:Text('unexpexted state'));
        }


      },

    );
  }
}
