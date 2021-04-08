// To parse this JSON data, do
//
//     final myPortofolioModel = myPortofolioModelFromJson(jsonString);

import 'dart:convert';

List<ChartModel> myPortofolioModelFromJson(String str) =>
    List<ChartModel>.from(json.decode(str).map((x) => ChartModel.fromJson(x)));

String myPortofolioModelToJson(List<ChartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChartModel {
  ChartModel({
    this.ticker,
    this.spotDate,
    this.botType,
    this.optionType,
    this.monthToExp,
    this.spotPrice,
    this.potentialMaxLoss,
    this.targetedProfit,
    this.returnField,
    this.event,
    this.spotDateChart,
    this.spotDateYmd,
    this.color,
    this.adjPrice,
  });

  Ticker ticker;
  String spotDate;
  BotType botType;
  OptionType optionType;
  int monthToExp;
  double spotPrice;
  double potentialMaxLoss;
  double targetedProfit;
  double returnField;
  Event event;
  String spotDateChart;
  DateTime spotDateYmd;
  Color color;
  double adjPrice;

  factory ChartModel.fromJson(Map<String, dynamic> json) => ChartModel(
        ticker: tickerValues.map[json["ticker"]],
        spotDate: json["spot_date"],
        botType: botTypeValues.map[json["bot_type"]],
        optionType: optionTypeValues.map[json["option_type"]],
        monthToExp: json["month_to_exp"],
        spotPrice: json["spot_price"].toDouble(),
        potentialMaxLoss: json["potential_max_loss"].toDouble(),
        targetedProfit: json["targeted_profit"].toDouble(),
        returnField: json["return_field"] == null
            ? null
            : json["return_field"].toDouble(),
        event: json["event"] == null ? null : eventValues.map[json["event"]],
        spotDateChart: json["spot_date_chart"],
        spotDateYmd: DateTime.parse(json["spot_date_ymd"]),
        color: colorValues.map[json["color"]],
        adjPrice: json["adj_price"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "ticker": tickerValues.reverse[ticker],
        "spot_date": spotDate,
        "bot_type": botTypeValues.reverse[botType],
        "option_type": optionTypeValues.reverse[optionType],
        "month_to_exp": monthToExp,
        "spot_price": spotPrice,
        "potential_max_loss": potentialMaxLoss,
        "targeted_profit": targetedProfit,
        "return_field": returnField == null ? null : returnField,
        "event": event == null ? null : eventValues.reverse[event],
        "spot_date_chart": spotDateChart,
        "spot_date_ymd":
            "${spotDateYmd.year.toString().padLeft(4, '0')}-${spotDateYmd.month.toString().padLeft(2, '0')}-${spotDateYmd.day.toString().padLeft(2, '0')}",
        "color": colorValues.reverse[color],
        "adj_price": adjPrice,
      };
}

enum BotType { UCDC }

final botTypeValues = EnumValues({"UCDC": BotType.UCDC});

enum Color { THE_5_B34_FF, D22_B00, BBCEE5 }

final colorValues = EnumValues({
  "#BBCEE5": Color.BBCEE5,
  "#d22b00": Color.D22_B00,
  "#5B34FF": Color.THE_5_B34_FF
});

enum Event { EXPIRE }

final eventValues = EnumValues({"expire": Event.EXPIRE});

enum OptionType { ATM }

final optionTypeValues = EnumValues({"ATM": OptionType.ATM});

enum Ticker { THE_6753_T }

final tickerValues = EnumValues({"6753.T": Ticker.THE_6753_T});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
