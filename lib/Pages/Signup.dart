import 'dart:html';

import 'package:dummy_app/Pages/Home.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        shadowColor: const Color.fromARGB(0, 0, 0, 0),
        centerTitle: true,
        title: const Text("Register"),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Container(
              height: 200,
              child: const MyHomePage(),
            ),
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
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var emails = ['@gmail.com', "@hotmail.com", "@yahoo.com", "@outlook.com"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2, // length of tabs
        initialIndex: 0,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    child: Text("PHONE"),
                  ),
                  Tab(
                    child: Text("EMAIL"),
                  ),
                ],
              ),
              Expanded(
                  child: TabBarView(children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: const [
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone Number',
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "You may receive SMS notifications from us for security and login purposes.",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email Adress',
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(width: 10),
                          itemBuilder: (BuildContext context, int index) {
                            return Center(
                              child: EmailButton(emails[index]),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ]))
            ]));
  }
}

// ignore: must_be_immutable
class EmailButton extends StatelessWidget {
  String name = "";

  EmailButton(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(padding: EdgeInsets.all(2)),
      child: Text(
        name,
        style: TextStyle(),
      ),
    );
  }
}
