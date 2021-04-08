part of 'my_list_bloc.dart';

abstract class MyListEvent extends Equatable {
  const MyListEvent();

  @override
  List<Object> get props => [];
}

class MyListFetch extends MyListEvent {}
