import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/store_orders.dart';
import '../models/product.dart';
import '../models/store.dart';

class StoreProduct with ChangeNotifier {
  Future<Product> addproduct(String name, int category, String description,
      String price, String quantity, int shop, File image, String other) async {
    if (category = null) {
      const url = 'https://zeus-apiv1.herokuapp.com/store/add_product/';
      final body = {
        'name': name,
        'category': other,
        'description': description,
        'price': price,
        'quantity': quantity,
        'image': image,
        'shop': shop
      };
      final response = await http.post(url, body: body);
      if (response.statusCode == 201) {
        return Product.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to add products');
      }
    } else {
      const url = 'https://zeus-apiv1.herokuapp.com/store/add_product/';
      final body = {
        'name': name,
        'category': category,
        'description': description,
        'price': price,
        'quantity': quantity,
        'image': image,
        'shop': shop
      };
      final response = await http.post(url, body: body);
      if (response.statusCode == 201) {
        return Product.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to add products');
      }
    }
  }

  Future<Product> updateproduct(
      int id,
      String name,
      String category,
      String description,
      Double price,
      Double quantity,
      int shop,
      File image) async {
    final url = 'https://zeus-apiv1.herokuapp.com/store/product_update/$id/';
    final body = {
      'name': name,
      'category': category,
      'description': description,
      'price': price,
      'quantity': quantity,
      'image': image,
      'shop': shop
    };
    final response = await http.put(url, body: body);
    if (response.statusCode == 201) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update products');
    }
  }

  Future deleteproduct(int id) async {
    final url = 'https://zeus-apiv1.herokuapp.com/store/product_delete/$id/';

    final response = await http.delete(url);
    if (response.statusCode == 204) {
      return 'product deleted successfully';
    } else {
      throw Exception('Failed to delete products');
    }
  }

  Future<GetData> getproduct(int id) async {
    final url = 'https://zeus-apiv1.herokuapp.com/store/store_product/$id/';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //ensure to return a list of product
      return GetData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get products');
    }
  }


 Future<GetData> productdetail(int id) async {
    final url = 'https://zeus-apiv1.herokuapp.com/store/product_detail/$id/';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //ensure to return a list of product
      return GetData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get products');
    }
  }

  Future<GetData> getproductbycategory(int id) async {
    final url =
        'https://zeus-apiv1.herokuapp.com/store/product_by_category/$id/';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //ensure to return a list of product
      return GetData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get products');
    }
  }

  Future<Category> getcategory() async {
    final url = 'https://zeus-apiv1.herokuapp.com/store/get_categories/';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //ensure to return a list of product
      return Category.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get categories');
    }
  }

  // Future<Store> createstore(int id, String name, String schema, int phoneno,
  //     String address, String city, String state, File logo) async {
  //   const url = 'https://zeus-apiv1.herokuapp.com/store/add_product/';
  //   final body = {
  //     'name': name,
  //     'schema_name': schema,
  //     'phone_no': phoneno,
  //     'address': address,
  //     'city': city,
  //     'state': state,
  //     'logo': logo,
  //     'user': id
  //   };
  //   final response = await http.post(url, body: body);
  //   if (response.statusCode == 201) {
  //     return Store.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to create store');
  //   }
  // }

  Future<Store> createstore(int id, String name) async {
    const url = 'https://zeus-apiv1.herokuapp.com/store/add_product/';
    final body = {'name': name, 'schema_name': name, 'user': id};
    final response = await http.post(url, body: body);
    if (response.statusCode == 201) {
      return Store.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create store');
    }
  }
  // enusre to add endpoint to update store name
  // ensure to create a random string schema for tenants

  Future<Store> updatetore(int id, String name, int phoneno,
      String address, String city, String state, File logo, int storeid) async {
    final url =
        'https://zeus-apiv1.herokuapp.com/store/update_product/$storeid/';
    final body = {
      'name': name,
      'schema_name': name,
      'phone_no': phoneno,
      'address': address,
      'city': city,
      'state': state,
      'logo': logo,
      'user': id
    };
    final response = await http.put(url, body: body);
    if (response.statusCode == 201) {
      return Store.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create store');
    }
  }

  Future<Store> getstore(int id) async {
    final url = 'https://zeus-apiv1.herokuapp.com/store/store_detail/$id/';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //ensure to return a list of product
      return Store.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get store');
    }
  }

  Future<StoreDomain> createdomain(String name, int tenant) async {
    var host = ".cyphertech.com.ng";
    const url = 'https://zeus-apiv1.herokuapp.com/store/product_image_upload/';
    final body = {'domain': name + host, 'tenant': tenant, 'is_primary': true};
    final response = await http.post(url, body: body);

    if (response.statusCode == 201) {
      return StoreDomain.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create domain');
    }
  }

  Future<StoreDomain> getstoredomain(int id) async {
    final url = 'https://zeus-apiv1.herokuapp.com/store/get_store_domain/$id/';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //ensure to return a list of product
      return StoreDomain.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get domain');
    }
  }

  Future<Order> createorder(int user, int status, Double total) async {
    const url = 'https://zeus-apiv1.herokuapp.com/store/create_order/';
    final body = {
      'user': user,
      'status': status,
      'total': total,
    };
    final response = await http.post(url, body: body);
    if (response.statusCode == 201) {
      return Order.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Create order');
    }
  }

  Future<OrderItem> addorderitem(
      int orderid, int products, int quantity) async {
    const url = 'https://zeus-apiv1.herokuapp.com/store/add_order_item/';
    final body = {
      'order': orderid,
      'products': products,
      'quantity': quantity,
    };
    final response = await http.post(url, body: body);
    if (response.statusCode == 201) {
      return OrderItem.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add items');
    }
  }

  Future<GetCustomerData> getcustomers(int id) async {
    final url = 'https://zeus-apiv1.herokuapp.com/store/store_product/$id/';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //ensure to return a list of product
      return GetCustomerData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get customer list');
    }
  }

  Future<GetOrderData> getorder(int id) async {
    final url = 'https://zeus-apiv1.herokuapp.com/store/orders/$id/';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //ensure to return a list of product
      return GetOrderData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get orders');
    }
  }

  Future<OrderStatus> getorderstatus() async {
    final url = 'https://zeus-apiv1.herokuapp.com/store/order_status/';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //ensure to return a list of product
      return OrderStatus.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get order status');
    }


  }


    Future<GetOrderData> getorderbystatus(int id) async {
      final url = 'https://zeus-apiv1.herokuapp.com/store/orders_by_status/$id/';
      final response = await http.get(url);
      if (response.statusCode == 200) {
        //ensure to return a list of product
        return GetOrderData.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to get orders by status');
      }
    }

}
