import 'package:fall_detection/core/services/network/api/api_endpoints.dart';
import 'package:fall_detection/core/services/network/error/exceptions.dart';
import 'package:fall_detection/feature/notification/presentation/manger/cubits/notificationsStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/network/api/api_consumer.dart';
import '../../../Data/Moddels/NotificationModel.dart';

class NotificationsCubit extends Cubit<Notificationsstates> {
  NotificationsCubit(this.api) : super(NotificationIntialState());
  final ApiConsumer api;
  NotificationsModel? notifications;

  Future<void> fetchNotifications() async {
    emit(NotificationsLoading());

    try {
      final response = await api.get(EndPoints.getAllNotifications);
      final notificationsResponse = NotificationsModel.fromJson(response);
      emit(NotificationsLoadedSuccess(notificationsResponse));
    } on ServerException catch (error) {
      emit(NotificationsFailer(message: error.errModel.message!));
    }
  }
}
