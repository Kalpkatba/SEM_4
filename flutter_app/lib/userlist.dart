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

  // 🔍 SEARCH LOGIC: Add search controller and search query
  TextEditingController searchController = TextEditingController();
  String searchQuery = "";

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
          initialData: user,
          isEditing: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 🔍 SEARCH LOGIC: Filter users based on search query
    List<Map<String, dynamic>> filteredUsers = userState.userList
        .where((user) => user['name'].toLowerCase().contains(searchQuery))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          // 🔍 SEARCH LOGIC: Search bar UI
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: "Search by name",
                prefixIcon: Icon(Icons.search),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value
                      .toLowerCase(); // 🔍 SEARCH LOGIC: Convert input to lowercase for case-insensitive search
                });
              },
            ),
          ),
          Expanded(
            child: filteredUsers.isEmpty
                ? Center(
              child: Text(
                "No users found",
                style: TextStyle(fontSize: 18),
              ),
            )
                : ListView.builder(
              itemCount: filteredUsers.length,
              // 🔍 SEARCH LOGIC: Use filtered list
              itemBuilder: (context, index) {
                var user = filteredUsers[
                index]; // 🔍 SEARCH LOGIC: Use filtered user data
                return Card(
                  margin:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                        Text(
                            'DOB: ${user['dob']} (${user['age']} years old)'),
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
          ),
        ],
      ),
    );
  }
}
