import 'package:fcm_app/services/local_notifications_services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class PushNotificationOneSignal {
 static Future <void> initOneSignal()async {
   OneSignal.initialize("b8400503-4c1b-454a-b704-18e6733d8eea");
   OneSignal.Notifications.requestPermission(false);
   //foreground message
   OneSignal.Notifications.addForegroundWillDisplayListener((event) {
    final notification = event.notification;
    LocalNotificationsServices.showNotification(
      notification.title ?? 'No Title', notification.body ?? 'No Body', );
   });
  OneSignal.Notifications.addClickListener((event){
    final notification = event.notification;
    LocalNotificationsServices.showNotification(
      notification.title ?? 'No Title', notification.body ?? 'No Body', );
  });
 }

}
