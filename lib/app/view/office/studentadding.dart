import 'package:flutter/material.dart';

class NewStudentForm extends StatefulWidget {
  @override
  _NewStudentFormState createState() => _NewStudentFormState();
}

class _NewStudentFormState extends State<NewStudentForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _gradeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Student'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return 'Please enter the student\'s name';
                //   }
                //   return null;
                // },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return 'Please enter the student\'s email';
                //   }
                //   return null;
                // },
              ),
              TextFormField(
                controller: _gradeController,
                decoration: InputDecoration(labelText: 'Grade'),
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return 'Please enter the student\'s grade';
                //   }
                //   return null;
                // },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // if (_formKey.currentState.validate()) {
                  //   // Add logic to save the new student
                  //   // For example, call a function to save to Firestore
                  //   // saveStudent(_nameController.text, _emailController.text, _gradeController.text);
                  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //     content: Text('Student added successfully!'),
                  //   ));
                  // }
                },
                child: Text('Add Student'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
