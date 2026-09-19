import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  final formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Form Validation'),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Form(
          key: formKey,

          child: Column(
            children: [

              TextFormField(
                controller: name,

                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your name';
                  }

                  return null;
                },
              ),

              SizedBox(height: 15),

              TextFormField(
                controller: email,

                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your email';
                  }

                  if (!value.contains('@')) {
                    return 'Enter a valid email';
                  }

                  return null;
                },
              ),

              SizedBox(height: 15),

              TextFormField(
                controller: password,
                obscureText: true,

                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter password';
                  }

                  if (value.length < 6) {
                    return 'Password must have 6 characters';
                  }

                  return null;
                },
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {

                  if (formKey.currentState!.validate()) {

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Form is valid'),
                      ),
                    );

                  }

                },

                child: Text('Submit'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}