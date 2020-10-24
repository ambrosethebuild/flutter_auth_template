import 'package:flutter/material.dart';
import 'package:flutter_auth_template/constants/app_paddings.dart';
import 'package:flutter_auth_template/constants/app_sizes.dart';

class RoundedContainer extends StatelessWidget {
  final double radius;
  final Widget body;

  const RoundedContainer({
    this.radius = 10,
    this.body,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppSizes.containerBorderRadiusShape(
          radius: this.radius,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      padding: AppPaddings.defaultPadding(),
      child: this.body,
    );
  }
}
