import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/aboutUs.dart';
import 'package:flutter_app/favourite.dart';
import 'package:flutter_app/userDetail.dart';
import 'adduser.dart';
import 'data.dart';
import 'userDetail.dart'; // Import the UserDetails screen
import 'package:google_fonts/google_fonts.dart';

class Userlist extends StatefulWidget {
  const Userlist({super.key});

  @override
  State<Userlist> createState() => _UserlistState();
}

class _UserlistState extends State<Userlist> {
  final UserState userState = UserState();
  int _selectedIndex = 0;

  // SEARCH: Controller & query for filtering
  TextEditingController searchController = TextEditingController();
  String searchQuery = "";

  final List<Widget> _screens = [
    Dashboard(), // Replace with your actual Home screen widget
    Favourite(), // Your Favourite screen
    Userlist(), // This screen
    AboutPage(), // Your About Us screen
  ];

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

  // Modified _buildInfoRow with white text for dark background
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

  Widget _buildBottomNavItem({
    required int index,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: isSelected
            ? BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Color(0xFF1A253F) : const Color(0xFFFFC300),
              size: 30,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Color(0xFF1A253F) : const Color(0xFFFFC300),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.pink, Color(0xFF1A253F)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavItem(
            index: 0,
            icon: Icons.home,
            label: 'Home',
            onTap: () {
              setState(() {
                _selectedIndex = 0; // Update the selected index
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
          ),
          _buildBottomNavItem(
            index: 1,
            icon: Icons.favorite,
            label: 'Favourite',
            onTap: () {
              setState(() {
                _selectedIndex = 1; // Update the selected index
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Favourite()),
              );
            },
          ),
          _buildBottomNavItem(
            index: 2,
            icon: Icons.list,
            label: 'User  List',
            onTap: () {
              setState(() {
                _selectedIndex = 2; // Update the selected index
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Userlist()),
              );
            },
          ),
          _buildBottomNavItem(
            index: 3,
            icon: Icons.person,
            label: 'About Us',
            onTap: () {
              setState(() {
                _selectedIndex = 3; // Update the selected index
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Filter users based on search query (if empty, returns full list)
    List<Map<String, dynamic>> filteredUsers = userState.userList
        .where((user) => user['name'].toLowerCase().contains(searchQuery))
        .toList();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Container(
          child: Row(
            children: [
              const Icon(
                Icons.view_list_rounded,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(width: 15),
              Text(
                'User  List',
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
        color: Colors.white, // Elegant beige background
        child: Column(
          children: [
            // Search field
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: "Search by name",
                  labelStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.content_paste_search),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(21)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase();
                  });
                },
              ),
            ),
            // List of users in card view
            Expanded(
              child: filteredUsers.isEmpty
                  ? const Center(
                      child: Text(
                        "No users found",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredUsers.length,
                      itemBuilder: (context, index) {
                        var user = filteredUsers[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Colors.pink, Color(0xFF1A253F)],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
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
                            child: ListTile(
                              leading: const Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
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
                                  // Favourite toggle icon with border
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        user['isFavourite'] =
                                            !(user['isFavourite'] ?? false);
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      child: Icon(
                                        (user['isFavourite'] ?? false)
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: (user['isFavourite'] ?? false)
                                            ? Colors.red
                                            : Colors.white,
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
                                    onPressed: () => editUser(context, index),
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
                                                  // Get the correct index from the full user list
                                                  int originalIndex = userState
                                                      .userList
                                                      .indexOf(user);
                                                  userState.deleteUser(
                                                      originalIndex);
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Delete",
                                                  style: TextStyle(
                                                      color: Colors.red)),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              // When user taps on the ListTile, show details in a dialog with blurred background
                              onTap: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (context) {
                                    return BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 5.0,
                                        sigmaY: 5.0,
                                      ),
                                      child: AlertDialog(
                                        backgroundColor: Colors.transparent,
                                        contentPadding: EdgeInsets.zero,
                                        content: Container(
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                              colors: [
                                                Colors.blueGrey,
                                                Color(0xFF1A253F)
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                blurRadius: 6,
                                                offset: const Offset(2, 2),
                                              ),
                                            ],
                                          ),
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              // User photo (using a placeholder image)
                                              CircleAvatar(
                                                radius: 40,
                                                backgroundImage: user
                                                        .containsKey('photo')
                                                    ? NetworkImage(
                                                        user['photo'])
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
                                              // Horizontal line divider
                                              const Divider(
                                                color: Colors.white,
                                                thickness: 2,
                                              ),
                                              const SizedBox(height: 8),
                                              // Row of icons: favourite, edit, delete
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  // Favourite toggle icon with border
                                                  GestureDetector(
                                                    // Updated: only add to favourites, never remove.
                                                    onTap: () {
                                                      if (!(user[
                                                              'isFavourite'] ??
                                                          false)) {
                                                        setState(() {
                                                          user['isFavourite'] =
                                                              true;
                                                        });
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                                'Added to favorites'),
                                                            duration: Duration(
                                                                seconds: 2),
                                                          ),
                                                        );
                                                      } else {
                                                        // Optionally, notify the user that the user is already a favorite.
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                                'User already in favorites'),
                                                            duration: Duration(
                                                                seconds: 2),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4),
                                                      child: Icon(
                                                        (user['isFavourite'] ??
                                                                false)
                                                            ? Icons.favorite
                                                            : Icons.favorite,
                                                        color:
                                                            (user['isFavourite'] ??
                                                                    false)
                                                                ? Colors.red
                                                                : Colors.white,
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
                                                      editUser(
                                                          context,
                                                          filteredUsers
                                                              .indexOf(user));
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
                                                              child: const Text(
                                                                  "Cancel"),
                                                            ),
                                                            TextButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  userState.deleteUser(
                                                                      filteredUsers
                                                                          .indexOf(
                                                                              user));
                                                                });
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                "Delete",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .red),
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
                                              // Existing info rows
                                              _buildInfoRow(
                                                  "Email", user['email']),
                                              _buildInfoRow(
                                                  "Phone", user['phone']),
                                              _buildInfoRow(
                                                  "Address", user['address']),
                                              _buildInfoRow(
                                                  "City", user['city']),
                                              _buildInfoRow(
                                                  "Gender", user['gender']),
                                              _buildInfoRow("DOB",
                                                  "${user['dob']} (${user['age']} years old)"),
                                              _buildInfoRow(
                                                  "Hobbies", user['hobbies']),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
