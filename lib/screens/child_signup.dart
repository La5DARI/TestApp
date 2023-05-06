import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Childd extends StatefulWidget {
  const Childd({Key? key}) : super(key: key);

  @override
  State<Childd> createState() => _ChildState();
}

class _ChildState extends State<Childd> {
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(15),
        child: Column(
          // child: SingleChildScrollView(
          children: [
            Image.asset(
              'images/Child.png',
              height: 70,
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: _nomController,
              obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'الإسم',
              ),
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: _prenomController,
              obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'القب',
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                CollectionReference collRef =
                    FirebaseFirestore.instance.collection('child');
                collRef.add({
                  'nom': _nomController.text,
                  'prenom': _prenomController.text,
                });
              },
              child: Text('Add'),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
