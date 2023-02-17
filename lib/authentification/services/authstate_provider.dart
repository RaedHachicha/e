import 'package:flutter/cupertino.dart';

class AuthStateProvider extends ChangeNotifier {
  int loginState = 0;


  void changeState(int state) {
    loginState = state;
    notifyListeners();
  }
}
