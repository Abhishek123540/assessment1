import 'package:flutter/material.dart';

import 'screen2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  late String uid, pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              child: TextFormField(
                onFieldSubmitted: (value) {
                  uid = value;
                },
                onChanged: (value) {
                  uid = value;
                },
              ),
            ),
            Form(
              child: TextFormField(
                obscureText: true,
                onFieldSubmitted: (value) {
                  pass = value;
                },
                onChanged: (value) {
                  pass = value;
                },
              ),
            ),
            TextButton(
              onPressed: () {
                if (pass.isNotEmpty && uid.isNotEmpty) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return Screen2(
                          uid: uid,
                        );
                      },
                    ),
                  );
                }
              },
              child: const Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
