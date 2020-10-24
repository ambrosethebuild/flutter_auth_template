import 'package:flutter/material.dart';
import 'package:flutter_auth_template/constants/app_paddings.dart';
import 'package:flutter_auth_template/constants/app_sizes.dart';
import 'package:flutter_auth_template/constants/app_text_styles.dart';
import 'package:flutter_auth_template/utils/ui_spacer.dart';
import 'package:flutter_auth_template/widgets/base.page.dart';
import 'package:flutter_auth_template/widgets/custom_button.dart';
import 'package:flutter_auth_template/widgets/custom_text_form_field.dart';
import 'package:flutter_auth_template/widgets/rounded_container.dart';
import 'package:flutter_icons/flutter_icons.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      showLeadingAction: false,
      showAppBar: false,
      title: "Login",
      body: SafeArea(
        child: ListView(
          padding: AppPaddings.defaultPadding(),
          children: [
            //title
            Text(
              "Let's start with\nLogin!",
              style: AppTextStyle.h0TitleTextStyle(),
            ),

            //container with shadow
            UiSpacer.verticalSpace(),
            RoundedContainer(
              body: Column(
                children: [
                  //email
                  CustomTextFormField(
                    // hintText: "Email",
                    labelText: "Email",
                  ),
                  UiSpacer.formVerticalSpace(),
                  CustomTextFormField(
                    hintText: "Password",
                    togglePassword: true,
                    obscureText: true,
                  ),
                  UiSpacer.formVerticalSpace(),
                  CustomButton(
                    title: "Login",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
