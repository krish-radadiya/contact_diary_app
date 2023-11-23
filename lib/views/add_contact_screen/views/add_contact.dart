import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Saved Successfully..."),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Plese Enter Full Detail..."),
                  ),
                );
              }
            },
            icon: Icon(
              Icons.check,
            ),
          ),
        ],
      ),
      body: Stepper(
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
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
