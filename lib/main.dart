import 'package:fcm_app/done_screen.dart';
import 'package:fcm_app/firebase_options.dart';
import 'package:fcm_app/services/local_notifications_services.dart';
import 'package:fcm_app/services/onesignal_notifications.dart';
import 'package:fcm_app/services/push_notifications_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await PushNotificationsServices.initNotifications();
  await LocalNotificationsServices.initNotifications();
  await PushNotificationOneSignal.initOneSignal();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:DoneScreen(),
    );
  }
}
