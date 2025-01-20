import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabDemo extends StatelessWidget {
  TabDemo({super.key});
  List<String> name= ['a','b','c'];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(),
                    Text("user")
                  ],
                )),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("home"),
                  trailing: Text("demo"),
                  onTap: (){
                    print("jhsdfg");
                  },
                )
              ],
            )
        ),
        appBar: AppBar(
          title: Text("Tab View"),
          bottom: TabBar(tabs: [
            Tab(text: "demo",),
            Tab(text: "demo1",),
            Tab(text: "demo2",)
          ]),
        ),
        body: TabBarView(children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Alert"),
                              content: Text("Demooo"),
                              actions: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(CupertinoIcons.back))
                              ],
                            );
                          });
                    },
                    child: Text('Demo')),
              ]),
          Text("demo"),
          Text("demo")
        ]),
      ),
    );
  }
}
// ListView.builder(itemCount: name.length,itemBuilder: (context, index) {
// return Text(name[index]);
// },)