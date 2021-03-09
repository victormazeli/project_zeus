import 'package:flutter/material.dart';
import 'package:project_zeus/models/product.dart';
import 'package:project_zeus/widgets/product_detail.dart';
import 'package:project_zeus/utility/shared_prefs.dart';
import 'package:smart_select/smart_select.dart';
import '../widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:search_page/search_page.dart';
import '../providers/store.dart';

class ProductScreen extends StatefulWidget {
  static const routeName = '/product';

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> selectedlist;
  List<Product> storeproduct;
  Future<GetData> _storeproduct;
  Future<GetData> _storecategory;
  String name;
  int _value = 0;
  int _newvalue;
  bool is_selected = false;
  bool is_filtered = false;

  _filterbutton(BuildContext context) {
    return FutureBuilder(
        future: _storecategory,
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
                  is_filtered != is_filtered;
                }
              });
            },
            choiceItems: S2Choice.listFrom<String, dynamic>(
              source: snapshot.data,
              value: (index, item) => item['id'],
              title: (index, item) => item['category_name'],
            ),
            choiceConfig: S2ChoiceConfig(
                layout: S2ChoiceLayout.grid,
                type: S2ChoiceType.chips,
                style: S2ChoiceStyle(showCheckmark: true)),
          );
        });
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
                      .deleteproduct(selectedlist[i].id);
                }
                selectedlist = List();
              });
            }),
      ],
    );
  }

  _searchbutton(BuildContext context) {
    showSearch(
        context: context,
        delegate: SearchPage<Product>(
          builder: (product) => ListTile(
            title: Text(product.name),
            subtitle: Text('${product.quantity}pcs in stock'),
            leading: CircleAvatar(
              child: Image.network('${product.image}'),
            ),
            trailing: Text('N${product.price}'),
          ),
          filter: (product) => [product.name],
          items: storeproduct,
          searchLabel: 'Search products',
          failure: Center(
            child: Text('No Product found'),
          ),
        ));
  }

  @override
  void initState() {
    _storeproduct = Provider.of<StoreProduct>(context, listen: false)
        .getproduct(sharedPrefs.storeid);

    _storecategory = Provider.of<StoreProduct>(context, listen: false)
        .getproductbycategory(_newvalue);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: is_selected
          ? getAppbar()
          : AppBar(
              title: Text('PRODUCTS'),
              actions: <Widget>[
                PopupMenuButton(
                  padding: EdgeInsets.zero,
                  offset: Offset(0, 100),
                  child: Icon(
                    Icons.more_vert,
                    size: 32,
                  ),
                  itemBuilder: (context) => <PopupMenuEntry>[
                    PopupMenuItem(
                      child: Container(
                        width: 180,
                        child: ListTile(
                          leading: Icon(Icons.cloud_upload),
                          title: Text('Add Product'),
                        ),
                      ),
                      value: 1,
                    ),
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
                      case 1:
                        Navigator.pushNamed(context, '/add-product_screen');
                        break;
                      case 2:
                        _filterbutton(context);
                        break;
                      case 3:
                        _searchbutton(context);
                        break;

                      default:
                        Navigator.pushNamed(context, '/product');
                    }
                  },
                ),
              ],
            ),
      body: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: is_filtered
              ? FutureBuilder<GetData>(
                  future: _storecategory,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.products.length,
                          itemBuilder: (ctx, index) {
                            //return list tile
                            return ListTile(
                              title:
                                  Text('${snapshot.data.products[index].name}'),
                              subtitle: Text(
                                  '${snapshot.data.products[index].quantity}pcs in stock'),
                              leading: CircleAvatar(
                                child: Image.network(
                                    '${snapshot.data.products[index].image}'),
                              ),
                              trailing: Text('N${snapshot.data.products[index].price}'),
                              selected: is_selected,
                              key: Key(
                                  snapshot.data.products[index].id.toString()),
                              onLongPress: () {
                                setState(() {
                                  is_selected = !is_selected;
                                  if (is_selected) {
                                    selectedlist
                                        .add(snapshot.data.products[index]);
                                  } else {
                                    selectedlist
                                        .remove(snapshot.data.products[index]);
                                  }
                                });
                              },
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductDetail(),
                                        settings: RouteSettings(
                                            arguments: snapshot
                                                .data.products[index].id)));
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
                  })
              : FutureBuilder<GetData>(
                  future: _storeproduct,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.products.length,
                          itemBuilder: (ctx, index) {
                            storeproduct.add(snapshot.data.products[index]);
                            return ListTile(
                              title:
                                  Text('${snapshot.data.products[index].name}'),
                              subtitle: Text(
                                  '${snapshot.data.products[index].description}'),
                              leading: CircleAvatar(
                                child: Image.network(
                                    '${snapshot.data.products[index].image}'),
                              ),
                              selected: is_selected,
                              key: Key(
                                  snapshot.data.products[index].id.toString()),
                              onLongPress: () {
                                setState(() {
                                  is_selected = !is_selected;
                                  if (is_selected) {
                                    selectedlist
                                        .add(snapshot.data.products[index]);
                                  } else {
                                    selectedlist
                                        .remove(snapshot.data.products[index]);
                                  }
                                });
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
