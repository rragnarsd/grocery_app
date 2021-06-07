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
 /* bool _value = false;*/
  ScrollController _scrollController;
  final _auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  var top = 0.0;
  String _uid;
  String _email = '';

  @override
  void initState() {
    super.initState();
    getData();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
  }


  void getData() async {
    User user = _auth.currentUser;
    _uid = user.uid;
    //Fetch data with Documentsnapshot
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc('id').get();
    //Need to call setState to refresh the information
    setState(() {
      _email = user.email;
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
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  _email == null ? 'Guest' : _email,
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
                        title: 'Email', subTitle: '$_email', index: 0,
                    ),
                    UserListTile(
                        title: 'Phone', subTitle: '666-6666', index: 1,
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
        _buildFab(),
      ]),
    );
  }

  Widget _buildFab() {
    //starting fab position
    final double defaultTopMargin = 200.0 - 4.0;
    //pixels from top where scaling should start
    final double scaleStart = 160.0;
    //pixels from top where scaling should end
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }
    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          backgroundColor: Colors.indigo,
          heroTag: "btn1",
          onPressed: () {},
          child: Icon(Icons.camera_alt_outlined),
        ),
      ),
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
    Icons.phone,
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
