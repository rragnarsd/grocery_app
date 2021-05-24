import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class UserScreen extends StatefulWidget {
  static const routeName = '/UserScreen';

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User Info'),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            UserListTile(title: 'Jakob', subTitle: 'Yolo', index: 0),
            UserListTile(title: 'Jakob', subTitle: 'Yolo', index: 1),
            UserListTile(title: 'Jakob', subTitle: 'Yolo', index: 2),
            /* userListTile('Email', 'Email sub', 0, context),
        userListTile('Phone', '444444', 0, context),
        userListTile('Address', 'Karanes', 0, context),
        userListTile('Joined Date', 'date', 0, context),*/
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            ListTileSwitch(
              value: _value,
              leading: Icon(Icons.night_shelter),
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
              visualDensity: VisualDensity.comfortable,
              switchType: SwitchType.cupertino,
              switchActiveColor: Colors.indigo,
              title: Text('Dark Theme'),
            ),
            UserListTile(title: 'Logout', subTitle: '', index: 4),
          ]),
    );
  }
}

class UserListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  int index;

  UserListTile({this.title, this.subTitle, this.index});

  List<IconData> _userTileIcons = [
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          title: Text(title),
          subtitle: Text(subTitle),
          leading: Icon(_userTileIcons[index]),
          onTap: () {},
        ),
      ),
    );
  }
}
