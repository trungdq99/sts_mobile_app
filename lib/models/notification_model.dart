/*
 * Author: Trung Shin
 */

import 'package:equatable/equatable.dart';

class NotificationModel extends Equatable {
  final int notificationId;
  final String notificationTitle;
  final String notificationBody;
  final String notificationType;

  NotificationModel({
    this.notificationId: 0,
    this.notificationTitle: '',
    this.notificationBody: '',
    this.notificationType: '',
  });

  Map<String, dynamic> toJson() => {
        'notificationId': this.notificationId,
        'notificationTitle': notificationTitle,
        'notificationBody': notificationBody,
        'notificationType': notificationType,
      };

  @override
  List<Object> get props => [
        notificationId,
        notificationTitle,
        notificationBody,
        notificationType,
      ];
}
