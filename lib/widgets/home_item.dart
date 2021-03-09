import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 14),
          Text('Get Started', textAlign: TextAlign.center, style:TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.w600, fontFamily: 'Segoe UI'), ),
          Text('Set up your store fully', 
          textAlign: TextAlign.center, 
          style: TextStyle(color: Colors.grey, fontSize: 9, fontFamily: 'Segoe UI'),),
          SizedBox(height: 2),
          Image(image: AssetImage('assets/images/Group 6.png'), alignment: Alignment.center,fit: BoxFit.cover,),
          SizedBox(height: 32,),
          Container(
            width: 330,
            height: 147,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 20),
                    child: Text('Orders', style:TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.w600, fontFamily: 'Segoe UI'),)),
                  Container(
                    margin: EdgeInsets.only(left: 140),
                    child: Chip(label: Text('+ New Order', style: TextStyle(color: Theme.of(context).accentColor, fontSize: 10, fontFamily: 'Segoe UI'), ), 
                    backgroundColor: Theme.of(context).primaryColor,  padding: EdgeInsets.all(0), ),
                  ),
                ],),),
          ),
          SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: 155,
                    height: 135,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('Products', style: TextStyle(fontSize: 11, fontFamily: 'Segoe UI', fontWeight: FontWeight.w600),),
                          Icon(Icons.shopping_basket, size: 60, color: Theme.of(context).primaryColor,),
                          Divider(),
                          GestureDetector(
                            onTap: () => null,
                            child: Text('+ Add Products', style: TextStyle(fontSize: 10,  fontFamily: 'Segoe UI'),))
                        ],),),
                  ),

                        Container(
                          width: 155,
                          height: 135,
                          child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                          Text('Sales', style: TextStyle(fontFamily: 'Segoe UI',  fontWeight: FontWeight.w600, fontSize: 11),),
                          Text('N 0', style: TextStyle(fontFamily: 'Segoe UI', fontWeight: FontWeight.w600, fontSize: 36, color: Theme.of(context).primaryColor),),
                          Text('This Month', style: TextStyle(fontSize: 10,  fontFamily: 'Segoe UI')),
                      ],),),
                        ), 
                ],
              )
        ],),   
    );
  }
}