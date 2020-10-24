import 'package:flutter/material.dart';
import 'base.view_model.dart';

class RegisterViewModel extends BaseViewModel {
  //the textediting controllers
  TextEditingController nameTEC = new TextEditingController();
  TextEditingController emailTEC = new TextEditingController();
  TextEditingController passwordTEC = new TextEditingController();

  RegisterViewModel(BuildContext context) {
    this.viewContext = context;
  }

  void initialise() {}

  void onRegisterPressed() async {
    // Validate returns true if the form is valid, otherwise false.
    if (formKey.currentState.validate()) {
      //
      startLoading();
      await Future.delayed(Duration(seconds: 5));
      stopLoading();
    }
  }
}
