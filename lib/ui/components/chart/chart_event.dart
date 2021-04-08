part of 'chart_bloc.dart';

abstract class ChartEvent extends Equatable {
  const ChartEvent();

  @override
  List<Object> get props => [];
}

class ChartFetchOneDay extends ChartEvent {}

class ChartFetchOneWeek extends ChartEvent {}

class ChartFetchOneMonth extends ChartEvent {}

class ChartFetchThreeMonth extends ChartEvent {}

class ChartFetchOneYear extends ChartEvent {}

class ChartFetch extends ChartEvent {}
