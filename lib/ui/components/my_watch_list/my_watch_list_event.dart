part of 'my_watch_list_bloc.dart';

abstract class MyWatchListEvent extends Equatable {
  const MyWatchListEvent();

  @override
  List<Object> get props => [];
}

class MyWatchListFetch extends MyWatchListEvent {}
