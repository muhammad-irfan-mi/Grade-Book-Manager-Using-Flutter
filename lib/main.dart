import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StudentDetailsScreen(),
    );
  }
}

class StudentDetailsScreen extends StatefulWidget {
  @override
  _StudentDetailsScreenState createState() => _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController rollNoController = TextEditingController();
  TextEditingController semesterController = TextEditingController();
  TextEditingController cgpaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
        backgroundColor: Colors.blue, // Setting background color of the app bar
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Add logic here for the more options button
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MoreOptionsScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Student Name'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter student name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: rollNoController,
                decoration: InputDecoration(labelText: 'Roll No.'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter roll number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: semesterController,
                decoration: InputDecoration(labelText: 'Semester'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter semester';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: cgpaController,
                decoration: InputDecoration(labelText: 'CGPA'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter CGPA';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StudentDetailsTable(
                        name: nameController.text,
                        rollNo: rollNoController.text,
                        semester: semesterController.text,
                        cgpa: cgpaController.text,
                      )),
                    );
                  }
                },
                child: Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StudentDetailsTable extends StatelessWidget {
  final String name;
  final String rollNo;
  final String semester;
  final String cgpa;

  StudentDetailsTable({required this.name, required this.rollNo, required this.semester, required this.cgpa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
      ),
      body: DataTable(
        columns: [
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Roll No.')),
          DataColumn(label: Text('Semester')),
          DataColumn(label: Text('CGPA')),
          DataColumn(label: Text('Actions')),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text(name)),
            DataCell(Text(rollNo)),
            DataCell(Text(semester)),
            DataCell(Text(cgpa)),
            DataCell(Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pop(context); // Go back to previous screen
                    // Implement edit functionality here
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Implement delete functionality here
                  },
                ),
              ],
            )),
          ]),
        ],
      ),
    );
  }
}

class MoreOptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More Options'),
        backgroundColor: Colors.blue, // Setting background color of the app bar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to previous screen
              },
              child: Text('Back'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => StudentDetailsScreen()),
                );
              },
              child: Text('Go to Student Details'),
            ),
          ],
        ),
      ),
    );
  }
}

