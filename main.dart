import 'package:flutapp/job_upload_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Finder'),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            onPressed: () {
              // TODO: Logic for "Look Job"
            },
            child: Text(
              'Look Job',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(width: 8.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            onPressed: () {
              {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => JobUploadPage()));
              }
              child:
              Text('Upload Job');
            },
            child: Text(
              'Upload Job',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Find Your Dream Job',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}
