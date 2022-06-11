import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/screen/movie_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (contex) => MovieScreen()));
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg_splash.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Image.asset(
                "assets/images/ic_movie.png",
              ),
              SizedBox(height: 8),
              Text("Now Playing",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333))),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text("Workshop Flutter : GDSC UPNVJT",
                  style: TextStyle(
                      color: Color(0xFF333333), fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
