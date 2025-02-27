// import 'package:flutter/material.dart';
// import 'package:flutter_app/aboutUs.dart';
// import 'package:flutter_app/adduser.dart';
// import 'package:flutter_app/favourite.dart';
// import 'package:flutter_app/userlist.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// // Create a class to manage the user list state
// class UserState extends ChangeNotifier {
//   static final UserState _instance = UserState._internal();
//
//   factory UserState() => _instance;
//
//   UserState._internal();
//
//   List<Map<String, dynamic>> userList = [];
//
//   void addUser(Map<String, dynamic> user) {
//     userList.add(user);
//     notifyListeners();
//   }
//
//   void deleteUser(int index) {
//     userList.removeAt(index);
//     notifyListeners();
//   }
// }
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Matrimonial',
//       home: const SplashScreen(),
//     );
//   }
// }
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 5), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (_) => const Dashboard()),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.pinkAccent.shade700,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/flutter_logo.png',
//               width: 150.0,
//               height: 150.0,
//             ),
//             const SizedBox(height: 20.0),
//             const Text(
//               'Matrimonial',
//               style: TextStyle(
//                 fontSize: 30.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue,
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             const CircularProgressIndicator(
//               valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Dashboard extends StatefulWidget {
//   const Dashboard({super.key});
//
//   @override
//   State<Dashboard> createState() => _DashboardState();
// }
//
// class _DashboardState extends State<Dashboard> {
//   final UserState userState = UserState();
//
//   // List of dashboard items
//   final List<Map<String, dynamic>> dashboardItems = [
//     {
//       "icon": Icons.person_add,
//       "title": "Add User",
//       "color": Colors.blue,
//       "page": AddUser(
//         onUserAdded: (user) {
//           UserState().addUser(user);
//         },
//         userList: UserState().userList,
//       )
//     },
//     {
//       "icon": Icons.list,
//       "title": "User List",
//       "color": Colors.green,
//       "page": const Userlist(),
//     },
//     {
//       "icon": Icons.favorite,
//       "title": "Favourite",
//       "color": Colors.pink,
//       "page": const Favourite(),
//     },
//     {
//       "icon": Icons.account_circle,
//       "title": "About Us",
//       "color": Colors.orange,
//       "page": const Aboutus(),
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Color(0xFFF9F9F9),
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(400), // Increased height
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
//               gradient: const LinearGradient(
//                 colors: [Color(0xFFFF006F), Color(0xFF65072F)],
//                 // Purple Gradient
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.3),
//                   blurRadius: 10,
//                   offset: const Offset(0, 5),
//                 ),
//               ],
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//               // Optional: Adjust vertical padding
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.6),
//                           blurRadius: 6,
//                           offset: const Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: const CircleAvatar(
//                       radius: 20,
//                       backgroundImage: AssetImage(
//                           "assets/images/Matrimoniallogo.png"), // Add your image
//                     ),
//                   ),
//                   // AppBar Title
//                   Text(
//                     "Matrimonial",
//                     style: GoogleFonts.pacifico(
//                       textStyle: const TextStyle(
//                         fontSize: 26,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 1.5,
//                         shadows: [
//                           Shadow(
//                             color: Colors.black54,
//                             blurRadius: 4,
//                             offset: Offset(2, 2),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   // Profile Icon
//                 ],
//               ),
//             ),
//           ),
//         ),
//         body: Container(
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: GridView.builder(
//               itemCount: dashboardItems.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, // 2 items per row
//                 crossAxisSpacing: 15,
//                 mainAxisSpacing: 15,
//                 childAspectRatio: 1.0,
//               ),
//               itemBuilder: (context, index) {
//
//                 var item = dashboardItems[index];
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(builder: (_) => item["page"]),
//                     );
//                   },
//                   child: Column(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Icon(
//                             item["icon"],
//                             size: 60,
//                             color: item["color"],
//                           ),
//                           const SizedBox(height: 10),
//                           Text(
//                             item["title"],
//                             style: const TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class Dashboard extends StatelessWidget {
//   const Dashboard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFD1BFA7), // Elegant beige background
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(120),
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: const LinearGradient(
//               colors: [Color(0xFF2E3A59), Color(0xFF1A253F)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//             borderRadius: const BorderRadius.only(
//               bottomLeft: Radius.circular(30),
//               bottomRight: Radius.circular(30),
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.4),
//                 blurRadius: 10,
//                 offset: const Offset(0, 5),
//               ),
//             ],
//           ),
//           child: Center(
//             child: Text(
//               "Matrimonial",
//               style: GoogleFonts.pacifico(
//                 textStyle: const TextStyle(
//                   fontSize: 28,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 1.5,
//                   shadows: [
//                     Shadow(
//                       color: Colors.black54,
//                       blurRadius: 4,
//                       offset: Offset(2, 2),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: GridView.count(
//           crossAxisCount: 2,
//           crossAxisSpacing: 15,
//           mainAxisSpacing: 15,
//           children: [
//             _buildDashboardButton(
//               icon: Icons.person_add,
//               title: "Add User",
//             ),
//             _buildDashboardButton(
//               icon: Icons.list,
//               title: "User List",
//             ),
//             _buildDashboardButton(
//               icon: Icons.favorite,
//               title: "Favourites",
//             ),
//             _buildDashboardButton(
//               icon: Icons.info,
//               title: "About Us",
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: _buildBottomNavigationBar(),
//     );
//   }
//
//   Widget _buildDashboardButton({required IconData icon, required String title}) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         gradient: const LinearGradient(
//           colors: [Color(0xFF2E3A59), Color(0xFF1A253F)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.6),
//             blurRadius: 8,
//             offset: const Offset(2, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, size: 50, color: Colors.amberAccent),
//           const SizedBox(height: 10),
//           Text(
//             title,
//             style: GoogleFonts.poppins(
//               textStyle: const TextStyle(
//                 fontSize: 18,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildBottomNavigationBar() {
//     return Container(
//       height: 70,
//       decoration: BoxDecoration(
//         color: const Color(0xFF1A253F),
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(30),
//           topRight: Radius.circular(30),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.3),
//             blurRadius: 10,
//             offset: const Offset(0, -3),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           IconButton(
//             icon: const Icon(Icons.home, color: Colors.amberAccent, size: 30),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: const Icon(Icons.favorite, color: Colors.amberAccent, size: 30),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: const Icon(Icons.person, color: Colors.amberAccent, size: 30),
//             onPressed: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_app/aboutUs.dart';
// import 'package:flutter_app/adduser.dart';
// import 'package:flutter_app/favourite.dart';
// import 'package:flutter_app/userlist.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// // Create a class to manage the user list state
// class UserState extends ChangeNotifier {
//   static final UserState _instance = UserState._internal();
//
//   factory UserState() => _instance;
//
//   UserState._internal();
//
//   List<Map<String, dynamic>> userList = [];
//
//   void addUser(Map<String, dynamic> user) {
//     userList.add(user);
//     notifyListeners();
//   }
//
//   void deleteUser(int index) {
//     userList.removeAt(index);
//     notifyListeners();
//   }
// }
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Matrimonial',
//       home: const SplashScreen(),
//     );
//   }
// }
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 5), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (_) => const Dashboard()),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Keep your original splash background color
//       backgroundColor: Colors.pinkAccent.shade700,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/flutter_logo.png',
//               width: 150.0,
//               height: 150.0,
//             ),
//             const SizedBox(height: 20.0),
//             const Text(
//               'Matrimonial',
//               style: TextStyle(
//                 fontSize: 30.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue,
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             const CircularProgressIndicator(
//               valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Dashboard extends StatefulWidget {
//   const Dashboard({super.key});
//
//   @override
//   State<Dashboard> createState() => _DashboardState();
// }
//
// class _DashboardState extends State<Dashboard> {
//   final UserState userState = UserState();
//
//   // List of dashboard items
//   final List<Map<String, dynamic>> dashboardItems = [
//     {
//       "icon": Icons.person_add,
//       "title": "Add User",
//       "color": Colors.blue,
//       "page": AddUser(
//         onUserAdded: (user) {
//           UserState().addUser(user);
//         },
//         userList: UserState().userList,
//       )
//     },
//     {
//       "icon": Icons.list,
//       "title": "User List",
//       "color": Colors.green,
//       "page": const Userlist(),
//     },
//     {
//       "icon": Icons.favorite,
//       "title": "Favourite",
//       "color": Colors.pink,
//       "page": const Favourite(),
//     },
//     {
//       "icon": Icons.account_circle,
//       "title": "About Us",
//       "color": Colors.orange,
//       "page": const Aboutus(),
//     },
//   ];
//
//   /// Separate helper for the icon
//   Widget _buildDashboardIcon(IconData icon, Color color) {
//     return Icon(
//       icon,
//       size: 50,
//       // Override with a gold-like color for that luxurious effect
//       color: const Color(0xFFFFD700),
//       shadows: [
//         Shadow(
//           color: Colors.black.withOpacity(0.4),
//           blurRadius: 4,
//           offset: const Offset(2, 2),
//         ),
//       ],
//     );
//   }
//
//   /// Separate helper for the text (button label)
//   Widget _buildDashboardLabel(String title) {
//     return Text(
//       title,
//       style: GoogleFonts.poppins(
//         textStyle: const TextStyle(
//           fontSize: 18,
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//           shadows: [
//             Shadow(
//               color: Colors.black54,
//               blurRadius: 3,
//               offset: Offset(1, 1),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         // Elegant beige background to match the sample image
//         backgroundColor: const Color(0xFFD1BFA7),
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(120),
//           child: Container(
//             decoration: BoxDecoration(
//               // Navy gradient for the top bar
//               gradient: const LinearGradient(
//                 colors: [Color(0xFF2E3A59), Color(0xFF1A253F)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(30),
//                 bottomRight: Radius.circular(30),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.4),
//                   blurRadius: 10,
//                   offset: const Offset(0, 5),
//                 ),
//               ],
//             ),
//             child: Padding(
//               // Keep your row and circle avatar
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // Circle avatar with logo
//                   Container(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.6),
//                           blurRadius: 6,
//                           offset: const Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: const CircleAvatar(
//                       radius: 30,
//                       backgroundImage: AssetImage(
//                         "assets/images/Matrimoniallogo.png",
//                       ),
//                     ),
//                   ),
//                   // AppBar Title (center)
//                   Text(
//                     "Matrimonial",
//                     style: GoogleFonts.pacifico(
//                       textStyle: const TextStyle(
//                         fontSize: 28,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 1.5,
//                         shadows: [
//                           Shadow(
//                             color: Colors.black54,
//                             blurRadius: 4,
//                             offset: Offset(2, 2),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   // Right side placeholder (if you want an icon, add here)
//                   const SizedBox(width: 40),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         // Body with GridView
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: GridView.builder(
//             itemCount: dashboardItems.length,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2, // 2 items per row
//               crossAxisSpacing: 15,
//               mainAxisSpacing: 15,
//               childAspectRatio: 1.0,
//             ),
//             itemBuilder: (context, index) {
//               var item = dashboardItems[index];
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(builder: (_) => item["page"]),
//                   );
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     gradient: const LinearGradient(
//                       colors: [Color(0xFF2E3A59), Color(0xFF1A253F)],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.6),
//                         blurRadius: 8,
//                         offset: const Offset(2, 4),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       _buildDashboardIcon(item["icon"], item["color"]),
//                       const SizedBox(height: 10),
//                       _buildDashboardLabel(item["title"]),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_app/aboutUs.dart';
// import 'package:flutter_app/adduser.dart';
// import 'package:flutter_app/favourite.dart';
// import 'package:flutter_app/userlist.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// // Create a class to manage the user list state
// class UserState extends ChangeNotifier {
//   static final UserState _instance = UserState._internal();
//
//   factory UserState() => _instance;
//
//   UserState._internal();
//
//   List<Map<String, dynamic>> userList = [];
//
//   void addUser(Map<String, dynamic> user) {
//     userList.add(user);
//     notifyListeners();
//   }
//
//   void deleteUser(int index) {
//     userList.removeAt(index);
//     notifyListeners();
//   }
// }
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Matrimonial',
//       home: const SplashScreen(),
//     );
//   }
// }
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 5), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (_) => const Dashboard()),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Keep your original splash background color
//       backgroundColor: Colors.pinkAccent.shade700,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/flutter_logo.png',
//               width: 150.0,
//               height: 150.0,
//             ),
//             const SizedBox(height: 20.0),
//             const Text(
//               'Matrimonial',
//               style: TextStyle(
//                 fontSize: 30.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue,
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             const CircularProgressIndicator(
//               valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Dashboard extends StatefulWidget {
//   const Dashboard({super.key});
//
//   @override
//   State<Dashboard> createState() => _DashboardState();
// }
//
// class _DashboardState extends State<Dashboard> {
//   final UserState userState = UserState();
//
//   // Bottom navigation index
//   int _currentIndex = 0;
//
//   // List of dashboard items
//   final List<Map<String, dynamic>> dashboardItems = [
//     {
//       "icon": Icons.person_add,
//       "title": "Add User",
//       "color": Colors.blue,
//       "page": AddUser(
//         onUserAdded: (user) {
//           UserState().addUser(user);
//         },
//         userList: UserState().userList,
//       )
//     },
//     {
//       "icon": Icons.list,
//       "title": "User List",
//       "color": Colors.green,
//       "page": const Userlist(),
//     },
//     {
//       "icon": Icons.favorite,
//       "title": "Favourite",
//       "color": Colors.pink,
//       "page": const Favourite(),
//     },
//     {
//       "icon": Icons.account_circle,
//       "title": "About Us",
//       "color": Colors.orange,
//       "page": const Aboutus(),
//     },
//   ];
//
//   /// Separate helper for the icon
//   Widget _buildDashboardIcon(IconData icon, Color color) {
//     return Icon(
//       icon,
//       size: 50,
//       // Override with a gold-like color for that luxurious effect
//       color: const Color(0xFFFFD700),
//       shadows: [
//         Shadow(
//           color: Colors.black.withOpacity(0.4),
//           blurRadius: 4,
//           offset: const Offset(2, 2),
//         ),
//       ],
//     );
//   }
//
//   /// Separate helper for the text (button label)
//   Widget _buildDashboardLabel(String title) {
//     return Text(
//       title,
//       style: GoogleFonts.poppins(
//         textStyle: const TextStyle(
//           fontSize: 18,
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//           shadows: [
//             Shadow(
//               color: Colors.black54,
//               blurRadius: 3,
//               offset: Offset(1, 1),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// Bottom navigation bar widget
//   Widget _buildBottomNavigationBar() {
//     return BottomNavigationBar(
//       backgroundColor: const Color(0xFF1A253F),
//       selectedItemColor: Colors.amberAccent,
//       unselectedItemColor: Colors.white,
//       currentIndex: _currentIndex,
//       onTap: (index) {
//         setState(() {
//           _currentIndex = index;
//         });
//         if (index == 0) {
//           // Home: Dashboard grid view is already displayed.
//         } else if (index == 1) {
//           Navigator.of(context).push(
//             MaterialPageRoute(builder: (_) => const Favourite()),
//           );
//         } else if (index == 2) {
//           Navigator.of(context).push(
//             MaterialPageRoute(builder: (_) => const Aboutus()),
//           );
//         }
//       },
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.favorite),
//           label: 'Favourite',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.info),
//           label: 'About Us',
//         ),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         // Elegant beige background to match the sample image
//         backgroundColor: const Color(0xFFD1BFA7),
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(120),
//           child: Container(
//             decoration: BoxDecoration(
//               // Navy gradient for the top bar
//               gradient: const LinearGradient(
//                 colors: [Color(0xFF2E3A59), Color(0xFF1A253F)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(30),
//                 bottomRight: Radius.circular(30),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.4),
//                   blurRadius: 10,
//                   offset: const Offset(0, 5),
//                 ),
//               ],
//             ),
//             child: Padding(
//               // Keep your row and circle avatar
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // Circle avatar with logo
//                   Container(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.6),
//                           blurRadius: 6,
//                           offset: const Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: const CircleAvatar(
//                       radius: 30,
//                       backgroundImage: AssetImage(
//                         "assets/images/Matrimoniallogo.png",
//                       ),
//                     ),
//                   ),
//                   // AppBar Title (center)
//                   Text(
//                     "Matrimonial",
//                     style: GoogleFonts.pacifico(
//                       textStyle: const TextStyle(
//                         fontSize: 28,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 1.5,
//                         shadows: [
//                           Shadow(
//                             color: Colors.black54,
//                             blurRadius: 4,
//                             offset: Offset(2, 2),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   // Right side placeholder (if you want an icon, add here)
//                   const SizedBox(width: 40),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         // Body with GridView
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: GridView.builder(
//             itemCount: dashboardItems.length,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2, // 2 items per row
//               crossAxisSpacing: 15,
//               mainAxisSpacing: 15,
//               childAspectRatio: 1.0,
//             ),
//             itemBuilder: (context, index) {
//               var item = dashboardItems[index];
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(builder: (_) => item["page"]),
//                   );
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     gradient: const LinearGradient(
//                       colors: [Color(0xFF2E3A59), Color(0xFF1A253F)],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.6),
//                         blurRadius: 8,
//                         offset: const Offset(2, 4),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       _buildDashboardIcon(item["icon"], item["color"]),
//                       const SizedBox(height: 10),
//                       _buildDashboardLabel(item["title"]),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         bottomNavigationBar: _buildBottomNavigationBar(),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_app/aboutUs.dart';
import 'package:flutter_app/adduser.dart';
import 'package:flutter_app/favourite.dart';
import 'package:flutter_app/userlist.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

// Create a class to manage the user list state
class UserState extends ChangeNotifier {
  static final UserState _instance = UserState._internal();

  factory UserState() => _instance;

  UserState._internal();

  List<Map<String, dynamic>> userList = [];

  // List<Map<String, dynamic>> favoritesList = [];

  void addUser(Map<String, dynamic> user) {
    userList.add(user);
    notifyListeners();
  }

  void deleteUser(int index) {
    userList.removeAt(index);
    notifyListeners();
  }
//   void toggleFavorite(int index) {
//     var user = userList[index];
//     user['isFavourite'] = !(user['isFavourite'] ?? false);
//     if (user['isFavourite']) {
//       favoritesList.add(user);  // Add to favorites if it's marked as favorite
//     } else {
//       favoritesList.remove(user);  // Remove from favorites if it's unmarked
//     }
//     notifyListeners();
//   }
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
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();

    // Navigate to Dashboard after animation
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const Dashboard()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink, Color(0xFF1A253F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _opacityAnimation,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  'assets/animations/matrimonial_heart.json', // Add a romantic Lottie animation
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Matrimony App",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Pacifico",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Matrimoniallogo.png',
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

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final UserState userState = UserState();

  // Track the selected bottom navigation index
  int _selectedIndex = 0;

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
      "title": "Favourites",
      "color": Colors.pink,
      "page": const Favourite() // Pass userState here
    },
    {
      "icon": Icons.info,
      "title": "About Us",
      "color": Colors.orange,
      "page": const AboutPage(),
    },
  ];

  /// Separate helper for the icon
  Widget _buildDashboardIcon(IconData icon, Color color) {
    return Icon(
      icon,
      size: 50,
      // Override with a premium gold-like color for that luxurious effect
      color: const Color(0xFFFFC300),
      shadows: [
        Shadow(
          color: Colors.black.withOpacity(0.4),
          blurRadius: 4,
          offset: const Offset(2, 2),
        ),
      ],
    );
  }

  /// Separate helper for the text (button label)
  Widget _buildDashboardLabel(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// Helper widget for bottom navigation item with premium highlight
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

  /// Bottom navigation bar exactly as provided with premium highlight
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
              // Home is already displayed, no need to navigate
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
            icon: Icons.list, // Change icon to represent User List
            label: 'User  List',
            onTap: () {
              setState(() {
                _selectedIndex = 2; // Update the selected index
              });
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Userlist()),
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
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AboutPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // Elegant beige background
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.pink, Color(0xFF1A253F)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Center(
            child: Text(
              "Matrimonial",
              style: GoogleFonts.pacifico(
                textStyle: const TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2E3A59), Color(0xFF1A253F)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      blurRadius: 8,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDashboardIcon(item["icon"], item["color"]),
                    const SizedBox(height: 10),
                    _buildDashboardLabel(item["title"]),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
