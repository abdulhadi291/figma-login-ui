import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset('assets/image1.png'),
            ),
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 20,),
              
          Text("Welcome", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
            ],
          ),
        ],
      ),
    );
  }
}
