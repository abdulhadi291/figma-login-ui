import 'package:figma_login/login.dart';
import 'package:figma_login/reels/reels_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isPasswordvisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final String validEmail = 'example123@gmail.com';
  final String validPassword = '12345678';

  Signup()  async {
    // final String email = emailController.text;
    // final String password = passwordController.text;

try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailController.text,
    password: passwordController.text,
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}

    // if (email == validEmail && password == validPassword) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => ReelsView()),
    //   );
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('Invalid email or password'),
    //       duration: Duration(seconds: 2),
    //     ),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRect(
          child: Align(
            alignment: Alignment.topCenter,
            child: Image.asset('assets/image1.png'),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text('Signup',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: passwordController,
            obscureText: !isPasswordvisible,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  isPasswordvisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    isPasswordvisible = !isPasswordvisible;
                  });
                },
              ),
              labelStyle: TextStyle(color: Colors.grey),
              labelText: 'Signup',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 247, 121, 134),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Signup();
              },
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 20,),
             ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 247, 121, 134),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
    MaterialPageRoute(builder: (context) =>  Login()),
  );

              },
              child: Text(
                'Already have an accont Signup',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}