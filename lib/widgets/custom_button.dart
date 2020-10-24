import 'package:flutter/material.dart';
import 'package:flutter_auth_template/constants/app_colors.dart';
import 'package:flutter_auth_template/constants/app_paddings.dart';
import 'package:flutter_auth_template/constants/app_sizes.dart';
import 'package:flutter_auth_template/constants/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final ShapeBorder shape;
  final bool isFixedHeight;

  const CustomButton({
    this.title,
    this.onPressed,
    this.shape,
    this.isFixedHeight = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: this.onPressed,
      color: AppColor.primaryColor,
      padding: AppPaddings.buttonPadding(),
      shape: this.shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSizes.borderRadius,
            ),
          ),
      child: Container(
        width: double.infinity,
        height: this.isFixedHeight ? AppSizes.inputHeight : null,
        child: Text(
          this.title,
          textAlign: TextAlign.center,
          style: AppTextStyle.h3TitleTextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
