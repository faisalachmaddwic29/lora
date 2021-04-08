part of 'chart_bloc.dart';

abstract class ChartState extends Equatable {
  const ChartState();

  @override
  List<Object> get props => [];
}

class ChartInitial extends ChartState {}

class ChartLoading extends ChartState {}

class ChartSuccess extends ChartState {
  final List<ChartModel> listChart;

  ChartSuccess({@required this.listChart});

  @override
  List<Object> get props => [listChart];
}

class ChartFail extends ChartState {
  final String error;

  ChartFail({this.error});
}
