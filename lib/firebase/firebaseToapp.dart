import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseToApp extends StatefulWidget {
  const FirebaseToApp({super.key});

  @override
  State<FirebaseToApp> createState() => _FirebaseToAppState();
}

class _FirebaseToAppState extends State<FirebaseToApp> {

  ///------------------- app to firebase--------------

  TextEditingController nameController = TextEditingController();

  void addDataToFirebase(String data){
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("AppToFirebase").add({"Name": data}).then((value) => print('==========data add'));
  }

  ///-----------------------firebase to app----------------------
  getData() {
    final allData = FirebaseFirestore.instance.collection("firebaseToapp").snapshots();
    return allData;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase to App'),
      ),
      body: Column(
        children: [
         ///---------------------------App To Firebase------------

          TextFormField(
            controller: nameController,
            decoration: InputDecoration(hintText: 'Enter the name'),
          ),
         const SizedBox(
            height: 30,
          ),
          CupertinoButton(child: Text('SAVE'), color: Colors.deepPurple, onPressed: () {
            String enterData = nameController.text.trim();
            if(enterData.isNotEmpty){
              addDataToFirebase(enterData);
            }
          }),



          ///--------------firebase to app---------
          StreamBuilder(
            stream: getData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return Expanded(
                    flex: 5,
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            child: Text("${index + 1}"),
                          ),
                          title: Text("${snapshot.data!.docs[index]["title"]}"),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.hasError.toString()),
                  );
                }
              } else {
                return Center(
                  child: Text('No Found'),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}

/*

rules_version = '2';

service cloud.firestore {
match /databases/{database}/documents {
match /{document=**} {
allow read, write: if false;
}
}
}*/

/// me git install kru tu to bija project nota chalta to uninstall kri nakhu tu
/// kru install?????? hve
/// ha ena vagar nai thai
/// ekmin
///
/// manully push karu chu kmk android studio thi diretc koi var error ave
/// okkkkkk
/// folder ma project kya ch
///
/// dir chnage aj nai thti
/// git ma kyi i
/// ssue na


/*
rules_version = '2';
service cloud.firestore {
match /databases/{database}/documents {
match /{document=**} {
allow read;
}
}
}*/
