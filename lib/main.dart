import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/provider/cart_provider.dart';
import 'package:grocery_app/provider/fav_provider.dart';
import 'package:grocery_app/provider/products.dart';
import 'package:grocery_app/screens/cart.dart';
import 'package:grocery_app/screens/contact_screen.dart';
import 'package:grocery_app/screens/feeds.dart';
import 'package:grocery_app/screens/auth_screen.dart';
import 'package:grocery_app/screens/wishlist.dart';
import 'package:grocery_app/widgets/auth/auth_state.dart';
import 'package:grocery_app/widgets/auth/login_form.dart';
import 'package:grocery_app/widgets/auth/register_form.dart';
import 'package:grocery_app/widgets/categories_feeds.dart';
import 'package:grocery_app/screens/product_details.dart';
import 'package:provider/provider.dart';
import 'screens/bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Products()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Farmers Market',
        theme: ThemeData(
            primarySwatch: Colors.indigo,
           /* splashColor: Colors.indigoAccent.shade200,*/
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Lato',
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: Colors.indigoAccent.withOpacity(.6),
            cursorColor: Colors.indigoAccent.withOpacity(.6),
            selectionHandleColor: Colors.indigoAccent.withOpacity(1),
          )
        ),
        initialRoute: '/AuthState',
        routes: {
          '/BottomBarScreen': (context) => BottomBarScreen(),
          '/CartScreen': (context) => CartScreen(),
          '/WishListScreen': (context) => WishListScreen(),
          '/ProductDetails': (context) => ProductDetailsScreen(),
          '/FeedsScreen': (context) => FeedsScreen(),
          '/CategoriesFeedsScreen': (context) => CategoriesFeedsScreen(),
          '/AuthScreen': (context) => AuthScreen(),
          '/AuthState': (context) => AuthState(),
          '/SignInForm': (context) => SignInForm(),
          '/RegisterForm': (context) => RegisterForm(),
          '/ContactScreen': (context) => ContactScreen(),
        },
      ),
    );
  }
}
