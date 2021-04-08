class MyListModel {
  String name;
  bool like;

  MyListModel({this.name, this.like});

  factory MyListModel.fromJson(Map<String, dynamic> json) {
    return MyListModel(
      name: json['name'],
      like: json['like'],
    );
  }
}
