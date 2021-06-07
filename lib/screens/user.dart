import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery_app/constants.dart';
import 'package:grocery_app/widgets/alert_dialogs.dart';

class UserScreen extends StatefulWidget {
  static const routeName = '/UserScreen';

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  ScrollController _scrollController;
  final _auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  var top = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              elevation: 4,
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  top = constraints.biggest.height;
                  return Container(
                    child: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      centerTitle: true,
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedOpacity(
                            opacity: top <= 110.0 ? 1.0 : 0,
                            duration: Duration(milliseconds: 300),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  //ATH
                                  height: 1.4,
                                  width: 1.4,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 1.0,
                                      )
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                        'https://cdn.pixabay.com/photo/2019/09/03/15/18/woman-4449637_960_720.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                 _auth.currentUser.email == null ? 'Guest' : _auth.currentUser.email
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      background: Image(
                        image: NetworkImage(
                          'https://cdn.pixabay.com/photo/2019/09/03/15/18/woman-4449637_960_720.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('User Bag', style: kTextStyleMedium),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Material(
                      child: InkWell(
                        splashColor: Theme.of(context).splashColor,
                        child: ListTile(
                          title: Text('Wishlist'),
                          trailing: Icon(Icons.chevron_right),
                          leading: Icon(Icons.favorite),
                          onTap: () => Navigator.of(context)
                              .pushNamed('/WishListScreen'),
                        ),
                      ),
                    ),
                    Material(
                      child: InkWell(
                        splashColor: Theme.of(context).splashColor,
                        child: ListTile(
                          title: Text('Cart'),
                          trailing: Icon(Icons.chevron_right),
                          leading: Icon(Icons.shopping_cart),
                          onTap: () =>
                              Navigator.of(context).pushNamed('/CartScreen'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('Information', style: kTextStyleMedium),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    UserListTile(
                      title: 'Name', subTitle: '${_auth.currentUser.displayName == null ? 'Guest' : _auth.currentUser.displayName}', index: 1,
                    ),
                    UserListTile(
                        title: 'Email', subTitle: '${ _auth.currentUser.email}', index: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('Settings', style: kTextStyleMedium),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Material(
                      child: InkWell(
                        splashColor: Theme.of(context).splashColor,
                        child: ListTile(
                          title: Text('Sign out'),
                          subtitle: Text(''),
                          leading: Icon(Icons.logout),
                          onTap: () async {
                            final didRequestSignOut = await
                            showAlertDialog(context,
                                title: 'Logout',
                                content:
                                    'Are you sure that you want to logout?',
                                defaultActionText: 'Logout',
                                cancelActionText: 'Cancel'); if (didRequestSignOut == true) {
                                  final googleSignIn = GoogleSignIn();
                                  await googleSignIn.signOut();
                                  final facebookLogin = FacebookLogin();
                                  await facebookLogin.logOut();
                                  await FirebaseAuth.instance.signOut();
                            }
                          },
                        ),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
        /*_buildFab(),*/
      ]),
    );
  }
}

class UserListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  int index;
  final Function function;

  UserListTile({this.title, this.subTitle, this.index, this.function});

  List<IconData> _userTileIcons = [
    Icons.email,
    Icons.person,
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
          onTap: function,
        ),
      ),
    );
  }
}
