import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:lora_app/ui/components/my_league/my_league_model.dart';
import 'package:lora_app/ui/components/my_list/my_list_model.dart';
import 'package:lora_app/ui/components/chart/chart_model.dart';
import 'package:lora_app/ui/components/my_watch_list/my_watch_list_model.dart';

class LoadJson {
  myPortofolio() async {
    final data =
        json.decode(await rootBundle.loadString('assets/data/data_chart.json'));

    List<ChartModel> result =
        List<ChartModel>.from(data.map((x) => ChartModel.fromJson(x)));

    return result;
  }

  myLeague() async {
    final data =
        json.decode(await rootBundle.loadString('assets/data/my_league.json'));

    List<MyLeagueModel> result =
        List<MyLeagueModel>.from(data.map((x) => MyLeagueModel.fromJson(x)));

    return result;
  }

  myList() async {
    final data =
        json.decode(await rootBundle.loadString('assets/data/my_list.json'));

    List<MyListModel> result =
        List<MyListModel>.from(data.map((x) => MyListModel.fromJson(x)));

    return result;
  }

  myWatchList() async {
    final data = json
        .decode(await rootBundle.loadString('assets/data/my_watch_list.json'));

    List<MyWatchListModel> result = List<MyWatchListModel>.from(
        data.map((x) => MyWatchListModel.fromJson(x)));

    return result;
  }
}
