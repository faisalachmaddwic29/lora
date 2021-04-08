import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lora_app/services/get_data_json.dart';
import 'package:lora_app/ui/components/my_watch_list/my_watch_list_model.dart';

part 'my_watch_list_event.dart';
part 'my_watch_list_state.dart';

class MyWatchListBloc extends Bloc<MyWatchListEvent, MyWatchListState> {
  MyWatchListBloc() : super(MyWatchListInitial());

  @override
  Stream<MyWatchListState> mapEventToState(
    MyWatchListEvent event,
  ) async* {
    if (event is MyWatchListFetch) {
      yield MyWatchListLoading();

      yield* _fetchData(event);
    }
  }

  Stream<MyWatchListState> _fetchData(MyWatchListFetch event) async* {
    List<MyWatchListModel> myWatchListresponse = await LoadJson().myWatchList();

    yield myWatchListresponse.isNotEmpty
        ? MyWatchListSuccess(listMyWatchList: myWatchListresponse)
        : MyWatchListFail(error: 'error');
  }
}
