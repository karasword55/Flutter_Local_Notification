import 'package:flutter/material.dart';
import 'package:local_notification/notifications/NotificationApi.dart';
import 'package:local_notification/secondpage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    NotificationApi.init();
    listenNotifications();
  }
  void listenNotifications(){
    NotificationApi.onNotifications.stream.listen(onClickedNotification);
  }
  void onClickedNotification(String? payload){
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context)=>SecondPage(payload:payload),
        ));
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('notification1'),
              onPressed: (){

                NotificationApi.showNotifications(
                  title: 'Sarah!',
                  body: "Mert! Köye saldırı var. :)",
                  payload: 'sarah.abs',
                );

              },
            ),
            ElevatedButton(
              child: Text('notification2'),
              onPressed: (){

              },
            ),
            
          ],
        ),
      ),
       
    );
  }
}
