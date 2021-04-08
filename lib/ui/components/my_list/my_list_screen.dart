import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lora_app/ui/components/my_list/my_list_bloc.dart';
import 'package:lora_app/ui/widgets/widgets.dart';
import 'package:lora_app/utils/utils.dart';

class MyListScreen extends StatefulWidget {
  @override
  _MyListScreenState createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyListBloc>(
      create: (context) => MyListBloc()..add(MyListFetch()),
      child: BlocBuilder<MyListBloc, MyListState>(
        builder: (context, state) => Container(
          padding: EdgeInsets.only(
              top: paddingScreen.w(context),
              left: paddingScreen.w(context),
              bottom: paddingScreen.w(context),
              right: 0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My List',
                style: LoraFonts(context).boldQuicksand(
                  size: 16,
                ),
              ).addMarginBottom(15.h(context)),
              state is MyListSuccess
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200.0,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.listMyList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(15.w(context)),
                            margin: EdgeInsets.only(right: 20.w(context)),
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: 200.0,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(4.w(context)),
                                // image: DecorationImage(
                                //   image: AssetImage('assets/img/photo.png'),
                                // ),
                                color: LoraColors.grey,
                                border: Border.all(
                                    color: LoraColors.grayStroke, width: 2)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        state.listMyList[index].like =
                                            !state.listMyList[index].like;
                                      });
                                    },
                                    child: Icon(
                                      Icons.favorite,
                                      color: state.listMyList[index].like
                                          ? LoraColors.red
                                          : LoraColors.black,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Stocks for',
                                      style: LoraFonts(context)
                                          .boldQuicksand(size: 13),
                                    ),
                                    Text(state.listMyList[index].name,
                                        style: LoraFonts(context)
                                            .boldQuicksand(size: 13)),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  : MyCardLoader(
                      lenghtItem: 1,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
