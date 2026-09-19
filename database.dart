import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabasePage extends StatefulWidget {
  @override
  State<DatabasePage> createState() => _DatabasePageState();
}

class _DatabasePageState extends State<DatabasePage> {
  TextEditingController name = TextEditingController();
  TextEditingController course = TextEditingController();

  void saveData() async {
    await FirebaseFirestore.instance.collection('students').add({
      'name': name.text,
      'course': course.text,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Data saved')),
    );

    name.clear();
    course.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Database'),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: name,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),

            TextField(
              controller: course,
              decoration: InputDecoration(
                labelText: 'Course',
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: saveData,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}