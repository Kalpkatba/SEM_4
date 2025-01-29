// import 'package:flutter/material.dart';
//
// class Userlist extends StatefulWidget {
//   const Userlist({super.key});
//
//   @override
//   State<Userlist> createState() => _UserlistState();
// }
//
// class _UserlistState extends State<Userlist> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.red,
//     );
//   }
// }
// userlist.dart
import 'package:flutter/material.dart';
import 'adduser.dart';
import 'data.dart';

class Userlist extends StatefulWidget {
  const Userlist({super.key});

  @override
  State<Userlist> createState() => _UserlistState();
}

class _UserlistState extends State<Userlist> {
  final UserState userState = UserState();

  void editUser(BuildContext context, int index) {
    var user = userState.userList[index];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddUser(
          onUserAdded: (updatedUser) {
            setState(() {
              userState.userList[index] = updatedUser;
            });
            Navigator.pop(context);
          },
          userList: userState.userList,
          initialData: user,  // Pass the existing user data
          isEditing: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: userState.userList.isEmpty
          ? Center(
        child: Text(
          'No users added yet',
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: userState.userList.length,
        itemBuilder: (context, index) {
          var user = userState.userList[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(
                user['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email: ${user['email']}'),
                  Text('Phone: ${user['phone']}'),
                  Text('Address: ${user['address']}'),
                  Text('City: ${user['city']}'),
                  Text('Gender: ${user['gender']}'),
                  Text('DOB: ${user['dob']} (${user['age']} years old)'),
                  Text('Hobbies: ${user['hobbies']}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => editUser(context, index),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        userState.deleteUser(index);
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}