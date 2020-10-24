import 'package:flutter/material.dart';
import 'package:flutter_auth_template/constants/app_paddings.dart';
import 'package:flutter_auth_template/constants/app_routes.dart';
import 'package:flutter_auth_template/constants/app_text_styles.dart';
import 'package:flutter_auth_template/services/validator.service.dart';
import 'package:flutter_auth_template/utils/ui_spacer.dart';
import 'package:flutter_auth_template/view_models/login.view_model.dart';
import 'package:flutter_auth_template/widgets/base.page.dart';
import 'package:flutter_auth_template/widgets/buttons/custom_button.dart';
import 'package:flutter_auth_template/widgets/buttons/custom_text_button.dart';
import 'package:flutter_auth_template/widgets/custom_text_form_field.dart';
import 'package:flutter_auth_template/widgets/rounded_container.dart';
import 'package:stacked/stacked.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(context),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return BasePage(
          showLeadingAction: false,
          showAppBar: false,
          title: "Login",
          body: SafeArea(
            child: ListView(
              padding: AppPaddings.bigContentPadding(),
              children: [
                //title
                Text(
                  "Let's start with\nLogin!",
                  style: AppTextStyle.h0TitleTextStyle(),
                ),

                //container with shadow
                UiSpacer.verticalSpace(),
                Form(
                  key: model.formKey,
                  child: RoundedContainer(
                    body: Column(
                      children: [
                        //email
                        CustomTextFormField(
                          labelText: "Email",
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          textEditingController: model.emailTEC,
                          validator: FormValidator.validateEmail,
                        ),
                        UiSpacer.formVerticalSpace(),
                        CustomTextFormField(
                          labelText: "Password",
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          textEditingController: model.passwordTEC,
                          validator: FormValidator.validatePassword,
                        ),
                        CustomTextButton(
                          title: "Forgot Password?",
                          onPressed: _onForgotPasswordPressed,
                        ),

                        CustomButton(
                          title: "Login",
                          onPressed: model.onLoginPressed,
                          loading: model.isLoading,
                        ),
                        CustomTextButton(
                          title: "Already have an account?",
                          onPressed: _onRegisterPressed,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onForgotPasswordPressed() {
    Navigator.pushNamed(
      context,
      AppRoutes.forgotPasswordRoute,
    );
  }

  void _onRegisterPressed() {
    print("Register");
    Navigator.pushNamed(
      context,
      AppRoutes.registerRoute,
    );
  }
}
