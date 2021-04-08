class MyLeagueModel {
  String username;
  double pnl;

  MyLeagueModel({this.username, this.pnl});

  factory MyLeagueModel.fromJson(Map<String, dynamic> json) => MyLeagueModel(
        pnl: json['pnl'].toDouble(),
        username: json['username'],
      );
}
