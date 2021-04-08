import 'package:lora_app/services/get_data_json.dart';

import 'my_league_model.dart';

class MyLeagueRepository {
  Future<List<MyLeagueModel>> getData() async {
    List<MyLeagueModel> data = await LoadJson().myLeague();

    data.sort((a, b) => b.pnl.compareTo(a.pnl));
    // List<MyLeagueModel> dataFilter = [];
    // dataFilter
    //     .addAll(data.where((element) => element.username == 'Me').toList());
    // dataFilter.addAll(data.take(3).toList());
    // dataFilter.sort((a, b) => b.pnl.compareTo(a.pnl));
    return data;
  }
}
