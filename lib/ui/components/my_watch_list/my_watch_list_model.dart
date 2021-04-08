class MyWatchListModel {
  String name;
  String hk;
  double pnl;
  int price;

  MyWatchListModel({this.name, this.hk, this.pnl, this.price});

  factory MyWatchListModel.fromJson(Map<String, dynamic> json) {
    return MyWatchListModel(
      name: json['name'],
      hk: json['hk'],
      pnl: json['pnl'].toDouble(),
      price: json['price'].toInt(),
    );
  }
}
