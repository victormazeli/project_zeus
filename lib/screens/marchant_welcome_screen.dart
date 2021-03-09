import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: <Widget>[
           Expanded(
          child: Container(
            margin: EdgeInsets.only(top:64),
            child: Image(
                image: AssetImage('assets/images/zeus_logo.png'), alignment: Alignment.center,),
          )),
      
        Stack(
          alignment: AlignmentDirectional.center ,
          children: <Widget>[
              Image(
                  image: AssetImage('assets/images/Rectangle 12.png')),
            Container(
              margin: EdgeInsets.only(top:30),
              padding: EdgeInsets.all(15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                  FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Text('LOG IN', style: TextStyle(fontFamily: 'Segoe UI', fontSize: 16, fontStyle: FontStyle.normal, fontWeight: FontWeight.w600),),  onPressed: () {
                    Navigator.pushNamed(context, '/marchant-login');
                  }, 
                 color: Theme.of(context).accentColor, textColor: Theme.of(context).primaryColor,  padding: EdgeInsets.all(14.0),),
                  SizedBox(height: 24,),
                  OutlineButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Text('SIGN UP', style: TextStyle(fontFamily: 'Segoe UI', fontSize: 16, fontStyle: FontStyle.normal, fontWeight: FontWeight.w600),), 
                  textColor: Theme.of(context).accentColor, padding: EdgeInsets.all(14.0),
                  borderSide: BorderSide(color: Theme.of(context).accentColor, ),
                  highlightedBorderColor:Theme.of(context).accentColor ,
                   onPressed: () {
                    Navigator.pushNamed(context, '/register-form');} ),

                  SizedBox(height: 35,),
                 GestureDetector(child: Text('Home' , textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).accentColor, fontFamily: 'Segoe UI', fontSize: 12, fontStyle: FontStyle.normal, ),) , 
                 onTap: () {
                    Navigator.pushNamed(context, '/home-screen');
                 },),
                  ],
                ),
            ),  
        ],),
      ],),
    );
  }
}