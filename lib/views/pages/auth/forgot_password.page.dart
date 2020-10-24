import 'package:flutter/material.dart';
import 'package:flutter_auth_template/constants/app_paddings.dart';
import 'package:flutter_auth_template/constants/app_text_styles.dart';
import 'package:flutter_auth_template/services/validator.service.dart';
import 'package:flutter_auth_template/utils/ui_spacer.dart';
import 'package:flutter_auth_template/view_models/forgot_password.view_model.dart';
import 'package:flutter_auth_template/widgets/base.page.dart';
import 'package:flutter_auth_template/widgets/buttons/custom_button.dart';
import 'package:flutter_auth_template/widgets/custom_text_form_field.dart';
import 'package:flutter_auth_template/widgets/rounded_container.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
      viewModelBuilder: () => ForgotPasswordViewModel(context),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return BasePage(
          title: "Forgot Password",
          body: SafeArea(
            child: ListView(
              padding: AppPaddings.bigContentPadding(),
              children: [
                //title
                Text(
                  "Reset Account Password",
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
                          validator: FormValidator.validateEmail,
                        ),
                        UiSpacer.formVerticalSpace(),
                        CustomButton(
                          title: "Reset Password",
                          onPressed: model.onResetPasswordPressed,
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
