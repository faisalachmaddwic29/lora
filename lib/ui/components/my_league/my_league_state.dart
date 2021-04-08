part of 'my_league_bloc.dart';

abstract class MyLeagueState extends Equatable {
  const MyLeagueState();

  @override
  List<Object> get props => [];
}

class MyLeagueInitial extends MyLeagueState {}

class MyLeagueLoading extends MyLeagueState {}

class MyLeagueSuccess extends MyLeagueState {
  final List<MyLeagueModel> listMyLeague;

  MyLeagueSuccess({@required this.listMyLeague});

  @override
  List<Object> get props => [listMyLeague];
}

class MyLeagueFail extends MyLeagueState {
  final String error;

  MyLeagueFail({this.error});
}
