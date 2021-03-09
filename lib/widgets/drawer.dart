import 'package:flutter/material.dart';
import 'package:project_zeus/screens/profile_screen.dart';
import 'package:project_zeus/utility/shared_prefs.dart';
import 'package:project_zeus/providers/authentication.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/store.dart';
import 'package:provider/provider.dart';

class Drawerwidget extends StatefulWidget {
  @override
  _DrawerwidgetState createState() => _DrawerwidgetState();
}

class _DrawerwidgetState extends State<Drawerwidget> {
  Future<void> _launched;
  Future<Store> store;

// File croppedFile = await FlutterNativeImage.cropImage(file.path, originX, originY, width, height);

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          FutureBuilder<Store>(
            future: store,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DrawerHeader(
                  padding: EdgeInsets.only(top: 30, left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(42),
                        child: CircleAvatar(
                          radius: 42,
                          child: Image.network('${snapshot.data.logo}'),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10, left: 10),
                          child: Text(snapshot.data.storename))
                    ],
                  ),
                  decoration: BoxDecoration(color: Colors.grey),
                );
              } else if (snapshot.hasError) {
                return DrawerHeader(
                  padding: EdgeInsets.only(top: 30, left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 42,
                        backgroundColor: Colors.white,
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            'No data',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ))
                    ],
                  ),
                  decoration: BoxDecoration(color: Colors.grey),
                );
              } else {
                return DrawerHeader(
                  padding: EdgeInsets.only(top: 30, left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(42),
                        child: CircleAvatar(
                          radius: 42,
                          child: Image.asset('assets/images/zeus_logo.png'),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10, left: 10),
                          child: Text('Store name'))
                    ],
                  ),
                  decoration: BoxDecoration(color: Colors.grey),
                );
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/home-screen');
            },
          ),
          ListTile(
            leading: Icon(Icons.card_giftcard),
            title: Text('Products'),
            onTap: () {
              Navigator.pushNamed(context, '/product');
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Orders'),
            onTap: () {
              Navigator.pushNamed(context, '/orders');
            },
          ),
          ListTile(
            leading: Icon(Icons.link),
            title: Text('View website'),
            onTap: () {
              setState(() {
                _launched = _launchInBrowser(sharedPrefs.domainurl);
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Transactions'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Customer List'),
            onTap: () {
              Navigator.pushNamed(context, '/customer-list');
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Profile(),
                      settings: RouteSettings(arguments: store)));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text('Logout'),
            onTap: () {
              var token = sharedPrefs.token;
              Provider.of<Auth>(context).logout(token);
              sharedPrefs.deltoken();
              sharedPrefs.deluserid();
              sharedPrefs.delstoreid();
              Navigator.pushNamed(context, '/marchant-login');
            },
          ),
        ],
      ),
    );
  }
}
