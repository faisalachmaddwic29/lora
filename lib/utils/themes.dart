import 'package:flutter/material.dart';

import 'responsive.dart';

class LoraColors {
  static final Color black = Color(0xff2D3D49);
  static final Color primary = Color(0xFF4CA4DF);
  static final Color secondary = Color(0xFF90C3EB);
  static final Color lightPrimary = Color(0xffe1eef1);
  static final Color background = Colors.white;
  static final Color red = Color(0xffD3546E);
  static final Color grey = Color(0xffDEE6ED);
  static final Color greyMore = Color(0xFFDDE6ED);
  static final Color textMore = Color(0xFF768895);
  static final Color grayStroke = Color(0xffBCC7CF);
}

class LoraFonts extends LoraColors {
  BuildContext context;
  TextStyle appbarTitle;
  TextStyle actionText;
  TextStyle hintTextField;
  TextStyle textField;
  TextStyle labelTextField;
  TextStyle textButton;

  TextStyle boldQuicksand({
    double size = 30,
    Color color,
    double height,
    double letterSpacing,
    bool italic = false,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontFamily: 'QuicksandBold',
      fontSize: Responsive(context).f(size),
      fontWeight: fontWeight,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      color: color ?? LoraColors.black,
      letterSpacing: letterSpacing,
    );
  }

  // Quicksand
  TextStyle semiBoldQuicksand({
    double size = 28,
    Color color,
    double height,
    double letterSpacing,
    bool italic = false,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontFamily: 'QuicksandSemiBold',
      fontSize: Responsive(context).f(size),
      fontWeight: fontWeight,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      color: color ?? LoraColors.black,
      letterSpacing: letterSpacing,
    );
  }

  TextStyle regularQuicksand({
    double size = 22,
    Color color,
    double height,
    double letterSpacing,
    bool italic = false,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontFamily: 'QuicksandRegular',
      fontSize: Responsive(context).f(size),
      fontWeight: fontWeight,
      height: height,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      color: color ?? LoraColors.black,
      letterSpacing: letterSpacing,
    );
  }

  TextStyle lightQuicksand({
    double size = 15,
    Color color,
    double height,
    double letterSpacing,
    bool italic = false,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontFamily: 'QuicksandLight',
      fontSize: Responsive(context).f(size),
      fontWeight: fontWeight,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      color: color ?? LoraColors.black,
      letterSpacing: letterSpacing,
    );
  }

  TextStyle mediumQuicksand({
    double size = 14,
    Color color,
    double height,
    double letterSpacing,
    bool italic = false,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontFamily: 'QuicksandMedium',
      fontSize: Responsive(context).f(size),
      fontWeight: fontWeight,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      color: color ?? LoraColors.black,
      letterSpacing: letterSpacing,
    );
  }

  // END Quicksand

  LoraFonts(this.context) {
    textButton = TextStyle(
      color: LoraColors.primary,
      fontFamily: 'PMedium',
      fontSize: Responsive(context).f(16),
    );

    appbarTitle = TextStyle(
      color: LoraColors.primary,
      fontFamily: 'QuicksandBold',
      fontSize: Responsive(context).f(18),
    );

    actionText = TextStyle(
      color: LoraColors.primary,
      fontFamily: 'QuicksandLight',
      fontSize: Responsive(context).f(15),
    );

    hintTextField = TextStyle(
      color: LoraColors.grey,
      fontWeight: FontWeight.w300,
      fontSize: Responsive(context).f(14),
      fontFamily: 'QuicksandRegular',
    );

    labelTextField = TextStyle(
      color: LoraColors.black,
      fontFamily: 'QuicksandMedium',
      fontSize: Responsive(context).f(15),
    );

    textField = TextStyle(
      color: LoraColors.black,
      fontWeight: FontWeight.w300,
      fontSize: Responsive(context).f(14),
    );
  }
}
