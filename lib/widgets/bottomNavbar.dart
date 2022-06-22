import 'package:flutter/material.dart';
import 'package:myapplicationtest/pages/calculator.dart';
import 'package:myapplicationtest/pages/loading_screen.dart';
import 'package:myapplicationtest/pages/page_state.dart';

class Tabs extends StatefulWidget {
  Tabs({Key? key}) : super(key: key);

  @override
  _Tabs createState() => _Tabs();
}

class _Tabs extends State<Tabs> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    const customOrange = Color.fromRGBO(255, 165, 109, 1);
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate), label: "Calcul"),
            BottomNavigationBarItem(icon: Icon(Icons.warning), label: "Catalogue"),
          ],
          onTap: (int index) {
            setState(() => _currentIndex = index);
          },
        ),
        body: _buildPage(_currentIndex));
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return PageState();
      case 1:
        return CalculatorPage();
      case 2:
        return LoadingScreen();
      default:
        return PageState();
    }
  }
}