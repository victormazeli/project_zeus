import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_select/smart_select.dart';
import 'package:search_page/search_page.dart';
import '../models/store_orders.dart';
import '../providers/store.dart';
import '../utility/shared_prefs.dart';
import '../widgets/drawer.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/orders';

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int _value = 0;
  List<Order> selectedlist;
  List<Order> storeorderlist;
  Future<GetOrderData> storeorder;
  Future<GetOrderData> orderstatus;
  bool isselected = false;
  int _newvalue;
  bool isfiltered;

  _filterbutton() {
    return FutureBuilder(
        future: orderstatus,
        builder: (context, snapshot) {
          return SmartSelect.single(
            modalType: S2ModalType.popupDialog,
            modalFilter: true,
            modalTitle: 'Filter',
            value: _newvalue,
            onChange: (state) {
              setState(() {
                _newvalue = state.value;
                if (_newvalue != null) {
                  isfiltered != isfiltered;
                }
              });
            },
            choiceItems: S2Choice.listFrom<String, dynamic>(
              source: snapshot.data,
              value: (index, item) => item['id'],
              title: (index, item) => item['status'],
            ),
            choiceConfig: S2ChoiceConfig(
                layout: S2ChoiceLayout.grid,
                type: S2ChoiceType.chips,
                style: S2ChoiceStyle(showCheckmark: true)),
          );
        });
  }

  _searchbutton() {
    showSearch(
        context: context,
        delegate: SearchPage<Order>(
          builder: (product) => ListTile(
            title: Text('${product.id}'),
            subtitle: Text('Status: ${product.status}'),
            trailing: Text('N${product.total}'),
          ),
          filter: (product) => ['${product.id}'],
          items: storeorderlist,
          searchLabel: 'Search orders',
          failure: Center(
            child: Text('No order found'),
          ),
        ));
  }

  getAppbar() {
    return AppBar(
      title: Text("${selectedlist.length} item selected"),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.delete_outline, size: 32),
            onPressed: () {
              setState(() {
                for (var i = 0; i < selectedlist.length; i++) {
                  Provider.of<StoreProduct>(context, listen: false)
                      .getorder(selectedlist[i].id);
                }
                selectedlist = List();
              });
            }),
      ],
    );
  }

  @override
  void initState() {
    storeorder = Provider.of<StoreProduct>(context, listen: false)
        .getorder(sharedPrefs.storeid);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isselected
          ? getAppbar()
          : AppBar(
              title: Text('ORDERS'),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.delete_outline, size: 32),
                    onPressed: () {}),
                PopupMenuButton(
                  padding: EdgeInsets.zero,
                  offset: Offset(0, 100),
                  child: Icon(Icons.more_vert, size: 32),
                  itemBuilder: (context) => <PopupMenuEntry>[
                    // PopupMenuItem(
                    //   child: Container(
                    //     width: 180,
                    //     child: ListTile(
                    //       leading: Icon(Icons.settings_input_component),
                    //       title: Text('Create Order'),
                    //     ),
                    //   ),
                    //   value: 1,
                    // ),
                    PopupMenuItem(
                      child: Container(
                        width: 180,
                        child: ListTile(
                          leading: Icon(Icons.settings_input_component),
                          title: Text('Filter'),
                        ),
                      ),
                      value: 2,
                    ),
                    PopupMenuItem(
                      child: Container(
                        width: 180,
                        child: ListTile(
                          leading: Icon(Icons.search),
                          title: Text('Search'),
                        ),
                      ),
                      value: 3,
                    ),
                  ],
                  onSelected: (value) {
                    setState(() {
                      _value = value;
                    });
                    switch (_value) {
                      // case 1:
                      //   Navigator.pushNamed(context, '/create-order_screen');
                      //   break;
                      case 2:
                        _filterbutton();
                        break;

                      case 3:
                        _searchbutton();
                        break;

                      default:
                        Navigator.pushNamed(context, '/orders');
                    }
                  },
                ),
              ],
            ),
      body: isfiltered ?
       Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: FutureBuilder<GetOrderData>(
              future: storeorder,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.orders.length,
                      itemBuilder: (ctx, index) {
                        storeorderlist.add(snapshot.data.orders[index]);
                        //return list tile
                        return ListTile(
                          title: Text(
                              '${snapshot.data.orders[index].id}pcs in stock'),
                          subtitle:
                              Text('${snapshot.data.orders[index].status}'),
                          trailing: Text(
                              '${snapshot.data.orders[index].total} items'),
                          selected: isselected,
                          key: Key(snapshot.data.orders[index].id.toString()),
                          onLongPress: () {
                            setState(() {
                              isselected = !isselected;
                              if (isselected) {
                                selectedlist.add(snapshot.data.orders[index]);
                              } else {
                                selectedlist
                                    .remove(snapshot.data.orders[index]);
                              }
                            });
                          },
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => ProductDetail(),
                            //         settings: RouteSettings(
                            //             arguments:
                            //                 snapshot.data.orders[index].id)));
                          },
                        );
                      });
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }))
       : Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: FutureBuilder<GetOrderData>(
              future: storeorder,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.orders.length,
                      itemBuilder: (ctx, index) {
                        storeorderlist.add(snapshot.data.orders[index]);
                        //return list tile
                        return ListTile(
                          title: Text(
                              '${snapshot.data.orders[index].id}pcs in stock'),
                          subtitle:
                              Text('${snapshot.data.orders[index].status}'),
                          trailing: Text(
                              '${snapshot.data.orders[index].total} items'),
                          selected: isselected,
                          key: Key(snapshot.data.orders[index].id.toString()),
                          onLongPress: () {
                            setState(() {
                              isselected = !isselected;
                              if (isselected) {
                                selectedlist.add(snapshot.data.orders[index]);
                              } else {
                                selectedlist
                                    .remove(snapshot.data.orders[index]);
                              }
                            });
                          },
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => ProductDetail(),
                            //         settings: RouteSettings(
                            //             arguments:
                            //                 snapshot.data.orders[index].id)));
                          },
                        );
                      });
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              })),
      drawer: Drawerwidget(),
    );
  }
}
