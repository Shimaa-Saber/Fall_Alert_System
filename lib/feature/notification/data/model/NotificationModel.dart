class NotificationsModel {
  final List<Notification> notifications;

  NotificationsModel({
    required this.notifications,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    var notificationsList = json['notifications'] as List<dynamic>? ?? [];
    List<Notification> notifications = notificationsList.map((i) => Notification.fromJson(i)).toList();

    return NotificationsModel(
      notifications: notifications,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'notifications': notifications.map((notification) => notification.toJson()).toList(),
    };
  }
}

class Notification {
  final Data data;
  final String createdAt;
  final String updatedAt;

  Notification({
    required this.data,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      data: Data.fromJson(json['data']),
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
      'updated_at': updatedAt,
      'created_at': createdAt,
    };
  }
}

class Data {
  final int id;
  final String title;
  final String content;
  final String type;
  final int userId;
  final String createdAt;
  final String updatedAt;

  Data({
    required this.id,
    required this.title,
    required this.updatedAt,
    required this.content,
    required this.createdAt,
    required this.type,
    required this.userId,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      title: json['title'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      userId: json['user_id'],
      type: json['type'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'user_id': userId,
      'type': type,
      'content': content,
    };
  }
}
