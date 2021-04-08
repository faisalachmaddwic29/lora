import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../utils/utils.dart';

Widget loadingContainer(context, {bool apiCall}) {
  if (apiCall) {
    // jika masih proses kirim API
    return Stack(
      children: [
        new Opacity(
          opacity: 0.6,
          child: const ModalBarrier(dismissible: false, color: Colors.black),
        ),
        new Center(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 150.w(context),
            height: 150.w(context),
            padding: EdgeInsets.all(50),
            decoration: BoxDecoration(
              color: LoraColors.lightPrimary,
              borderRadius: BorderRadius.circular(16.w(context)),
            ),
            child: new CircularProgressIndicator(
              backgroundColor: LoraColors.primary.withOpacity(0.3),
              // strokeWidth: 10.0,
              valueColor: AlwaysStoppedAnimation<Color>(LoraColors.primary),
            ),
          ),
        ),
      ],
    );
  }
  return null;
}

Widget myShimmer({@required Widget child}) {
  return Shimmer.fromColors(
    child: child,
    baseColor: Color(0xFFEDF3F6).withOpacity(0.5),
    highlightColor: Color(0xFFEDF3F6),
  );
}

Widget stripLoading(context, {@required int height, int width}) {
  if (width == null) width = 0;
  return myShimmer(
    child: Container(
      height: height.w(context),
      width: MediaQuery.of(context).size.width / 2 - width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.white,
      ),
    ),
  );
}

Widget roundedLoading(context, {@required int height, int width}) {
  return myShimmer(
    child: Container(
      height: height.w(context),
      width: width.w(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.white,
      ),
    ),
  );
}

Widget baseCard(context,
    {@required String image,
    @required Widget child,
    double marginHorizontal = 15}) {
  return Container(
    height: 90.w(context),
    margin: EdgeInsets.symmetric(
        horizontal: marginHorizontal.w(context), vertical: 20.w(context)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 90.w(context),
          height: 90.w(context),
          decoration: BoxDecoration(
            color: LoraColors.lightPrimary,
            borderRadius: BorderRadius.circular(2.w(context)),
          ),
          child: SizedBox(),
        ),
        SizedBox(
          width: 18.w(context),
        ),
        Expanded(
          child: child,
        ),
      ],
    ),
  );
}

class MyCardLoader extends StatelessWidget {
  final int lenghtItem;
  const MyCardLoader({this.lenghtItem: 2});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: lenghtItem,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: LoraColors.lightPrimary,
            borderRadius: BorderRadius.circular(2.w(context)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color(0xFF323247).withOpacity(0.1),
                offset: Offset(0, 2),
                blurRadius: 4,
              )
            ],
          ),
          child: myShimmer(
            child: baseCard(
              context,
              image: null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  stripLoading(context, height: 15, width: 100)
                      .addMarginBottom(1.h(context)),
                  stripLoading(context, height: 15, width: 120)
                      .addMarginBottom(10.h(context)),
                  stripLoading(context, height: 15, width: 50),
                ],
              ),
            ),
          ),
        ).addMarginBottom(10.h(context));
      },
    );
  }
}

class MyCardLoaderList extends StatelessWidget {
  final int lenghtItem;
  const MyCardLoaderList({this.lenghtItem: 2});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: lenghtItem,
      itemBuilder: (context, index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            roundedLoading(context, height: 40, width: 40)
                .addMarginOnly(right: 10.w(context)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  myShimmer(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70.h(context),
                      decoration: BoxDecoration(
                        color: LoraColors.lightPrimary,
                        borderRadius: BorderRadius.circular(2.w(context)),
                      ),
                    ),
                  ).addMarginBottom(10.w(context)),
                  stripLoading(context, height: 30, width: 50)
                      .addMarginBottom(20.w(context)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
