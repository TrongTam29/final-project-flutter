import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/screens/admin/admin.dart';
import 'package:my_app/screens/alarm/alarm_view.dart';
import 'package:my_app/screens/detail%20cardio/detail_cardio.dart';
import 'package:my_app/screens/eqiupment/equipment_screen.dart';
import 'package:my_app/screens/gym%20guide/gym_guide.dart';
import 'package:my_app/screens/gym%20schedule/gym_schedule.dart';
import 'package:my_app/screens/hello%20screen/hello_Screen.dart';
import 'package:my_app/screens/home%20screen/home_main.dart';
import 'package:my_app/screens/home%20screen/components/home_screen.dart';
import 'package:my_app/screens/home%20workout/home_workout.dart';
import 'package:my_app/screens/list%20cardio/list_cardio.dart';
import 'package:my_app/screens/list%20video/list_video.dart';
import 'package:my_app/screens/my%20workouts/my_workout.dart';
import 'package:my_app/screens/nitrition%20screen/nutrition_screen.dart';
import 'package:my_app/screens/nutriton%20detail/nutrition_detail.dart';
import 'package:my_app/screens/nutriton%20detail/nutrition_getX.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var initializationSettingsAndroid = AndroidInitializationSettings('logo');
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (
        int? id,
        String? title,
        String? body,
        String? payload,
      ) async {});
  var initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
  });

  await Firebase.initializeApp();
  NutritionBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fit Body',
        theme: ThemeData(
            scaffoldBackgroundColor: kBackgroundColor,
            primaryColor: kPrimaryColor,
            textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: AlarmPage());
  }
}
