import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:kos_project/view/login_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/bg_login.jpeg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 100, right: 100, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: SizedBox()),
                GlassContainer(
                  width: 300,
                  height: 50,
                  borderRadius: BorderRadius.circular(10),
                  borderColor: Color(0xFFFFFFFF),
                  borderWidth: 1,
                  color: Color(0xFFFFFFFF),
                  child: MaterialButton(
                      onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xFF8C5605),
                        fontFamily:'Raleway',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}