part of 'my_watch_list_bloc.dart';

abstract class MyWatchListState extends Equatable {
  const MyWatchListState();

  @override
  List<Object> get props => [];
}

class MyWatchListInitial extends MyWatchListState {}

class MyWatchListLoading extends MyWatchListState {}

class MyWatchListSuccess extends MyWatchListState {
  final List<MyWatchListModel> listMyWatchList;

  MyWatchListSuccess({@required this.listMyWatchList});

  @override
  List<Object> get props => [listMyWatchList];
}

class MyWatchListFail extends MyWatchListState {
  final String error;

  MyWatchListFail({this.error});
}
