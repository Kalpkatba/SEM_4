import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/adduser.dart';
import 'package:flutter_app/userlist.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  final UserState userState = UserState(); // Assuming you have a shared UserState

  // Function to launch the edit screen for a given user.
  void editUser(BuildContext context, Map<String, dynamic> user) {
    int originalIndex = userState.userList.indexOf(user);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddUser(
          onUserAdded: (updatedUser) {
            setState(() {
              userState.userList[originalIndex] = updatedUser;
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

  // Helper widget to build info rows inside the details dialog.
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Filter favorite users
    List<Map<String, dynamic>> favoriteUsers = userState.userList
        .where((user) => user['isFavourite'] == true)
        .toList();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          children: [
            const Icon(
              Icons.view_list_rounded,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(width: 15),
            Text(
              'Favourite List',
              style: TextStyle(
                fontFamily: GoogleFonts.pacifico().fontFamily,
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Color(0xFF1A253F)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: favoriteUsers.isEmpty
            ? const Center(
          child: Text(
            "No favorite users found",
            style: TextStyle(fontSize: 18),
          ),
        )
            : ListView.builder(
          itemCount: favoriteUsers.length,
          itemBuilder: (context, index) {
            var user = favoriteUsers[index];
            return Card(
              margin:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: const Color(0xFF1A253F),
              child: ListTile(
                leading: const Icon(Icons.person, color: Colors.white),
                title: Text(
                  user['name'],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Favourite icon (only adds to favourites)
                    GestureDetector(
                      onTap: () {
                        // Already favourite—show a message.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                            Text('User is already in favourites'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 24,
                        ),
                      ),
                    ),
                    // Edit icon
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      onPressed: () => editUser(context, user),
                    ),
                    // Delete icon
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Confirm Delete"),
                            content: const Text(
                                "Are you sure you want to delete this user?"),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context),
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    int originalIndex = userState.userList
                                        .indexOf(user);
                                    userState.deleteUser(originalIndex);
                                  });
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
                // When tapping the ListTile, show details with the same set of action icons.
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) {
                      return BackdropFilter(
                        filter:
                        ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: AlertDialog(
                          backgroundColor: Colors.transparent,
                          contentPadding: EdgeInsets.zero,
                          content: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF2E3A59),
                                  Color(0xFF1A253F)
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 6,
                                  offset: const Offset(2, 2),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // User photo (placeholder if not provided)
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: user.containsKey('photo')
                                      ? NetworkImage(user['photo'])
                                      : const AssetImage(
                                      'assets/images/Matrimoniallogo.png')
                                  as ImageProvider,
                                ),
                                const SizedBox(height: 8),
                                // User name
                                Text(
                                  user['name'],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Divider(
                                  color: Colors.white,
                                  thickness: 2,
                                ),
                                const SizedBox(height: 8),
                                // Row of action icons: favourite, edit, delete
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // Favourite icon (no removal)
                                    GestureDetector(
                                      onTap: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'User is already in favourites'),
                                            duration:
                                            Duration(seconds: 2),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding:
                                        const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                    // Edit icon
                                    IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        editUser(context, user);
                                      },
                                    ),
                                    // Delete icon
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        showDialog(
                                          context: context,
                                          builder: (context) =>
                                              AlertDialog(
                                                title: const Text(
                                                    "Confirm Delete"),
                                                content: const Text(
                                                    "Are you sure you want to delete this user?"),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            context),
                                                    child: const Text("Cancel"),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        int originalIndex =
                                                        userState.userList
                                                            .indexOf(
                                                            user);
                                                        userState.deleteUser(
                                                            originalIndex);
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      "Delete",
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                // Display additional user details
                                _buildInfoRow("Email", user['email']),
                                _buildInfoRow("Phone", user['phone']),
                                _buildInfoRow("Address", user['address']),
                                _buildInfoRow("City", user['city']),
                                _buildInfoRow("Gender", user['gender']),
                                _buildInfoRow(
                                  "DOB",
                                  "${user['dob']} (${user['age']} years old)",
                                ),
                                _buildInfoRow("Hobbies", user['hobbies']),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
