import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lora_app/ui/components/chart/chart_model.dart';

import 'chart_repository.dart';

part 'chart_event.dart';
part 'chart_state.dart';

class ChartBloc extends Bloc<ChartEvent, ChartState> {
  ChartBloc() : super(ChartInitial());

  @override
  Stream<ChartState> mapEventToState(
    ChartEvent event,
  ) async* {
    if (event is ChartFetch) {
      yield ChartLoading();
      var data = await ChartRepository().oneYear();

      yield data.isNotEmpty
          ? ChartSuccess(listChart: data)
          : ChartFail(error: 'error');
    }
    if (event is ChartFetchOneDay) {
      yield ChartLoading();
      var data = await ChartRepository().oneDay();

      yield data.isNotEmpty
          ? ChartSuccess(listChart: data)
          : ChartFail(error: 'error');
    }
    if (event is ChartFetchOneWeek) {
      yield ChartLoading();
      var data = await ChartRepository().oneWeek();

      yield data.isNotEmpty
          ? ChartSuccess(listChart: data)
          : ChartFail(error: 'error');
    }
    if (event is ChartFetchOneMonth) {
      yield ChartLoading();
      var data = await ChartRepository().oneMonth();
      yield data.isNotEmpty
          ? ChartSuccess(listChart: data)
          : ChartFail(error: 'error');
    }
    if (event is ChartFetchThreeMonth) {
      yield ChartLoading();
      var data = await ChartRepository().threeMonth();

      yield data.isNotEmpty
          ? ChartSuccess(listChart: data)
          : ChartFail(error: 'error');
    }
    if (event is ChartFetchOneYear) {
      yield ChartLoading();
      var data = await ChartRepository().oneYear();
      yield data.isNotEmpty
          ? ChartSuccess(listChart: data)
          : ChartFail(error: 'error');
    }
  }
}
