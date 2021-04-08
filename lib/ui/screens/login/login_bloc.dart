import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../auth/authentication_bloc.dart';
import '../../../auth/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;
  LoginBloc({
    @required this.authenticationBloc,
    @required this.userRepository,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null),
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      await Future.delayed(Duration(milliseconds: 1000));
      String username = event.username.trim();
      String password = event.password.trim();

      var result = await userRepository.authenticate(
          username: username, password: password);

      if (result['status']) {
        authenticationBloc.add(LoggedIn());
      } else {
        yield LoginFailure(error: result['message']);
      }
    }
  }
}
