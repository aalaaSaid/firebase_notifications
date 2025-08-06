import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationsServices {
  //instance of FlutterLocalNotificationsPlugin
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  //instance of StreamController of NotificationsResponse
  static StreamController<NotificationResponse> streamController =
      StreamController();
  //method to handle tap for notification
  static onTap(NotificationResponse notificationResponse) {
    streamController.add(notificationResponse);
    }

  //method to initialize
  static Future<void> initNotifications() async {
    InitializationSettings setting = const InitializationSettings(
        //give icon from android manifest
        android: AndroidInitializationSettings('@mipmap/ic_launcher'));
    flutterLocalNotificationsPlugin.initialize(setting,
        onDidReceiveNotificationResponse: onTap,
        onDidReceiveBackgroundNotificationResponse: onTap);
  }

  static Future<void> showNotification(String title, String body) async {
    NotificationDetails notificationDetails = const NotificationDetails(
      android: AndroidNotificationDetails('channelId', 'channelName',
          //attribute make the notification appear on top
          importance: Importance.max,
          priority: Priority.high),
    );
    await flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: 'Payload Data');
  }
}
