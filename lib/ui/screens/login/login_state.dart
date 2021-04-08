part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final dynamic error;

  LoginFailure({this.error});
}

class LoginLoadDataFail extends LoginState {
  final dynamic error;

  LoginLoadDataFail(this.error) : super();

  @override
  List<Object> get props => error;
}
