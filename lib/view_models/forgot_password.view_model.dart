import 'package:flutter/material.dart';
import 'base.view_model.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  //the textediting controllers
  TextEditingController emailTEC = new TextEditingController();

  void initialise() {}

  void onResetPasswordPressed() async {
    // Validate returns true if the form is valid, otherwise false.
    if (formKey.currentState.validate()) {
      //
      startLoading();
      await Future.delayed(Duration(seconds: 5));
      stopLoading();
    }
  }
}
