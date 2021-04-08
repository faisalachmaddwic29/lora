import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lora_app/ui/components/my_league/my_league_model.dart';

import 'my_league_repository.dart';

part 'my_league_event.dart';
part 'my_league_state.dart';

class MyLeagueBloc extends Bloc<MyLeagueEvent, MyLeagueState> {
  MyLeagueBloc() : super(MyLeagueInitial());

  @override
  Stream<MyLeagueState> mapEventToState(
    MyLeagueEvent event,
  ) async* {
    if (event is MyLeagueFetch) {
      yield MyLeagueLoading();

      yield* _fetchData(event);
    }
  }

  Stream<MyLeagueState> _fetchData(MyLeagueFetch event) async* {
    List<MyLeagueModel> myLeagueListresponse =
        await MyLeagueRepository().getData();

    yield myLeagueListresponse.isNotEmpty
        ? MyLeagueSuccess(listMyLeague: myLeagueListresponse)
        : MyLeagueFail(error: 'error');
  }
}
