import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("", width: 256,height: 256,fit: BoxFit.fitWidth,)),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
