import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/authentication_bloc.dart';
import '../../widgets/widgets.dart';
import '../../../utils/utils.dart';
import 'login_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // dynamic _isValidation = AutovalidateMode.disabled;
  bool _isValidation = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(
        authenticationBloc: context.read<AuthenticationBloc>(),
        userRepository: context.read<AuthenticationBloc>().userRepository,
      ),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            flushbarFail(context, text: state.error.toString());
          }
        },
        builder: (context, state) => Stack(
          children: [
            Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(paddingScreen.w(context)),
                    child: Form(
                      key: _loginFormKey,
                      autovalidateMode: _isValidation
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 30.h(context)),
                          Text('Welcome !',
                              style: LoraFonts(context).boldQuicksand(
                                size: 32,
                                color: LoraColors.primary,
                              )),
                          Text(
                            'Login in to continue',
                            style: LoraFonts(context).semiBoldQuicksand(
                                size: 13, color: LoraColors.black),
                          ),
                          SizedBox(height: 60.h(context)),
                          Image(
                            image:
                                AssetImage('assets/img/illustration_login.png'),
                          ),
                          SizedBox(height: 30.h(context)),
                          MyTextFormField(
                            noLabel: true,
                            controller: _usernameController,
                            hint: 'Username',
                            capitalization: TextCapitalization.none,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Username is required";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 15.h(context)),
                          MyTextFormField(
                            noLabel: true,
                            password: true,
                            suffix: true,
                            controller: _passwordController,
                            hint: 'Password',
                            capitalization: TextCapitalization.none,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Password is required";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 30.h(context)),
                          PrimaryButton(
                            text: 'LOGIN',
                            onTap: () {
                              _onLoginButtonPressed(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
                child:
                    loadingContainer(context, apiCall: state is LoginLoading)),
          ],
        ),
      ),
    );
  }

  _onLoginButtonPressed(context) async {
    FocusScope.of(context).requestFocus(FocusNode());

    setState(() {
      _isValidation = true;
    });
    if (_loginFormKey.currentState.validate()) {
      BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
        username: _usernameController.text,
        password: _passwordController.text,
      ));
    }
  }
}
