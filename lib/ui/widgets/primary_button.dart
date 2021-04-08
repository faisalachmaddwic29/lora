import 'package:flutter/material.dart';
import 'package:lora_app/utils/themes.dart';
import '../../utils/responsive.dart';

import 'touchable_opacity.dart';

// ignore: must_be_immutable
class PrimaryButton extends StatelessWidget {
  String text;
  VoidCallback onTap;
  Color color;
  Color textColor;
  Widget child;
  EdgeInsets padding;
  Border border;

  PrimaryButton({
    Key key,
    this.text,
    this.onTap,
    this.color,
    this.textColor,
    this.child,
    this.padding,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (color == null) color = LoraColors.primary;
    if (textColor == null) textColor = Colors.white;
    if (padding == null) padding = EdgeInsets.all(16.w(context));

    return TouchableOpacity(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: onTap != null ? color : LoraColors.grayStroke,
          borderRadius: BorderRadius.circular(12.w(context)),
          boxShadow: onTap != null
              ? [
                  BoxShadow(
                    color: color.withOpacity(0.5),
                    offset: Offset(0, 4),
                    blurRadius: 12,
                  )
                ]
              : [],
        ),
        child: Center(
          child: child != null
              ? child
              : Text(
                  text,
                  style: LoraFonts(context).boldQuicksand(size: 14).apply(
                        color: onTap != null
                            ? textColor
                            : LoraColors.black.withOpacity(0.6),
                      ),
                ),
        ),
      ),
    );
  }
}

class AnimatedButtonLogin extends StatefulWidget {
  @override
  _AnimatedButtonLoginState createState() => _AnimatedButtonLoginState();
}

class _AnimatedButtonLoginState extends State<AnimatedButtonLogin> {
  bool _clicked = false;
  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () {
        setState(() {
          _clicked = !_clicked;
        });
      },
      child: AnimatedContainer(
        width: _clicked ? 50.w(context) : MediaQuery.of(context).size.width,
        height: 50.w(context),
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 400),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(_clicked ? 50.w(context) : 15.w(context)),
          gradient: LinearGradient(
            colors: [
              LoraColors.secondary,
              LoraColors.primary,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Center(
            child: Text(
          'LOGIN',
          style: LoraFonts(context).boldQuicksand(
            color: LoraColors.lightPrimary,
            size: 14,
          ),
        )),
      ),
    );
  }
}
