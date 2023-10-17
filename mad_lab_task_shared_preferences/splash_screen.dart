import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preference/home_screen.dart';
import 'package:shared_preference/student_screen.dart';
import 'package:shared_preference/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    String userType = sp.getString('userType') ?? '';
    if(isLogin){
      if(userType == 'student'){
        Timer(Duration(seconds: 3), () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => StudentScreen()));
        });
      } else if(userType == 'teacher') {
        Timer(Duration(seconds: 3), () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        });
      } else {
        Timer(Duration(seconds: 3), () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherScreen()));
        });
      }
    } else {
      Timer(Duration(seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fitHeight,
        image: NetworkImage(
            'https://images.pexels.com/photos/1400171/pexels-photo-1400171.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
      ),
    );
  }
}
