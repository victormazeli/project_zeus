import 'package:flutter/material.dart';
import 'package:project_zeus/screens/add_product_screen.dart';
import 'package:project_zeus/screens/filter_screen.dart';
import 'package:project_zeus/widgets/product_detail.dart';
import 'package:project_zeus/utility/shared_prefs.dart';
import './screens/store_info_screen.dart';
import './screens/marchant_home_screen.dart';
import './screens/marchant_login_screen.dart';
import './screens/marchant_welcome_screen.dart';
import 'screens/marchant_register_screen.dart';
import './screens/profile_screen.dart';
import './screens/acct_info.dart';
import './screens/product_screen.dart';
import './screens/orders_screen.dart';
import './screens/create_store_screen.dart';
import 'package:provider/provider.dart';
import './providers/store.dart';
import './providers/authentication.dart';
// import './screens/customer_list_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPrefs.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'Zeus',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.white,
          fontFamily: 'Segoe UI',
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: WelcomeScreen(),
        routes: {
          MarchantScreen.routeName: (ctx) => ChangeNotifierProvider(create: (_) => Auth(), child: MarchantScreen(),) ,
          HomeScreen.routeName: (ctx) => HomeScreen(),
          CreateStoreScreen.routeName: (ctx) => CreateStoreScreen(),
          RegistrationScreen.routeName: (ctx) => ChangeNotifierProvider(create: (_) => Auth(), child: RegistrationScreen(),),
          Profile.routeName: (ctx) => Profile(),
          AccountInfo.routeName: (ctx) => AccountInfo(),
          ProductScreen.routeName: (ctx) => ChangeNotifierProvider(create: (_) => StoreProduct(), child: ProductScreen(),),  
          OrdersScreen.routeName: (ctx) => ChangeNotifierProvider(create: (_) => StoreProduct(), child: OrdersScreen(),),
          StoreDetailScreen.routeName: (ctx) => StoreDetailScreen(),
          AddProductScreen.routeName: (ctx) => ChangeNotifierProvider(create: (_) => StoreProduct(), child: AddProductScreen(),), 
          FilterScreen.routeName: (ctx) => FilterScreen(),
          ProductDetail.routeName:(ctx) => ProductDetail(),
        },
      );

  }
}
