import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_template/requests/auth.request.dart';
import 'base.view_model.dart';

class LoginViewModel extends BaseViewModel {
  //the textediting controllers
  TextEditingController emailTEC = new TextEditingController();
  TextEditingController passwordTEC = new TextEditingController();

  //
  AuthRequest _authRequest = AuthRequest();

  LoginViewModel(BuildContext context) {
    this.viewContext = context;
  }

  void initialise() {
    //
    emailTEC.text = "client@demo.com";
    passwordTEC.text = "password";
  }

  void onLoginPressed() async {
    // Validate returns true if the form is valid, otherwise false.
    if (formKey.currentState.validate()) {
      //
      startLoading();
      final apiResponse = await _authRequest.loginRequest(
        email: emailTEC.text,
        password: passwordTEC.text,
      );
      stopLoading();

      if (apiResponse.hasError()) {
        //there was an error
        CoolAlert.show(
          context: viewContext,
          type: CoolAlertType.error,
          text: apiResponse.message,
        );
      } else {
        //everything works well
        print("Works well");
      }
    }
  }
}
