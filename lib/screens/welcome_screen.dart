import 'package:flutter/material.dart';
import 'package:onboarding_flutter_app/login_screen/screens/login_screen.dart';
import 'package:onboarding_flutter_app/login_screen/screens/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 25),
            Opacity(
              opacity: 0.2,
              child: Image.asset(
                "assets/images/child-login-baner-img.png",
                height: 300,
                width: 500,
                fit: BoxFit.cover,
              ),
            ),
            Image.asset(
              "assets/images/logo.png",
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            //login button
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 5,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      color: const Color(0xff1760AB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //register button
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 5,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Color.fromARGB(255, 15, 66, 117),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Color(0xFF1E232C),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: const Text(
                "Continue as a guest",
                style: TextStyle(
                  color: Color(0xff2175D4),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
