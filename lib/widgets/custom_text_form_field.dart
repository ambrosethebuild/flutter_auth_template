import 'package:flutter/material.dart';
import 'package:flutter_auth_template/constants/app_colors.dart';
import 'package:flutter_auth_template/constants/app_sizes.dart';
import 'package:flutter_auth_template/constants/app_text_styles.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    Key key,
    this.filled,
    this.fillColor,
    this.textEditingController,
    this.obscureText = false,
    this.textInputAction = TextInputAction.done,
    this.keyboardType = TextInputType.text,
    this.labelText,
    this.errorText,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
    this.nextFocusNode,
    this.isReadOnly = false,
    this.onTap,
  }) : super(key: key);
  final bool filled;
  final Color fillColor;
  final TextEditingController textEditingController;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String labelText;
  final String errorText;

  final Function onChanged;
  final Function onFieldSubmitted;
  final Function validator;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;

  final bool isReadOnly;
  final Function onTap;

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: widget.labelText,
        errorText: widget.errorText,
        border: _getInputBorder(),
        suffixIcon: _getSuffixWidget(),
      ),
      style: AppTextStyle.h4TitleTextStyle(
        color: AppColor.textColor(context),
      ),
      cursorColor: AppColor.cursorColor,
      obscureText: (widget.obscureText) ? !makePasswordVisible : false,
      onTap: widget.onTap,
      readOnly: widget.isReadOnly,
      controller: widget.textEditingController,
      validator: widget.validator,
      focusNode: widget.focusNode,
      onFieldSubmitted: (data) {
        if (widget.onFieldSubmitted != null) {
          widget.onFieldSubmitted(data);
        } else {
          FocusScope.of(context).requestFocus(widget.nextFocusNode);
        }
      },
      onChanged: widget.onChanged,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
    );
  }

  //
  //
  //
  //get the border for the textform field
  InputBorder _getInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        AppSizes.borderRadius,
      ),
    );
  }

  //check if it's password input
  bool makePasswordVisible = false;
  Widget _getSuffixWidget() {
    if (widget.obscureText) {
      return ButtonTheme(
        minWidth: 30,
        height: 30,
        padding: EdgeInsets.all(0),
        child: FlatButton(
          padding: EdgeInsets.all(0),
          onPressed: () {
            setState(() {
              makePasswordVisible = !makePasswordVisible;
            });
          },
          child: Icon(
            (!makePasswordVisible)
                ? FlutterIcons.md_eye_off_ion
                : FlutterIcons.md_eye_ion,
            color: Colors.grey,
          ),
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
