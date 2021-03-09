import 'dart:io';
import 'dart:ffi';

class Product {
  final int id;
  final String name;
  final String description;
  final Double price;
  final Double quantity;
  final File image;
  final int sales;
  final String detail;
  final bool instock;

  Product(
      {this.id,
      this.name,
      this.detail,
      this.description,
      this.price,
      this.quantity,
      this.image,
      this.sales,
      this.instock
      });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        name: json['name'],
        detail: json['extra_detail'],
        description: json['description'],
        price: json['price'],
        quantity: json['quantity'],
        image: json['image'],
        sales: json['sales'],
        instock: json['in_stock'],
        );
        
  }
}

class GetData {
  final List<Product> products;

  GetData({this.products});

  factory GetData.fromJson(List<dynamic> json) {
    List<Product> allproduct = List<Product>();
    allproduct = json.map((e) => Product.fromJson(e)).toList();

    return GetData(
      products: allproduct,
    );
  }
}

class ProductImages {
  final int id;
  final int productid;
  final String imageurl;

  ProductImages({this.id, this.productid, this.imageurl});

  factory ProductImages.fromJson(Map<String, dynamic> json) {
    return ProductImages(
        id: json['id'], productid: json['product'], imageurl: json['image']);
  }
}
