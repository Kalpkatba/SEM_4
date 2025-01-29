import 'package:flutter/material.dart';
import 'package:flutter_app/aboutUs.dart';
import 'package:flutter_app/adduser.dart';
import 'package:flutter_app/favourite.dart';
import 'package:flutter_app/userlist.dart';

// Create a class to manage the user list state
class UserState extends ChangeNotifier {
  static final UserState _instance = UserState._internal();

  factory UserState() => _instance;

  UserState._internal();

  List<Map<String, dynamic>> userList = [];

  void addUser(Map<String, dynamic> user) {
    userList.add(user);
    notifyListeners();
  }

  void deleteUser(int index) {
    userList.removeAt(index);
    notifyListeners();
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Matrimonial',
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const Dashboard()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/flutter_logo.png',
              width: 150.0,
              height: 150.0,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Matrimonial',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20.0),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final UserState userState = UserState();

  // List of dashboard items
  final List<Map<String, dynamic>> dashboardItems = [
    {
      "icon": Icons.person_add,
      "title": "Add User",
      "color": Colors.blue,
      "page": AddUser(
        onUserAdded: (user) {
          UserState().addUser(user);
        },
        userList: UserState().userList,
      )
    },
    {
      "icon": Icons.list,
      "title": "User List",
      "color": Colors.green,
      "page": const Userlist(),
    },
    {
      "icon": Icons.favorite,
      "title": "Favourite",
      "color": Colors.pink,
      "page": const Favourite(),
    },
    {
      "icon": Icons.account_circle,
      "title": "About Us",
      "color": Colors.orange,
      "page": const Aboutus(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Matrimonial',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: dashboardItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, index) {
            var item = dashboardItems[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => item["page"]),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 6,
                shadowColor: Colors.black54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item["icon"],
                      size: 60,
                      color: item["color"],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item["title"],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
