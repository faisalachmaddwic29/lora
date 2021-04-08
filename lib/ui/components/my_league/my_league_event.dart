part of 'my_league_bloc.dart';

abstract class MyLeagueEvent extends Equatable {
  const MyLeagueEvent();

  @override
  List<Object> get props => [];
}

class MyLeagueFetch extends MyLeagueEvent {}
