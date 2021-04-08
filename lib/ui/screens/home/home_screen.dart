import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lora_app/ui/components/my_list/my_list_screen.dart';
import 'package:lora_app/ui/components/my_portofolio/my_portofolio_screen.dart';
import 'package:lora_app/ui/components/my_watch_list/my_watch_list_screen.dart';
import 'package:lora_app/utils/themes.dart';
import '../../components/components.dart';

import '../../../auth/authentication_bloc.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context,
          title: 'LORA',
          automaticImplyLeading: false,
          action: [
            IconButton(
              icon: Icon(
                Icons.logout,
                color: LoraColors.red,
              ),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context)..add(LoggedOut());
              },
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyPortoFolioScreen(),
            MyLeagueScreen(),
            MyListScreen(),
            MyWatchListScreen(),
          ],
        ),
      ),
    );
  }
}
