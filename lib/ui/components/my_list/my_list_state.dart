part of 'my_list_bloc.dart';

abstract class MyListState extends Equatable {
  const MyListState();

  @override
  List<Object> get props => [];
}

class MyListInitial extends MyListState {}

class MyListLoading extends MyListState {}

class MyListSuccess extends MyListState {
  final List<MyListModel> listMyList;

  MyListSuccess({@required this.listMyList});

  @override
  List<Object> get props => [listMyList];
}

class MyListFail extends MyListState {
  final String error;

  MyListFail({this.error});
}
