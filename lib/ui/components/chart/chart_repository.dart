import 'package:lora_app/services/get_data_json.dart';
import 'package:lora_app/ui/components/chart/chart_model.dart';

class ChartRepository {
  final date = DateTime.now();

  Future<List<ChartModel>> threeMonth() async {
    List<ChartModel> data = await LoadJson().myPortofolio();
    List<ChartModel> filter = [];

    var now_3m = new DateTime(date.year, date.month - 3, date.day);

    filter.addAll(data.where((element) {
      final date = element.spotDateYmd;
      return now_3m.isBefore(date);
    }));

    return filter;
  }

  Future<List<ChartModel>> oneDay() async {
    List<ChartModel> data = await LoadJson().myPortofolio();
    var now_1d = new DateTime(date.year, date.month, date.day - 1);

    List<ChartModel> filter = [];

    filter.addAll(data.where((element) {
      final date = element.spotDateYmd;
      return now_1d.isBefore(date);
    }));

    return filter;
  }

  Future<List<ChartModel>> oneWeek() async {
    List<ChartModel> data = await LoadJson().myPortofolio();
    var now_1w = date.subtract(Duration(days: 7));

    List<ChartModel> filter = [];

    filter.addAll(data.where((element) {
      final date = element.spotDateYmd;
      return now_1w.isBefore(date);
    }));
    print(filter.length);

    return filter;
  }

  Future<List<ChartModel>> oneMonth() async {
    List<ChartModel> data = await LoadJson().myPortofolio();
    var now_1m = new DateTime(date.year, date.month - 1, date.day);

    List<ChartModel> filter = [];

    filter.addAll(data.where((element) {
      final date = element.spotDateYmd;
      return now_1m.isBefore(date);
    }));
    return filter;
  }

  Future<List<ChartModel>> oneYear() async {
    List<ChartModel> data = await LoadJson().myPortofolio();
    var now_1y = new DateTime(date.year - 1, date.month, date.day);

    List<ChartModel> filter = [];

    filter.addAll(data.where((element) {
      final date = element.spotDateYmd;
      return now_1y.isBefore(date);
    }));
    return filter;
  }

  Future<List<ChartModel>> all() async {
    List<ChartModel> data = await LoadJson().myPortofolio();

    return data;
  }
}
