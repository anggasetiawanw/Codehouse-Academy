import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_minggu4/layout/main_page/home_page.dart';
import 'dart:async';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences sharedPreferences;

  startSplashScreen()async{
      sharedPreferences = await SharedPreferences.getInstance();
      var duration = const Duration(seconds: 2);
      return Timer(duration, () {
         if(sharedPreferences.getString("username")!=null){
           Navigator.pushReplacementNamed(context, '/main-page');
         }else{
            Navigator.pushReplacementNamed(context, '/sign-in');
         }
        ///cek session
      });
  }

  @override
  void initState() {
    startSplashScreen();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text("Welcome to AnggaApps",style: TextStyle(
              fontSize: 20,
              color: Colors.black,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
