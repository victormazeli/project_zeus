// import 'package:flutter/material.dart';
// import 'package:project_zeus/providers/authentication.dart';
// import '../widgets/drawer.dart';
// import '../models/store.dart';
// import '../models/user_auth.dart';
// import '../providers/store.dart';
// import 'package:provider/provider.dart';
// import '../utility/shared_prefs.dart';

// class CustomerListScreen extends StatefulWidget {
//   static const routeName = '/customer-list';

//   @override
//   _CustomerListScreenState createState() => _CustomerListScreenState();
// }

// class _CustomerListScreenState extends State<CustomerListScreen> {
//   List<CustomerList> selectedlist;
//   Future<GetCustomerData> customers;
//    Future<User> user;
//   // int _value = 0;
//   bool is_selected = false;

//   // getAppbar() {
//   //   return AppBar(
//   //     title: Text("${selectedlist.length} item selected"),
//   //     actions: <Widget>[
//   //       IconButton(
//   //           icon: Icon(Icons.delete_outline, size: 32),
//   //           onPressed: () {
//   //             setState(() {
//   //               for (var i = 0; i < selectedlist.length; i++) {
//   //                 Provider.of<StoreProduct>(context, listen: false)
//   //                     .getcustomers(selectedlist[i].id);
//   //               }
//   //               selectedlist = List();
//   //             });
//   //           }),
//   //     ],
//   //   );
//   // }

//   @override
//   void initState() {
//     customers = Provider.of<StoreProduct>(context, listen: false)
//         .getcustomers(sharedPrefs.storeid);

//     super.initState();
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('CUSTOMER LIST'),
//         actions: <Widget>[
//           IconButton(icon: Icon(Icons.search), onPressed: () {}),
//           IconButton(
//               icon: Icon(Icons.settings_input_composite), onPressed: () {})
//         ],
//       ),
//       body: Padding(
//           padding: EdgeInsets.only(left: 15, right: 15, top: 15),
//           child: FutureBuilder<GetCustomerData>(
//               future: customers,
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return ListView.builder(
//                       itemCount: snapshot.data.customer.length,
//                       itemBuilder: (ctx, index) {
//                         //return list tile
//                         return ListTile(
//                           title: Text('${snapshot.data.products[index].name}'),
//                           // subtitle: Text(
//                           //     '${snapshot.data.products[index].description}'),
//                           leading: CircleAvatar(
//                             child: Image.network(
//                                 '${snapshot.data.products[index].image}'),
//                           ),
//                           // selected: is_selected,
//                           key: Key(snapshot.data.customer[index].id.toString()),
//                           // onLongPress: () {
//                           //   setState(() {
//                           //     is_selected = !is_selected;
//                           //     if (is_selected) {
//                           //       selectedlist.add(snapshot.data.customer[index]);
//                           //     } else {
//                           //       selectedlist
//                           //           .remove(snapshot.data.customer[index]);
//                           //     }
//                           //   });
//                           // },
//                         );
//                       });
//                 } else if (snapshot.hasError) {
//                   return Center(
//                     child: Text('${snapshot.error}'),
//                   );
//                 } else {
//                   return CircularProgressIndicator();
//                 }
//               })),
//       drawer: Drawerwidget(),
//     );
//   }
// }
