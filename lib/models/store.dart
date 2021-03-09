import 'dart:io';
class Store {
  final int id;
  final String storename;
  final String storeschemaname;
  final int phoneno;
  final String address;
  final String state;
  final String city;
  final File logo;
  final int user;

  Store(
      {this.id,
      this.storename,
      this.storeschemaname,
      this.phoneno,
      this.address,
      this.state,
      this.city,
      this.logo,
      this.user});

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
        id: json['id'],
        storename: json['name'],
        storeschemaname: json['schema_name'],
        phoneno: json['phone_no'],
        address: json['address'],
        state: json['state'],
        city: json['city'],
        logo: json['logo'],
        user: json['user']);
  }
}

class StoreDomain {
  final int id;
  final String domain;
  final int tenant;
  final bool isprimary;

  StoreDomain({this.id, this.domain, this.tenant, this.isprimary});

  factory StoreDomain.fromJson(Map<String, dynamic> json) {
    return StoreDomain(
        id: json['id'],
        domain: json['domain'],
        tenant: json['tenant'],
        isprimary: json['is_primary']);
  }
}

class CustomerList {
  final int id;
  final int storeid;
  final int userid;

  CustomerList({this.id, this.storeid, this.userid});

  factory CustomerList.fromJson(Map<String, dynamic> json) {
    return CustomerList(
        id: json['id'], storeid: json['shop'], userid: json['user']);
  }
}

class GetCustomerData {
  final List<CustomerList> customer;

  GetCustomerData({this.customer});

  factory GetCustomerData.fromJson(List<dynamic> json) {
    List<CustomerList> allcustomer = List<CustomerList>();
    allcustomer = json.map((e) => CustomerList.fromJson(e)).toList();

    return GetCustomerData(
      customer: allcustomer,
    );
  }
}

class Category {
  final String categoryname;

  Category({this.categoryname});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        categoryname: json['category_name']
        
        );
  }


}
