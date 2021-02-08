import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'custom_container_widget.dart';

class TextFieldWidget extends StatefulWidget {
  final String placeholder;
  final bool autofocus;
  final Function(String) onChanged;
  final TextInputType inputType;
  final String mask;
  final TextCapitalization textCapitalization;
  final TextEditingController controller;
  final double fontSize;
  final Color backgroundColorContainer;
  final Color textColor;
  final Color placeholderColor;
  final FontWeight fontWeight;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final FocusNode focusNode;
  final bool enabled;
  final bool autocorrect;
  final int maxLines;
  final int maxLength;
  final double height;
  final bool obscureText;

  TextFieldWidget({
    this.placeholder,
    this.height,
    this.maxLines,
    this.maxLength,
    this.onChanged,
    this.inputType,
    this.mask,
    this.textCapitalization,
    this.autofocus,
    this.controller,
    this.fontSize = 16,
    this.backgroundColorContainer,
    this.textColor,
    this.fontWeight,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.placeholderColor,
    this.enabled = true,
    this.autocorrect = true,
    this.obscureText = false,
  });

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: this.widget.height,
      color: widget.backgroundColorContainer,
      radius: 4,
      child: TextField(
        autocorrect: this.widget.autocorrect,
        obscureText: this.widget.obscureText,
        enabled: this.widget.enabled,
        controller: this.widget.controller,
        focusNode: this.widget.focusNode,
        autofocus:
            this.widget.autofocus != null ? this.widget.autofocus : false,
        textCapitalization: widget.textCapitalization != null
            ? widget.textCapitalization
            : TextCapitalization.none,
        keyboardAppearance: Brightness.dark,
        inputFormatters: this._getFormatters(),
        cursorColor: Colors.blueAccent,
        onChanged: widget.onChanged,
        textAlign: TextAlign.start,
        textAlignVertical: this.widget.prefixIcon != null
            ? TextAlignVertical.center
            : TextAlignVertical.top,
        keyboardType: widget.inputType,
        maxLines: this.widget.maxLines ?? 1,
        decoration: InputDecoration(
          prefixIcon: this.widget.prefixIcon ?? null,
          // suffixIcon: this.widget.suffixIcon ?? SizedBox.shrink(),
          suffix: this.widget.suffixIcon != null
              ? Padding(
                  padding: EdgeInsets.all(0),
                  child: this.widget.suffixIcon,
                )
              : SizedBox.shrink(),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          hintText: widget.placeholder,
          hintStyle: TextStyle(
              color:
                  widget.placeholderColor ?? widget.textColor ?? Colors.white,
              fontStyle: FontStyle.normal),
        ),
        style: TextStyle(
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight ?? FontWeight.normal,
          color: widget.textColor ?? Colors.white,
        ),
      ),
    );
  }

  List<TextInputFormatter> _getFormatters() {
    List<TextInputFormatter> textInputFormatters = [];
    if (this.widget.maxLength != null) {
      var maxLengthFormatter =
          LengthLimitingTextInputFormatter(this.widget.maxLength);
      textInputFormatters.add(maxLengthFormatter);
    }
    if (this.widget.mask != null) {
      var maskFormatter = new MaskTextInputFormatter(
          mask: this.widget.mask, filter: {"#": RegExp(r'[0-9]')});
      textInputFormatters.add(maskFormatter);
    }
    return textInputFormatters;
  }
}
