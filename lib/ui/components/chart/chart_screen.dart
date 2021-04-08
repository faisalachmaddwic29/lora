import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lora_app/ui/components/chart/chart_bloc.dart';
import 'package:lora_app/utils/themes.dart';
import '../../../utils/utils.dart';

class LineChartGrafik extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChartBloc>(
      create: (context) => ChartBloc()..add(ChartFetch()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BlocBuilder<ChartBloc, ChartState>(
            builder: (context, state) => state is ChartSuccess
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 140,
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
          BlocBuilder<ChartBloc, ChartState>(
            builder: (context, state) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, // background
                      shadowColor: Colors.transparent,
                      onPrimary: LoraColors.primary, //ground
                    ),
                    onPressed: () {
                      BlocProvider.of<ChartBloc>(context)
                        ..add(ChartFetchOneDay());
                    },
                    child: Text('1D')),
                SizedBox(width: 5.w(context)),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, // background
                      shadowColor: Colors.transparent,
                      onPrimary: LoraColors.primary, // foreground
                    ),
                    onPressed: () {
                      BlocProvider.of<ChartBloc>(context)
                        ..add(ChartFetchOneWeek());
                    },
                    child: Text('1W')),
                SizedBox(width: 5.w(context)),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, // background
                      shadowColor: Colors.transparent,
                      onPrimary: LoraColors.primary, //ground
                    ),
                    onPressed: () {
                      BlocProvider.of<ChartBloc>(context)
                        ..add(ChartFetchOneMonth());
                    },
                    child: Text('1M')),
                SizedBox(width: 5.w(context)),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, // background
                      shadowColor: Colors.transparent,
                      onPrimary: LoraColors.primary, //ground
                    ),
                    onPressed: () {
                      BlocProvider.of<ChartBloc>(context)
                        ..add(ChartFetchThreeMonth());
                    },
                    child: Text('3M')),
                SizedBox(width: 5.w(context)),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, // background
                      shadowColor: Colors.transparent,
                      onPrimary: LoraColors.primary, //ground
                    ),
                    onPressed: () {
                      BlocProvider.of<ChartBloc>(context)
                        ..add(ChartFetchOneYear());
                    },
                    child: Text('1Y')),
                SizedBox(width: 5.w(context)),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, // background
                      shadowColor: Colors.transparent,
                      onPrimary: LoraColors.primary, //ground
                    ),
                    onPressed: () {
                      BlocProvider.of<ChartBloc>(context)..add(ChartFetch());
                    },
                    child: Text('All')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
