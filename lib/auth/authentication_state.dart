part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitialed extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final UserRepository userRepository;

  AuthenticationAuthenticated({@required this.userRepository});

  @override
  List<Object> get props => [userRepository];
}

class AuthenticationLoading extends AuthenticationState {}

class LoginInialized extends AuthenticationState {}
