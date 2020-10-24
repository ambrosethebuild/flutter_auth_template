import 'package:flutter/material.dart';
import 'package:flutter_auth_template/constants/app_paddings.dart';
import 'package:flutter_auth_template/constants/app_routes.dart';
import 'package:flutter_auth_template/constants/app_text_styles.dart';
import 'package:flutter_auth_template/services/validator.service.dart';
import 'package:flutter_auth_template/utils/ui_spacer.dart';
import 'package:flutter_auth_template/view_models/register.view_model.dart';
import 'package:flutter_auth_template/widgets/base.page.dart';
import 'package:flutter_auth_template/widgets/buttons/custom_button.dart';
import 'package:flutter_auth_template/widgets/custom_text_form_field.dart';
import 'package:flutter_auth_template/widgets/rounded_container.dart';
import 'package:stacked/stacked.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      viewModelBuilder: () => RegisterViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return BasePage(
          title: "Register",
          body: SafeArea(
            child: ListView(
              padding: AppPaddings.bigContentPadding(),
              children: [
                //title
                Text(
                  "Let's start with\nRegister!",
                  style: AppTextStyle.h0TitleTextStyle(),
                ),

                //container with shadow
                UiSpacer.verticalSpace(),
                Form(
                  key: model.formKey,
                  child: RoundedContainer(
                    body: Column(
                      children: [
                        //name
                        CustomTextFormField(
                          labelText: "Full name",
                          textInputAction: TextInputAction.next,
                          validator: FormValidator.validateName,
                        ),
                        UiSpacer.formVerticalSpace(),
                        //email
                        CustomTextFormField(
                          labelText: "Email",
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: FormValidator.validateEmail,
                        ),
                        UiSpacer.formVerticalSpace(),
                        //password
                        CustomTextFormField(
                          labelText: "Password",
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          validator: FormValidator.validatePassword,
                        ),
                        UiSpacer.formVerticalSpace(),
                        CustomButton(
                          title: "Register",
                          onPressed: model.onRegisterPressed,
                          loading: model.isLoading,
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
}
