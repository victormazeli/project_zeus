class Order {
  final int id;
  final int cart;
  final int total;
  final int shippingcost;
  final int user;
  final bool cancelled;
  final bool open;
  final bool upaid;
  final DateTime date;

  Order({
    this.id, 
    this.cart, 
    this.total, 
    this.shippingcost, 
    this.user, 
    this.cancelled, 
    this.open, 
    this.upaid, 
    this.date
    });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        id: json['id'],
        status: json['status'],
        total: json['total'],
        shop: json['shop'],
        user: json['user'],
        date: json['date']
        
        );

  }
}

class OrderStatus {
  final int id;
  final String status;

  OrderStatus({this.id, this.status});

  factory OrderStatus.fromJson(Map<String, dynamic> json) {
    return OrderStatus(
      id: json['id'],
      status: json['status'],
    );
  }
}

class OrderItem {
  final int id;
  final int orderid;
  final int products;
  final int quantity;

  OrderItem({this.id, this.orderid, this.products, this.quantity});

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
        id: json['id'],
        orderid: json['order'],
        products: json['products'],
        quantity: json['quantity']);
  }
}

class GetOrderData {
  final List<Order> orders;

  GetOrderData({this.orders});

  factory GetOrderData.fromJson(List<dynamic> json) {
    List<Order> allorders = List<Order>();
    allorders = json.map((e) => Order.fromJson(e)).toList();

    return GetOrderData(
      orders: allorders,
    );
  }
}
