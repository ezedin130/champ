import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Noti {
  final notificationPlugin = FlutterLocalNotificationsPlugin();
  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;
  Future <void> initNotification()async{
    if(_isInitialized)return;
    const initSettngAndroid = AndroidInitializationSettings('mimap/ic_launcher');
    const initSettingIos= DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true
    );
    const initSettings = InitializationSettings(
      android: initSettngAndroid,
      iOS: initSettingIos,
    );
    await notificationPlugin.initialize(initSettings);
  }
  NotificationDetails notificationDetails(){
    return const NotificationDetails(android: AndroidNotificationDetails(
      'channelId', 
      'channelName',
      channelDescription: 'Daily notification channel',
      importance: Importance.max,
      priority: Priority.high),
      iOS: DarwinNotificationDetails(),
      );
  }
  Future <void> showNotification({
    int id=0,
    String? title,
    String ? body,
  })async{
    return notificationPlugin.show(
      id, 
      title, 
      body, 
      const NotificationDetails());
  }
}