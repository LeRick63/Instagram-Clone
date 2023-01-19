import 'package:dummy_app/Pages/Signup.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double padding = 25;
    const double spacing = 20;

    return Scaffold(
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 235, 235, 235)),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(padding),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 245, 245, 245)),
                child: Column(
                  children: [
                    const Center(
                        child: Text(
                      "Instagram",
                      style: TextStyle(fontSize: 60.0),
                    )),
                    const SizedBox(height: spacing),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone number, username or email',
                      ),
                    ),
                    const SizedBox(height: spacing),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(height: spacing),
                    ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        child: const Text(
                          "Log In",
                          style: TextStyle(),
                        ),
                      ),
                    ),
                    const SizedBox(height: spacing),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        BlackLine(),
                        Text("Or"),
                        BlackLine(),
                      ],
                    ),
                    const SizedBox(height: spacing),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.facebook_sharp),
                        ),
                        Text(
                          "Log in with Facebook",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Color.fromARGB(255, 4, 30, 52),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: spacing),
                    const Center(
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 4, 30, 52),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: spacing),
              Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 245, 245, 245)),
                padding: EdgeInsets.all(padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupPage()),
                          );
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Color.fromARGB(255, 10, 50, 86),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: spacing),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Get the App",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(height: spacing),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DownloadApp(
                          Icons.apple,
                          "App Store",
                          "Download on the",
                        ),
                        const SizedBox(width: 5),
                        DownloadApp(
                          Icons.store,
                          "Google Play",
                          "GET IT ON",
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BlackLine extends StatelessWidget {
  const BlackLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 1.0,
        constraints: const BoxConstraints(
          maxWidth: 80,
        ),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class DownloadApp extends StatelessWidget {
  IconData icon;
  String title;
  String subTitle;

  DownloadApp(this.icon, this.title, this.subTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Icon(
              icon,
              color: Colors.white,
              size: 40,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subTitle,
                style: const TextStyle(
                  fontSize: 10.0,
                  color: Colors.white,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
