import 'package:flutter/material.dart';

class IndexProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setProfileAdminEmpMngmtIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

class EmpFormIndexProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setNewEmpAdminIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

// =============== TABVIEW PROVIDER - ADMIN EMP MNGMT =============== //
class TabViewAdminProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void breadcrumbTabViewAdmin(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
