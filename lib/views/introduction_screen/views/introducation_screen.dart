import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class introduction_screen extends StatelessWidget {
  const introduction_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            image: Image.network(
              "https://ineedmarketer.com/wp-content/uploads/2022/12/promo-2.png",
              fit: BoxFit.cover,
            ),
            title: "contact diary app",
            body:
                "Contact Diary is a simple app that allows you to keep a record of the people you have met and the events you have attended to recently.",
          ),
          PageViewModel(
            image: Image.network(
              "https://fanatic.co.uk/wp-content/uploads/2022/02/88281-webdesign-marketing-people-development.gif",
              fit: BoxFit.cover,
            ),
            title: "contact diary app",
            body:
                "Contact Diary is a simple app that allows you to keep a record of the people you have met and the events you have attended to recently.",
          ),
          PageViewModel(
            image: Image.network(
              "https://fanatic.co.uk/wp-content/uploads/2022/02/92812-business-presentation.gif",
              fit: BoxFit.cover,
            ),
            title: "contact diary app",
            body:
                "Contact Diary is a simple app that allows you to keep a record of the people you have met and the events you have attended to recently.",
          ),
          PageViewModel(
            image: Image.network(
              "https://i.pinimg.com/originals/32/b6/f2/32b6f2aeeb2d21c5a29382721cdc67f7.gif",
              fit: BoxFit.cover,
            ),
            title: "contact diary app",
            body:
                "Contact Diary is a simple app that allows you to keep a record of the people you have met and the events you have attended to recently.",
          ),
        ],
        showNextButton: true,
        showDoneButton: true,
        next: Text("next"),
        done: Text("done"),
        onDone: () async {
          Navigator.of(context).pushReplacementNamed('home');
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setBool("isvisited", true);
        },
      ),
    );
  }
}
