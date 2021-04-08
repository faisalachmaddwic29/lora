import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lora_app/ui/components/my_watch_list/my_watch_list_bloc.dart';
import 'package:lora_app/ui/widgets/widgets.dart';
import 'package:lora_app/utils/utils.dart';

import 'chart.dart';

class MyWatchListScreen extends StatefulWidget {
  @override
  _MyWatchListScreenState createState() => _MyWatchListScreenState();
}

class _MyWatchListScreenState extends State<MyWatchListScreen> {
  int _tapIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyWatchListBloc>(
      create: (context) => MyWatchListBloc()..add(MyWatchListFetch()),
      child: BlocBuilder<MyWatchListBloc, MyWatchListState>(
        builder: (context, state) => Container(
          padding: EdgeInsets.symmetric(vertical: paddingScreen.w(context)),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: paddingScreen.w(context)),
                child: Text(
                  'Watch List',
                  style: LoraFonts(context).boldQuicksand(
                    size: 16,
                  ),
                ).addMarginBottom(15.h(context)),
              ),
              state is MyWatchListSuccess
                  ? ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.listMyWatchList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: _tapIndex == index
                                ? Colors.blue[200]
                                : Colors.white,
                            border: Border(
                                bottom: BorderSide(color: LoraColors.grey),
                                top: BorderSide(
                                    color: index == 0
                                        ? LoraColors.grey
                                        : Colors.transparent)),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 6.w(context),
                                horizontal: paddingScreen.w(context)),
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
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.listMyWatchList[index].hk,
                                  style: LoraFonts(context)
                                      .boldQuicksand(size: 14),
                                ),
                                Text(
                                  state.listMyWatchList[index].name,
                                  style: LoraFonts(context)
                                      .regularQuicksand(size: 11),
                                ),
                              ],
                            ),
                            title: Padding(
                              padding: EdgeInsets.only(left: 50),
                              child: LineChartWatchList(),
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${state.listMyWatchList[index].pnl < 0 ? '' : '+'}' +
                                      state.listMyWatchList[index].pnl
                                          .toString() +
                                      "%",
                                  style: LoraFonts(context).boldQuicksand(
                                      size: 14,
                                      color:
                                          state.listMyWatchList[index].pnl < 0
                                              ? LoraColors.red
                                              : LoraColors.primary),
                                ),
                                Text(
                                    Tools.rupiah(
                                        state.listMyWatchList[index].price),
                                    style: LoraFonts(context)
                                        .regularQuicksand(size: 11)),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: paddingScreen.w(context)),
                      child: MyCardLoaderList(
                        lenghtItem: 1,
                      ),
                    ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: LoraColors.greyMore,
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: paddingScreen.w(context),
                    vertical: 15.w(context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'More',
                      style: LoraFonts(context).boldQuicksand(
                        size: 14,
                        color: LoraColors.textMore,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: LoraColors.textMore,
                      size: 12,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: LoraColors.textMore,
                      size: 12,
                    ),
                  ],
                ),
              ).addMarginTop(5.h(context)),
            ],
          ),
        ),
      ),
    );
  }
}
