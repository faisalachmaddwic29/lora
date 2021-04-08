import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/utils.dart';

class MyTextFormField extends StatefulWidget {
  final String label;
  final bool noLabel;
  final String hint;
  final TextEditingController controller;
  final Function validator;
  final bool password;
  final TextCapitalization capitalization;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool suffix;
  final FocusNode focusText;
  final FocusNode nextfocusText;
  final typeInput;
  final bool readOnly;
  final bool autovalidateMode;
  final int maxLinex;
  final int maxLength;

  MyTextFormField({
    this.label,
    this.noLabel: false,
    @required this.hint,
    @required this.controller,
    @required this.validator,
    this.capitalization,
    this.textInputAction,
    this.keyboardType,
    this.password: false,
    this.suffix: false,
    this.readOnly: false,
    this.maxLinex: 1,
    this.maxLength,
    this.focusText,
    this.nextfocusText,
    this.typeInput,
    this.autovalidateMode: false,
  });

  @override
  _MyTextFormFieldState createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  bool _obscureText;

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    // widget.controller.text != null ??
    // FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  void initState() {
    _obscureText = widget.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        widget.noLabel
            ? SizedBox()
            : Text(widget.label, style: LoraFonts(context).labelTextField),
        widget.noLabel ? SizedBox() : SizedBox(height: 10.h(context)),
        TextFormField(
          maxLength: widget.maxLength ?? null,
          maxLines: widget.maxLinex,
          readOnly: widget.readOnly,
          autovalidateMode: widget.autovalidateMode
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          inputFormatters: [
            widget.typeInput == 'number'
                ? FilteringTextInputFormatter.digitsOnly
                : FilteringTextInputFormatter.deny(RegExp("[/\\\\]")),
          ],
          cursorColor: LoraColors.primary,
          obscureText: widget.password ? _obscureText : false,
          validator: widget.validator,
          controller: widget.controller,
          textCapitalization: widget.capitalization ?? TextCapitalization.none,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction ?? TextInputAction.done,
          style: LoraFonts(context).textField,
          onFieldSubmitted: (term) {
            _fieldFocusChange(context, widget.focusText, widget.nextfocusText);
          },
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.fromLTRB(5.w(context), 13.h(context), 0, 0),
            suffixIcon: widget.suffix
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.h(context)),
                      child: _obscureText
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    ),
                  )
                : SizedBox(),
            hintText: widget.hint,
            hintStyle: LoraFonts(context).hintTextField,
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(5.w(context)),
              borderSide: BorderSide(
                color: LoraColors.grey,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(5.w(context)),
              borderSide: BorderSide(
                color: LoraColors.primary,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(5.w(context)),
              borderSide: BorderSide(
                color: LoraColors.grey,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
