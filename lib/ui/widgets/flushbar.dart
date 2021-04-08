import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../../utils/themes.dart';
import '../../utils/utils.dart';

Widget flushbarFail(context, {String text, IconData icon}) {
  return Flushbar(
    margin: EdgeInsets.symmetric(
        horizontal: paddingScreen.w(context), vertical: 10),
    isDismissible: true,
    borderRadius: 5.w(context),
    message: text.toString(),
    icon: Icon(
      icon == null ? Icons.info_outline : icon,
      size: 28.0,
      color: LoraColors.red,
    ),
    duration: Duration(seconds: 8),
  )..show(context);
}
