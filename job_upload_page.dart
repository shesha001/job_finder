import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class JobUploadPage extends StatefulWidget {
  @override
  _JobUploadPageState createState() => _JobUploadPageState();
}

class _JobUploadPageState extends State<JobUploadPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  final _formKey = GlobalKey<FormState>();

  String companyName = '';
  String address = '';
  String salary = '';
  String contact = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Job')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    final pickedFile =
                        await _picker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      setState(() {
                        _imageFile = pickedFile;
                      });
                    }
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: _imageFile == null
                        ? Icon(Icons.camera_alt)
                        : Image.file(File(_imageFile!.path)),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  onChanged: (val) => companyName = val,
                  validator: (val) =>
                      val!.isEmpty ? 'Please enter a company name' : null,
                  decoration: InputDecoration(
                    labelText: 'Company Name',
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  onChanged: (val) => address = val,
                  validator: (val) =>
                      val!.isEmpty ? 'Please enter an address/location' : null,
                  decoration: InputDecoration(
                    labelText: 'Address/Location',
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  onChanged: (val) => salary = val,
                  validator: (val) =>
                      val!.isEmpty ? 'Please enter a salary' : null,
                  decoration: InputDecoration(
                    labelText: 'Salary',
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  onChanged: (val) => contact = val,
                  validator: (val) => val!.isEmpty
                      ? 'Please enter a company email/phone number'
                      : null,
                  decoration: InputDecoration(
                    labelText: 'Company Email/Phone',
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Submit job details to your backend or service
                      print('Job details submitted');
                    }
                  },
                  child: Text('Create'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
