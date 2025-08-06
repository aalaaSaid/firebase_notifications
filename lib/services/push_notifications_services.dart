import 'dart:developer';

import 'package:fcm_app/services/local_notifications_services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsServices {
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  static Future initNotifications() async {
    //get permission
    await firebaseMessaging.requestPermission();

    //get token
    String? token = await firebaseMessaging.getToken();
    log('token: $token');

    //background and terminated message
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    //foreground message
    FirebaseMessaging.onMessage.listen(handleForegroundMessage);
  }

  static Future<void> handleBackgroundMessage(RemoteMessage message) async {
    LocalNotificationsServices.showNotification(
      message.notification?.title ?? 'No Title',
      message.notification?.body ?? 'No Body',
    );
  }

  static Future<void> handleForegroundMessage(RemoteMessage message) async {
    LocalNotificationsServices.showNotification(
        message.notification?.title ?? 'No Title',
        message.notification?.body ?? 'No Body');
  }
}
