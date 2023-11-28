import 'dart:io';

import 'package:contact_diary_app/views/add_contact_screen/model/contact_model/contact_model.dart';
import 'package:contact_diary_app/views/add_contact_screen/provider/contact_provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../utils/Global/global.dart';

class add_contact extends StatefulWidget {
  const add_contact({super.key});

  @override
  State<add_contact> createState() => _add_contactState();
}

XFile? image;
GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _add_contactState extends State<add_contact> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("contacts"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                Contact contact_data = Contact(
                  firstname: Global.firstname!,
                  lastname: Global.lastname!,
                  number: Global.number!,
                  email: Global.email!,
                );

                Provider.of<ContactProvider>(context, listen: false)
                    .add_contact(contact: contact_data);
                Navigator.of(context).pushNamed('home');
              }
              Global.firstEditingController.clear();
              Global.emailEditingController.clear();
              Global.numberEditingController.clear();
            },
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Form(
        onChanged: () {},
        key: formKey,
        child: Stepper(
          currentStep: Global.currentindex,
          onStepContinue: () {
            setState(() {
              if (Global.currentindex != 3) {
                Global.currentindex++;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (Global.currentindex != 0) {
                Global.currentindex--;
              }
            });
          },
          steps: [
            Step(
              state: (Global.currentindex == 0)
                  ? StepState.editing
                  : StepState.indexed,
              isActive: (Global.currentindex == 0) ? true : false,
              title: Text("enter name here..."),
              content: Column(
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 80,
                            foregroundImage: FileImage(
                              File(
                                "${image?.path}",
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  image = await Global.picker.pickImage(
                                    source: ImageSource.camera,
                                  );
                                  setState(() {
                                    Global.imagePath = image!.path;
                                  });
                                },
                                icon: const Icon(
                                  Icons.camera_alt,
                                  size: 35,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  image = await Global.picker.pickImage(
                                    source: ImageSource.gallery,
                                  );
                                  setState(() {
                                    Global.imagePath = image!.path;
                                  });
                                },
                                icon: const Icon(
                                  Icons.panorama,
                                  size: 35,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Step(
              state: (Global.currentindex == 1)
                  ? StepState.editing
                  : StepState.indexed,
              isActive: (Global.currentindex == 1) ? true : false,
              title: Text("enter details here..."),
              content: Column(
                children: [
                  TextFormField(
                    controller: Global.firstEditingController,
                    keyboardType: TextInputType.name,
                  ),
                ],
              ),
            ),
            Step(
              state: (Global.currentindex == 2)
                  ? StepState.editing
                  : StepState.indexed,
              isActive: (Global.currentindex == 2) ? true : false,
              title: Text("enter number here..."),
              content: Column(
                children: [
                  TextFormField(
                    controller: Global.numberEditingController,
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                  ),
                ],
              ),
            ),
            Step(
              state: (Global.currentindex == 3)
                  ? StepState.editing
                  : StepState.indexed,
              isActive: (Global.currentindex == 3) ? true : false,
              title: Text("enter email here..."),
              content: Column(
                children: [
                  TextFormField(
                    controller: Global.emailEditingController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
