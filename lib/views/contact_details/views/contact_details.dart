import 'package:flutter/material.dart';
import '../../Add_Contact_Screen/Model/Contact_Model/contact_model.dart';

class Contact_Detail extends StatelessWidget {
  Contact_Detail({super.key});

  TextStyle myStyle = const TextStyle(fontSize: 22);
  Color iconColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    Contact data = ModalRoute.of(context)?.settings.arguments as Contact;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Detail"),
        centerTitle: true,
      ),
    );
  }
}
