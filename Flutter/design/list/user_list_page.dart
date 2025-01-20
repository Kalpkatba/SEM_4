import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_programing/demo12.dart';

import '../../abc/user.dart';
import '../../utils/string_const.dart';

class UserListPage extends StatefulWidget {
  UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  User _user = User();

  bool isGrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'User List',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isGrid = false;
                });
              },
              icon: Icon(
                Icons.list,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                setState(() {
                  isGrid = true;
                });
              },
              icon: Icon(
                Icons.grid_3x3,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return UserEntryFormPage();
                  },
                )).then((value) {
                  _user.userList.add(value);
                  setState(() {});
                });
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              )),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TextFormField(
            onChanged: (value) {
              print('::CHANGE VALUE :: $value');
            },
          ),
          _user.userList.isEmpty
              ? Expanded(
            child: Center(
                child: Text(
                  'No User Found',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                )),
          )
              : (isGrid
              ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            itemBuilder: (context, index) {
              print(':::GRID ITEM BUILDER CALLED:::$index');
              return getListGridItem(index);
            },
            itemCount: _user.userList.length,
            // children: getListItem(),
          )
              : Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                print(':::LISTVIEW ITEM BUILDER CALLED:::$index');
                return getListGridItem(index);
              },
              itemCount: _user.userList.length,
            ),
          )),
        ],
      ),
    );
  }

  List<Widget> getListItem() {
    List<Widget> widgets = [];
    for (int i = 0; i < _user.userList.length; i++) {
      print(':::GRID ITEM BUILDER CALLED:::$i');
      widgets.add(getListGridItem(i));
    }
    return widgets;
  }

  Widget getListGridItem(i) {
    return Card(
      elevation: 10,
      child: ListTile(
        onTap: () {},
        leading: Image.asset('assets/images/download.jpeg'),
        trailing: Wrap(
          alignment: WrapAlignment.center,
          direction: Axis.horizontal,
          children: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text('DELETE'),
                      content: Text('Are you sure want to delete?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            _user.deleteUser(i);
                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: Text('yes'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('No'),
                        )
                      ],
                    );
                  },
                );
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
                size: 25,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey.shade500,
            ),
          ],
        ),
        title: Wrap(
          direction: Axis.vertical,
          children: [
            Text(
              '${_user.userList[i][NAME]}',
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            Text(
              '${_user.userList[i][CITY]} | ${_user.userList[i][EMAIL]}',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
