import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitialed());
  final UserRepository userRepository = new UserRepository();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasLogin = await userRepository.hasLogin();
      if (hasLogin) {
        yield AuthenticationAuthenticated(userRepository: userRepository);
      } else {
        yield LoginInialized();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationAuthenticated(userRepository: userRepository);
    }

    if (event is LoggedOut) {
      await userRepository.logout();
      yield LoginInialized();
    }
  }
}
