import 'package:flutter/material.dart';
import 'package:lora_app/utils/utils.dart';

Widget myAppBar(
  BuildContext context, {
  String title = '',
  List<Widget> action,
  bool leading = false,
  VoidCallback leadingAction,
  ImageProvider image,
  automaticImplyLeading = true,
}) {
  return AppBar(
    centerTitle: true,
    title: title != null
        ? Text(
            title,
            style: LoraFonts(context).appbarTitle,
          )
        : '',
    actions: action,
    elevation: 0,
    automaticallyImplyLeading: automaticImplyLeading,
    backgroundColor: LoraColors.grey,
    leading: leading
        ? IconButton(
            icon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image(
                image: image,
              ),
            ),
            onPressed: leadingAction ??
                () {
                  Navigator.pop(context);
                },
          )
        : null,
  );
}
