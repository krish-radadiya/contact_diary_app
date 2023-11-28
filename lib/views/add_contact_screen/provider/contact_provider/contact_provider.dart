import 'package:flutter/cupertino.dart';

import '../../model/contact_model/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> allcontact = [];

  void add_contact({required Contact contact}) {
    allcontact.add(contact);
    notifyListeners();
  }

  void remove_contact({required Contact contact}) {
    allcontact.remove(contact);
    notifyListeners();
  }
}
