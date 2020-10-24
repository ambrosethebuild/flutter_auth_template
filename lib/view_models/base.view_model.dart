import 'package:flutter/widgets.dart';

class BaseViewModel extends ChangeNotifier {
  //
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  //
  void startLoading() {
    isLoading = true;
    FocusManager.instance.primaryFocus.unfocus();
    notifyListeners();
  }

  void stopLoading() {
    isLoading = false;
    notifyListeners();
  }
}
