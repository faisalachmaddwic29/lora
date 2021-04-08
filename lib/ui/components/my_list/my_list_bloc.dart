import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lora_app/services/get_data_json.dart';
import 'package:lora_app/ui/components/my_list/my_list_model.dart';

part 'my_list_event.dart';
part 'my_list_state.dart';

class MyListBloc extends Bloc<MyListEvent, MyListState> {
  MyListBloc() : super(MyListInitial());

  @override
  Stream<MyListState> mapEventToState(
    MyListEvent event,
  ) async* {
    if (event is MyListFetch) {
      yield MyListLoading();
      await Future.delayed(Duration(milliseconds: 800));

      yield* _fetchData(event);
    }
  }

  Stream<MyListState> _fetchData(MyListFetch event) async* {
    List<MyListModel> myListresponse = await LoadJson().myList();

    yield myListresponse.isNotEmpty
        ? MyListSuccess(listMyList: myListresponse)
        : MyListFail(error: 'error');
  }
}
