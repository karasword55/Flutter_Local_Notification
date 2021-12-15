

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';

class NotificationApi{

  //  FlutterLocalNotificationsPlugin() sınıfı bize bir instance dönüyor.
  //  bu instance ile .show methodunu kullanacağız.
  //  .show methodu bizden id,title,body,payload ve NotificationDetails() nesnesi istiyor.
  //  NotificationDetails sınıfı bir tane platform istiyor.(android,iOS,linux gibi)
 
  //  buradaki plugin instance'ı bize bazı methodlarda gerekli olacak.
  static final _notifications= FlutterLocalNotificationsPlugin();
  static final onNotifications=BehaviorSubject<String?>();
  // (Behavior) Widget içinde çağırılabilmesi için listener oluşturduk.

// Sınıf çağırıldığında gerekli hazırlıkları init() yapacak.
  static Future init({bool initScheduled=false})async{
    final android=AndroidInitializationSettings("@mipmap/ic_launcher");
    final iOS=IOSInitializationSettings();
    final settings=InitializationSettings(
      android: android,iOS: iOS
    );
  
  
    await _notifications.initialize(
        settings,
        onSelectNotification: (payload) async=> {
          onNotifications.add(payload)
        },
    );

  }


  static  Future _notificationDetails() async{

    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name'
        'channel description',
        // buradaki importance bize hangi seviyede bildirimi vereceğini söyler.
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),

    );

  }

  

  static Future showNotifications({int id=0,String? title, String? body,String? payload})async=>
  _notifications.show(id, title, body, await _notificationDetails(),payload: payload);

}

//rxdart :
//Notification geldiginde bir listener kullanarak widget içerisinde dinleme yapabilmek için ekliyoruz.

//flutter_local_notifications : 
//Cihaz içerisinde local notification kullanabilmek için ekledik.