import 'package:fall_detection/core/styles/images/assets.dart';
import 'package:fall_detection/feature/notification/presentation/manger/cubits/notificationsCubit.dart';
import 'package:fall_detection/feature/notification/presentation/manger/cubits/notificationsStates.dart';
import 'package:fall_detection/feature/notification/presentation/widget/notification_card_info.dart';
import 'package:fall_detection/core/styles/colors/colors.dart';
import 'package:fall_detection/core/utils/spacing.dart';
import 'package:fall_detection/feature/notification/presentation/widget/all_notification_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationsCubit, Notificationsstates>(
      listener: (context, state) {
        if (state is NotificationsFailer) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.blue,
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is NotificationsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NotificationsLoadedSuccess) {
          final notifications = state.notifications.notifications;
          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 40.h,
                    left: 20.w,
                    right: 20.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          // Handle tap on back button
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      verticalSpace(12.h),
                      const AllNotificationText(),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.r),
                        topRight: Radius.circular(40.r),
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        final notification = notifications[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: NotificationContainerInfo(
                            icon: Icons
                                .phone, // Example icon, replace with actual data
                            content:
                                notification.data.content, // Corrected line
                            min: notification.createdAt,
                            image: AppAssetsImages.fallingImage,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text('unexpected state'));
        }
      },
    );
  }
}
