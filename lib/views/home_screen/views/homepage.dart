import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../add_contact_screen/provider/contact_provider/contact_provider.dart';
import '../provider/theme_provider.dart';

class homepage extends StatelessWidget {
  homepage({super.key});

  LocalAuthentication authentication = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              onSelected: (val) async {
                if (val == 'theme') {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .changeTheme();
                } else if (val == 'hidden') {
                  bool isDeviceSuported =
                      await authentication.isDeviceSupported();
                  bool canCheckBiometrics =
                      await authentication.canCheckBiometrics;

                  try {
                    if (isDeviceSuported == true &&
                        canCheckBiometrics == true) {
                      bool isAuthenticate = await authentication.authenticate(
                          localizedReason:
                              "You Need to Verify your self to see Hidden Contacts..");
                    } else {
                      log("Device is Not Supported.....");
                    }
                  } on PlatformException catch (e) {
                    log("${e.code}");
                    log("${e.message}");
                  }
                }
              },
              itemBuilder: (ctx) => [
                    PopupMenuItem(
                      child: Text("Theme"),
                      value: "theme",
                    ),
                    PopupMenuItem(
                      child: Text("Hidden Contact"),
                      value: "hidden",
                    ),
                  ])
        ],
        title: const Text("Contact Diary"),
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        centerTitle: true,
      ),
      body: (Provider.of<ContactProvider>(context, listen: false)
              .allcontact
              .isNotEmpty)
          ? ListView.builder(
              itemCount: Provider.of<ContactProvider>(context, listen: false)
                  .allcontact
                  .length,
              itemBuilder: (ctx, i) => Card(
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, 'detail',
                        arguments:
                            Provider.of<ContactProvider>(context, listen: false)
                                .allcontact[i]);
                  },
                  leading: const CircleAvatar(),
                  title: Text(
                      Provider.of<ContactProvider>(context, listen: false)
                          .allcontact[i]
                          .firstname),
                  subtitle: Text(
                      Provider.of<ContactProvider>(context, listen: false)
                          .allcontact[i]
                          .number),
                  trailing: IconButton(
                    onPressed: () {
                      launch(
                          "tel:+91${Provider.of<ContactProvider>(context, listen: false).allcontact[i].number}");
                    },
                    icon: const Icon(Icons.call),
                  ),
                ),
              ),
            )
          : Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 440,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage(
                        "lib/Modules/Utils/Assets/no_contact.gif",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            )),
    );
  }
}
//         actions: [
//           IconButton(
//               onPressed: () {
//                 Provider.of<ThemeProvider>(context, listen: false)
//                     .changeTheme();
//               },
//               icon: const Icon(Icons.wb_sunny_outlined)),
//           // PopupMenuButton(
//           //     itemBuilder: (context) => [
//           //           PopupMenuItem(
//           //             onTap: () async {
//           //               bool canCheckBioMetrics = await auth.canCheckBiometrics;
//           //               bool isSuppotred = await auth.isDeviceSupported();
//           //
//           //               try {
//           //                 if (canCheckBioMetrics == true ||
//           //                     isSuppotred == true) {
//           //                   bool authenticate = await auth.authenticate(
//           //                       localizedReason:
//           //                           "For See Hidden Contacts You Need to Authenticate");
//           //
//           //                   if (authenticate == true) {
//           //                     Navigator.of(context).pushNamed('hidden_page');
//           //                   } else {
//           //                     print("==================================");
//           //                     print("Authentication Failed");
//           //                     print("==================================");
//           //                   }
//           //                 } else {
//           //                   print("==================================");
//           //                   print("Device is not Supported");
//           //                   print("==================================");
//           //                 }
//           //               } on PlatformException catch (e) {
//           //                 print("==================================");
//           //                 print(e.code);
//           //                 print("==================================");
//           //               }
//           //             },
//           //             child: Text("Hidden Contacts"),
//           //           ),
//           //           PopupMenuItem(child: Text("Settings")),
//           //         ]),
//         ],
//         title: Text("homepage"),
//         centerTitle: true,
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context).pushNamed('add');
//         },
//         child: Icon(Icons.add),
//       ),
//       body: Center(
//         child: Container(
//           height: h * 0.45,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               fit: BoxFit.cover,
//               image: NetworkImage(
//                 'https://stories.freepiklabs.com/api/vectors/no-data/rafiki/render?color=&background=complete&hide=',
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
