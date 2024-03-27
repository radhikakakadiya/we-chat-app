import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppToFirebase extends StatefulWidget {
  const AppToFirebase({super.key});

  @override
  State<AppToFirebase> createState() => _AppToFirebaseState();
}

class _AppToFirebaseState extends State<AppToFirebase> {

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App to Firebase'),
      ),
      body: Column(children: [
        const SizedBox(
          height: 30,
        ),
        TextFormField(
          controller: nameController,
          decoration: InputDecoration(hintText: 'Enter the name'),
        ),
        const SizedBox(
          height: 30,

        ),
        TextFormField(
          controller: surnameController,
          decoration: InputDecoration(hintText: 'Enter the name'),
        ),

        const SizedBox(
          height: 30,
        ),
        CupertinoButton(child: Text('SAVE'), color: Colors.deepPurple, onPressed: () {
         Map<String, String> dataToSave = {
"name": nameController.text,
           "surname": surnameController.text
         };
         FirebaseFirestore.instance.collection("AppToFirebase").add(dataToSave);
        }),
      ],),
    );
  }
}
