import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_zeus/models/product.dart';
import 'package:project_zeus/utility/shared_prefs.dart';
import 'package:smart_select/smart_select.dart';
import 'package:provider/provider.dart';
import '../providers/store.dart';

class AddProduct extends StatefulWidget {
  static const routeName = '/add-product_screen';
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formkey = GlobalKey<FormState>();
  final _pagekey = GlobalKey<ScaffoldState>();
  final ImagePicker _picker = ImagePicker();
  PickedFile _imageFile;
  Future<GetData> _storecategory;
  int _newvalue;
  bool _isloading;
  TextEditingController _titlecontroller;
  TextEditingController _categorycontroller;
  TextEditingController _pricecontroller;
  TextEditingController _quantitycontroller;
  TextEditingController _descriptioncontroller;
  TextEditingController _othercontroller;

//  PickedFile _imageFile;
//  dynamic _pickImageError;

// final ImagePicker _picker = ImagePicker();

//   void _onImageButtonPressed(ImageSource source, {BuildContext context}) async {

//       await _displayPickImageDialog(context,
//           (double maxWidth, double maxHeight, int quality) async {
//         try {
//           final pickedFile = await _picker.getImage(
//             source: source,
//             maxWidth: maxWidth,
//             maxHeight: maxHeight,
//             imageQuality: quality,
//           );
//           setState(() {
//             _imageFile = pickedFile;
//           });
//         } catch (e) {
//           setState(() {
//             _pickImageError = e;
//           });
//         }
//       });
//     }
//   }

  void showErrorScreen(BuildContext context, String message) {
    setState(() {
      _isloading = false;
    });

    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(message),
              backgroundColor: Colors.white10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('ok'),
                  textColor: Colors.amber,
                )
              ],
            ));
  }

  _imgFromGallery() async {
    final pickedfile = await _picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 300,
        maxWidth: 300);

    setState(() {
      _imageFile = pickedfile;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          // after put safe area here for IoS
          return Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    _storecategory = Provider.of<StoreProduct>(context, listen: false)
        .getproductbycategory(_newvalue);
    _categorycontroller = TextEditingController(text: '');
    _descriptioncontroller = TextEditingController(text: '');
    _pricecontroller = TextEditingController(text: '');
    _quantitycontroller = TextEditingController(text: '');
    _titlecontroller = TextEditingController(text: '');

    super.initState();
  }

  @override
  void dispose() {
    _categorycontroller.dispose();
    _descriptioncontroller.dispose();
    _pricecontroller.dispose();
    _quantitycontroller.dispose();
    _titlecontroller.dispose();
    _othercontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 25),
              padding: EdgeInsets.all(36),
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 0.5, color: Colors.grey),
                      bottom: BorderSide(width: 1.5, color: Colors.grey))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Product Title',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Segoe UI',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400),
                  ),
                  TextFormField(
                    controller: _titlecontroller,
                    decoration: InputDecoration(labelText: 'Product Name'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter product name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _descriptioncontroller,
                    decoration: InputDecoration(labelText: 'Description'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter description';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 25),
              padding: EdgeInsets.all(36),
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 0.5, color: Colors.grey),
                      bottom: BorderSide(width: 1.5, color: Colors.grey))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Product Tag',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Segoe UI',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400),
                  ),
                  SmartSelect.single(
                    value: null,
                    onChange: null,
                    tileBuilder: (context, state) {
                      return FutureBuilder(
                          future: _storecategory,
                          builder: (context, snapshot) {
                            return SmartSelect.single(
                              modalType: S2ModalType.bottomSheet,
                              modalFilter: true,
                              modalTitle: 'Category',
                              value: _newvalue,
                              onChange: (state) {
                                setState(() {
                                  _newvalue = state.value;
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
                    },
                  ),
                  TextFormField(
                    controller: _othercontroller,
                    decoration: InputDecoration(labelText: 'Other tag'),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 25),
              padding: EdgeInsets.all(36),
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 0.5, color: Colors.grey),
                      bottom: BorderSide(width: 1.5, color: Colors.grey))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Product Price & Stock Quantity',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Segoe UI',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400),
                  ),
                  TextFormField(
                    controller: _pricecontroller,
                    decoration: InputDecoration(labelText: 'Price'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter price';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _quantitycontroller,
                    decoration:
                        InputDecoration(labelText: 'Quantity Available'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter quantity';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 25),
              padding: EdgeInsets.all(36),
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 0.5, color: Colors.grey),
                      bottom: BorderSide(width: 1.5, color: Colors.grey))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Product Image',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Segoe UI',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showPicker(context);
                    },
                    child: Center(
                        child: _imageFile != null
                            ? ClipRect(
                                child: Container(
                                  child: Align(
                                    alignment: Alignment.center,
                                    widthFactor: 0.6,
                                    heightFactor: 1.0,
                                    child: Image.file(File(_imageFile.path)),
                                  ),
                                ),
                              )
                            : Container(
                                width: 300,
                                height: 300,
                                margin: EdgeInsets.only(top: 13),
                                padding: EdgeInsets.all(25),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey,
                                        style: BorderStyle.solid,
                                        width: 0.5)),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Icon(
                                      Icons.cloud_upload,
                                      color: Colors.grey,
                                    ),
                                    Center(
                                        child: Text(
                                      'Click to Choose file',
                                      style: TextStyle(color: Colors.grey),
                                    ))
                                  ],
                                ))),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: FlatButton(
                padding: EdgeInsets.all(10),
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                    setState(() {
                      _isloading = false;
                    });
                  }
                  try {
                    final newproduct = await Provider.of<StoreProduct>(context)
                        .addproduct(
                            _titlecontroller.text,
                            _newvalue,
                            _descriptioncontroller.text,
                            _pricecontroller.text,
                            _quantitycontroller.text,
                            sharedPrefs.storeid,
                            File(_imageFile.path),
                            _othercontroller.text);
                    if (newproduct != null) {
                      Navigator.pop(context);
                    }
                  } catch (e) {
                    setState(() {
                      _isloading = false;
                    });
                    showErrorScreen(context, e.message);
                    _pagekey.currentState.showSnackBar(
                        SnackBar(content: Text('Could not add product')));
                  }
                },
                child: Text(
                  'SAVE',
                  style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600),
                ),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
