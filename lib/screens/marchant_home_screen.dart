import 'package:flutter/material.dart';
import 'package:project_zeus/providers/store.dart';
import 'package:provider/provider.dart';
import '../widgets/drawer.dart';
import '../utility/shared_prefs.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future storedetail;

  // void getpref() {
  //   sharedPrefs.storeid;
  //   sharedPrefs.userid;
  //   sharedPrefs.token;
  // }

  // @override
  // void initState() {
  //   storedetail = Provider.of<StoreProduct>(context).getstore(sharedPrefs.storeid);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'ZEUS',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        drawer: Drawerwidget(),
        body: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Get Started',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Segoe UI',
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                      Text(
                        'Set up your store fully',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Segoe UI',
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Divider(
                      color: Colors.grey,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Icon(Icons.check_circle_outline),
                          Icon(Icons.check_circle_outline),
                          Icon(Icons.check_circle_outline),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Payement option'),
                    Text('Add product'),
                    Text('Visit store'),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 0),
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.only(top: 49, bottom: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 0)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Orders',
                                style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal),
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_forward),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/orders');
                                },
                                color: Theme.of(context).primaryColor,
                              )
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Text('2020'),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(Icons.date_range)
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 37, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      height: 91,
                                      width: 4,
                                      child: Container(
                                        width: 4,
                                        height: 40,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Text('Jan')
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      height: 91,
                                      width: 4,
                                      child: Container(
                                        width: 4,
                                        height: 40,
                                        color: Colors.amber,
                                      ),
                                    ),
                                    Text('Feb')
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      height: 91,
                                      width: 4,
                                      child: Container(
                                        width: 4,
                                        height: 40,
                                        color: Colors.indigo,
                                      ),
                                    ),
                                    Text('Mar')
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      height: 91,
                                      width: 4,
                                      child: Container(
                                        width: 4,
                                        height: 40,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Text('Apr')
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      height: 91,
                                      width: 4,
                                      child: Container(
                                        width: 4,
                                        height: 40,
                                        color: Colors.amber,
                                      ),
                                    ),
                                    Text('May')
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      height: 91,
                                      width: 4,
                                      child: Container(
                                        width: 4,
                                        height: 40,
                                        color: Colors.indigo,
                                      ),
                                    ),
                                    Text('June')
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      height: 91,
                                      width: 4,
                                      child: Container(
                                        width: 4,
                                        height: 40,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Text('July')
                                  ],
                                ),
                              ],
                            ),
                          )
                        ]),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {},
                      child: Text('Open'),
                      color: Colors.red,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text('Completed'),
                      color: Colors.amber,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text('Cancelled'),
                      color: Colors.indigo,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Sales',
                          style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              color: Theme.of(context).primaryColor),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'sept 2020',
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 150),
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.arrow_drop_up,
                                    color: Colors.green,
                                  ),
                                  Icon(Icons.arrow_drop_down,
                                      color: Colors.green),
                                ],
                              ),
                            ),
                            Text(
                              '0.00%',
                              style: TextStyle(color: Colors.green),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Icon(
                              Icons.shopping_basket,
                              color: Theme.of(context).primaryColor,
                              size: 34,
                            ),
                            Text(
                              'Products',
                              style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  color: Theme.of(context).primaryColor),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 1,
                          height: 70,
                          child: Container(
                            color: Colors.grey,
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            Navigator.pushNamed(context, '/add-product_screen');
                          },
                          child: Column(
                            children: <Widget>[
                              Text(
                                '+Add',
                                style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal),
                              ),
                              Text(
                                'Product',
                                style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Customers',
                              style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal),
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_forward),
                              onPressed: () {
                                Navigator.pushNamed(context, '/customer-list');
                              },
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 25,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              CircleAvatar(
                                  backgroundColor: Colors.grey, radius: 25),
                              SizedBox(
                                width: 15,
                              ),
                              CircleAvatar(
                                  backgroundColor: Colors.grey, radius: 25),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Total Number of Customers'),
                        Text(
                          '10 persons',
                          style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
