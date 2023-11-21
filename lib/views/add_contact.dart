import 'package:flutter/material.dart';

class add_contact extends StatefulWidget {
  const add_contact({super.key});

  @override
  State<add_contact> createState() => _add_contactState();
}

class _add_contactState extends State<add_contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("contacts"),
        centerTitle: true,
      ),
      body: Stepper(
        steps: [
          Step(
            title: Text("enter name here..."),
            content: Column(
              children: [
                CircleAvatar(
                  radius: 100,
                ),
              ],
            ),
          ),
          Step(
            title: Text("enter name here..."),
            content: Column(
              children: [
                CircleAvatar(
                  radius: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
