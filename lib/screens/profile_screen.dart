import 'package:flutter/material.dart';
import 'package:project_zeus/models/store.dart';
import 'package:project_zeus/screens/store_info_screen.dart';

class Profile extends StatelessWidget {
  static const routeName = '/profile-screen';
 
  @override
  Widget build(BuildContext context) {
     final Store store = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).primaryColor, elevation: 0,),
      body:  Column(
      children: <Widget>[
        Container(
          width: 360,
          height: 280,
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white10,
                child: store.logo !=null ? Image.network('${store.logo}') 
                :Image.asset('assets/images/Logo Upload.png'),
                radius: 80,
              ),
              Text('${store.storename}', style: TextStyle(fontFamily: 'Segoe UI', fontSize: 36, fontWeight: FontWeight.w600, color: Theme.of(context).accentColor), textAlign: TextAlign.center,),
              // Text('ChucksClothes@gmail.com', style: TextStyle(fontFamily: 'Segoe UI', fontSize: 12, color: Theme.of(context).accentColor), textAlign: TextAlign.center),
             
            ],),
            ),
        Container(
          margin: EdgeInsets.only(top: 10,left: 10, right: 10),
          child: Column(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)) ),
                elevation: 4,
                child: ListTile(leading: Text('Reset password', style: TextStyle(fontFamily: 'Segoe UI', fontSize: 13, fontWeight: FontWeight.w600), ), trailing: Icon(Icons.arrow_right),
                 onTap: () {
                   Navigator.pushNamed(context, '/acct-info');
                 },),),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)) ),
                elevation: 4,
                child: ListTile(
                  leading: Text(
                    'Store Details', 
                    style: TextStyle(
                      fontFamily: 'Segoe UI', 
                      fontSize: 13, 
                      fontWeight: FontWeight.w600), ), 
                      trailing: Icon(Icons.arrow_right),
                       onTap: () => Navigator.push(context, 
                       MaterialPageRoute(
                         builder: (context) => StoreDetailScreen(),
                         settings: RouteSettings(arguments: store.id)
                       )
                       ),
                       ) ,
                       ), 
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)) ),
                elevation: 4,
                child: ListTile(leading: Text('Payement Option', style: TextStyle(fontFamily: 'Segoe UI', fontSize: 13, fontWeight: FontWeight.w600), ), trailing: Icon(Icons.arrow_right),) ,)
            ],),),
      ]));
  }
}