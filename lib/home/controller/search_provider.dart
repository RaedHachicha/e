import 'package:flutter/cupertino.dart';

class SearchStateProvider extends ChangeNotifier {
  bool isSearching = false;
  bool isWriting = false;

  void changeSearchingState() {
    isSearching = !isSearching;
    notifyListeners();
  }

  void changeWritingState(bool value) {
    isWriting = value;
    notifyListeners();
  }
}
