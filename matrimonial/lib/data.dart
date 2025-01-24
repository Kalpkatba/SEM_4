import 'package:flutter/material.dart';
import 'package:matrimonial/adduser.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Matrimonial',style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // Ensures content is centered vertically
            children: [
              IconButton(
                icon: Icon(Icons.person_add),
                iconSize: 70.0,
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddUser()),
                  );
                },
              ),
              SizedBox(height: 8.0), // Space between icon and text
              Text(
                'Add User',
                style: TextStyle(
                  fontSize: 18.0, // Increased font size for visibility
                  color: Colors.black, // Explicitly set color for text
                  fontWeight: FontWeight.bold, // Bold for emphasis
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
