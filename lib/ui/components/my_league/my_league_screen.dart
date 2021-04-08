import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lora_app/ui/components/my_league/my_league_bloc.dart';
import 'package:lora_app/ui/widgets/widgets.dart';

import '../../../utils/themes.dart';
import '../../../utils/utils.dart';

class MyLeagueScreen extends StatefulWidget {
  @override
  _MyLeagueScreenState createState() => _MyLeagueScreenState();
}

class _MyLeagueScreenState extends State<MyLeagueScreen> {
  int _tapIndex;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyLeagueBloc>(
      create: (context) => MyLeagueBloc()..add(MyLeagueFetch()),
      child: BlocBuilder<MyLeagueBloc, MyLeagueState>(
        builder: (context, state) => Container(
          padding: EdgeInsets.symmetric(vertical: paddingScreen.w(context)),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: paddingScreen.w(context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'My League',
                      style: LoraFonts(context).boldQuicksand(
                        size: 16,
                      ),
                    ),
                    Text(
                      Tools.formatDate(DateTime.now()),
                      style: LoraFonts(context).mediumQuicksand(
                        size: 11,
                      ),
                    ),
                  ],
                ).addMarginBottom(15.h(context)),
              ),
              state is MyLeagueSuccess
                  ? ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.listMyLeague.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return index < 3 ||
                                state.listMyLeague[index].username == 'Me'
                            ? Container(
                                decoration: BoxDecoration(
                                  color: _tapIndex == index
                                      ? Colors.blue[200]
                                      : Colors.white,
                                  border: Border(
                                      bottom: BorderSide(
                                          color: LoraColors.grey, width: 2),
                                      top: BorderSide(
                                          width: 2,
                                          color: index == 0
                                              ? LoraColors.grey
                                              : Colors.transparent)),
                                ),
                                child: index < 3 ||
                                        state.listMyLeague[index].username ==
                                            'Me'
                                    ? ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 6.w(context),
                                            horizontal:
                                                paddingScreen.w(context)),
                                        onTap: () {
                                          setState(() {
                                            if (_tapIndex == index) {
                                              _tapIndex = null;
                                            } else {
                                              _tapIndex = index;
                                            }
                                          });
                                        },
                                        dense: true,
                                        leading: Text(
                                          (index + 1).toString(),
                                          style: LoraFonts(context)
                                              .mediumQuicksand(
                                            size: 13,
                                          ),
                                        ),
                                        title: Row(
                                          children: [
                                            Image(
                                              image: AssetImage(
                                                  'assets/img/profile.png'),
                                              width: 40,
                                              height: 40,
                                            ),
                                            SizedBox(
                                              width: 20.w(context),
                                            ),
                                            Text(
                                              state
                                                  .listMyLeague[index].username,
                                              style: LoraFonts(context)
                                                  .regularQuicksand(
                                                size: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                        trailing: Text(
                                          '${state.listMyLeague[index].pnl < 0 ? '' : '+'}' +
                                              state.listMyLeague[index].pnl
                                                  .toString() +
                                              '%',
                                          style: LoraFonts(context)
                                              .boldQuicksand(
                                                  size: 14,
                                                  color:
                                                      state.listMyLeague[index]
                                                                  .pnl <
                                                              0
                                                          ? LoraColors.red
                                                          : LoraColors.primary),
                                        ),
                                      )
                                    : SizedBox(),
                              )
                            : SizedBox();
                      },
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: paddingScreen.w(context)),
                      child: MyCardLoaderList(
                        lenghtItem: 1,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
