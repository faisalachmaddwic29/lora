import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lora_app/ui/components/chart/chart_bloc.dart';
import 'package:lora_app/utils/themes.dart';
import '../../../utils/utils.dart';

class LineChartWatchList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChartBloc>(
      create: (context) => ChartBloc()..add(ChartFetchThreeMonth()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BlocBuilder<ChartBloc, ChartState>(
            builder: (context, state) => state is ChartSuccess
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: 100,
                    height: 40,
                    child: LineChart(
                      LineChartData(
                        lineTouchData: LineTouchData(enabled: false),
                        lineBarsData: [
                          LineChartBarData(
                            spots: List.generate(
                                state.listChart.length,
                                (index) => FlSpot(index.toDouble(),
                                    state.listChart[index].spotPrice)),
                            isCurved: false,
                            barWidth: 5,
                            colors: [
                              LoraColors.primary,
                            ],
                            dotData: FlDotData(
                              show: false,
                            ),
                          ),
                        ],
                        minY: 0,
                        titlesData: FlTitlesData(show: false),
                        gridData: FlGridData(
                          show: true,
                          checkToShowHorizontalLine: (double value) {
                            return value == 1 ||
                                value == 6 ||
                                value == 4 ||
                                value == 5;
                          },
                        ),
                      ),
                    ),
                  )
                : Align(
                    alignment: Alignment.center, child: Text("DATA NOT FOUND")),
          ),
        ],
      ),
    );
  }
}
