import 'package:flutter/material.dart';
import 'package:test/pages/homescreen.dart';
import 'package:test/pages/login.dart';
import 'package:test/pages/schedule_screen.dart';
import 'package:test/pages/video_call_screen.dart';
import 'package:test/resources/auth_methods.dart';
import 'package:test/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connect : A video calling app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),

      routes: {
        '/login' :(context) => const Loginscreen(),
        '/home' :(context) => const HomePage(),
        '/video-call-screen' : (context) => const VideoCallScreen(),
        '/scheduleScreen' :(context) => const ScheduleScreen(),
      },

      home: StreamBuilder(
        stream: AuthMethods().authchanges,
        builder:(context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: 
            CircularProgressIndicator(),
            );
          }
          else if(snapshot.hasData){
            return const HomePage();
          }
          else{
            return const Loginscreen();
          }
        },
      )
    );
  }
}




