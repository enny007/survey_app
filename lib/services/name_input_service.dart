import 'package:flutter/cupertino.dart';

class NameInputService with ChangeNotifier {
  String _text = '';

  String get text => _text;

  set text(String nameText) {
    if (nameText != text) {
      _text = nameText;
      notifyListeners();
    }
  }
}
