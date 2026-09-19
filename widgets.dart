import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool hobby1 = false;
  bool hobby2 = false;
  bool tv = false;
  bool notification = false;

  String course = 'IT';
  String gender = 'Male';
  String classType = 'Online';

  double hours = 2;

  List<String> subjects = [
    'Python',
    'Flutter',
    'Java',
    'Database',
    'Web',
    'AI',
  ];

  List<String> images = [
    'https://picsum.photos/200?1',
    'https://picsum.photos/200?2',
    'https://picsum.photos/200?3',
    'https://picsum.photos/200?4',
    'https://picsum.photos/200?5',
    'https://picsum.photos/200?6',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Widgets'),
      ),

      body: ListView(
        padding: EdgeInsets.all(20),

        children: [

          // ---------------- CHECKBOX ----------------

          Text(
            'Checkbox',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          Checkbox(
            value: hobby1,
            onChanged: (value) {
              setState(() {
                hobby1 = value!;
              });
            },
          ),

          Checkbox(
            value: hobby2,
            onChanged: (value) {
              setState(() {
                hobby2 = value!;
              });
            },
          ),

          Divider(),

          // ---------------- CHECKBOXLISTTILE ----------------

          CheckboxListTile(
            title: Text('I like watching TV'),
            value: tv,
            onChanged: (value) {
              setState(() {
                tv = value!;
              });
            },
          ),

          Divider(),

          // ---------------- DROPDOWN ----------------

          Text(
            'Course',
            style: TextStyle(fontSize: 20),
          ),

          DropdownButton<String>(
            value: course,
            isExpanded: true,

            items: [
              DropdownMenuItem(
                value: 'IT',
                child: Text('IT'),
              ),
              DropdownMenuItem(
                value: 'SD',
                child: Text('SD'),
              ),
              DropdownMenuItem(
                value: 'CS',
                child: Text('Computer Science'),
              ),
            ],

            onChanged: (value) {
              setState(() {
                course = value!;
              });
            },
          ),

          Divider(),

          // ---------------- RADIO ----------------

          Text(
            'Gender',
            style: TextStyle(fontSize: 20),
          ),

          Row(
            children: [

              Radio<String>(
                value: 'Male',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),

              Text('Male'),

              Radio<String>(
                value: 'Female',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),

              Text('Female'),
            ],
          ),

          // ---------------- RADIOLISTTILE ----------------

          RadioListTile<String>(
            title: Text('Online'),
            value: 'Online',
            groupValue: classType,
            onChanged: (value) {
              setState(() {
                classType = value!;
              });
            },
          ),

          RadioListTile<String>(
            title: Text('Offline'),
            value: 'Offline',
            groupValue: classType,
            onChanged: (value) {
              setState(() {
                classType = value!;
              });
            },
          ),

          Divider(),

          // ---------------- SLIDER ----------------

          Text(
            'Study Hours',
            style: TextStyle(fontSize: 20),
          ),

          Slider(
            min: 0,
            max: 5,
            divisions: 5,
            value: hours,
            label: hours.toString(),

            onChanged: (value) {
              setState(() {
                hours = value;
              });
            },
          ),

          Text('Study Hours: ${hours.toInt()}'),

          // ---------------- SWITCH ----------------

          SwitchListTile(
            title: Text('Enable Notifications'),
            value: notification,

            onChanged: (value) {
              setState(() {
                notification = value;
              });
            },
          ),

          Divider(),

          // ---------------- BUTTON + SNACKBAR ----------------

          ElevatedButton(
            onPressed: () {

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Information Added'),
                ),
              );

            },

            child: Text('Add'),
          ),

          SizedBox(height: 10),

          // ---------------- ALERTDIALOG ----------------

          ElevatedButton(
            onPressed: () {

              showDialog(
                context: context,

                builder: (context) {

                  return AlertDialog(
                    title: Text('Details'),

                    content: Text(
                      'Course: $course\n'
                      'Gender: $gender\n'
                      'Class: $classType\n'
                      'Study Hours: ${hours.toInt()}',
                    ),

                    actions: [

                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        child: Text('OK'),
                      ),

                    ],
                  );

                },
              );

            },

            child: Text('Show Details'),
          ),

          Divider(height: 40),

          // ---------------- LISTVIEW ----------------

          Text(
            'ListView',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(
            height: 200,

            child: ListView(
              children: [

                ListTile(
                  leading: Icon(Icons.book),
                  title: Text('Python'),
                ),

                ListTile(
                  leading: Icon(Icons.phone_android),
                  title: Text('Flutter'),
                ),

                ListTile(
                  leading: Icon(Icons.code),
                  title: Text('Java'),
                ),

                ListTile(
                  leading: Icon(Icons.storage),
                  title: Text('Database'),
                ),

              ],
            ),
          ),

          Divider(),

          // ---------------- LISTVIEW BUILDER ----------------

          Text(
            'ListView.builder',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(
            height: 200,

            child: ListView.builder(
              itemCount: subjects.length,

              itemBuilder: (context, index) {

                return ListTile(
                  leading: Icon(Icons.book),
                  title: Text(subjects[index]),
                );

              },
            ),
          ),

          Divider(height: 40),

          // ---------------- GRIDVIEW ----------------

          Text(
            'GridView',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),

            children: subjects.map((subject) {

              return Card(
                child: Center(
                  child: Text(
                    subject,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              );

            }).toList(),
          ),

          Divider(height: 40),

          // ---------------- GRIDVIEW IMAGES ----------------

          Text(
            'GridView Images',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),

            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),

            itemCount: images.length,

            itemBuilder: (context, index) {

              return Image.network(
                images[index],
                fit: BoxFit.cover,
              );

            },
          ),

          Divider(height: 40),

          // ---------------- GRIDVIEW IMAGE + TEXT ----------------

          Text(
            'GridView Images + Text',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),

            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),

            itemCount: subjects.length,

            itemBuilder: (context, index) {

              return Card(
                child: Column(
                  children: [

                    Expanded(
                      child: Image.network(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    ),

                    Text(subjects[index]),

                  ],
                ),
              );

            },
          ),

          Divider(height: 40),

          // ---------------- TABLE ----------------

          Text(
            'Table',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          Table(
            border: TableBorder.all(),

            children: [

              TableRow(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('Name'),
                  ),

                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('Course'),
                  ),

                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('Marks'),
                  ),
                ],
              ),

              TableRow(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('Daniya'),
                  ),

                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('IT'),
                  ),

                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('90'),
                  ),
                ],
              ),

              TableRow(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('Aisha'),
                  ),

                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('CS'),
                  ),

                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('85'),
                  ),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}