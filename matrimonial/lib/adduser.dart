import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();

  List<String> nameList = [];
  List<String> filterList = [];
  bool isSearch = false;

  void addUser(String name) {
    setState(() {
      nameList.add(name);
    });
  }

  void deleteUser(int index) {
    setState(() {
      nameList.removeAt(index);
    });
  }

  void editUser(int index) {
    nameController.text = nameList[index];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit Name"),
          content: TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: "Enter Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(23),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  nameList[index] = nameController.text;
                });
                nameController.clear();
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
            TextButton(
              onPressed: () {
                nameController.clear();
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  void searchUser(String searchData) {
    filterList.clear();
    if (searchData.isNotEmpty) {
      for (var element in nameList) {
        if (element.toLowerCase().contains(searchData.toLowerCase())) {
          filterList.add(element);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Form',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              setState(() {
                isSearch = !isSearch;
                if (!isSearch) {
                  filterList.clear();
                }
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Enter Name',
                hintText: 'Type a name to add',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  addUser(nameController.text);
                  nameController.clear();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: const Text('Add User'),
            ),
            const SizedBox(height: 16.0),
            if (isSearch)
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Type to search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    searchUser(value);
                  });
                },
              ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: isSearch ? filterList.length : nameList.length,
                itemBuilder: (context, index) {
                  final name = isSearch ? filterList[index] : nameList[index];
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      leading: const Icon(Icons.supervised_user_circle),
                      title: Text(name),
                      trailing: Wrap(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              editUser(index);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              deleteUser(index);
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
      ),
    );
  }
}
