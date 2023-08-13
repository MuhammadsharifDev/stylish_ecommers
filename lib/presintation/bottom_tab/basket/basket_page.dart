

import 'package:flutter/material.dart';

class BasketPage extends StatefulWidget {
  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  final List<String> pages = [
    'Page 1',
    'Page 2',
    'Page 3',
    'Page 4',
    'Page 5',
  ];

  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageIndex = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: pages.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.blue,
          child: Center(
            child: Text(
              pages[index],
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}

class CountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _currentPageIndex = context
        .dependOnInheritedWidgetOfExactType<_CountInheritedWidget>()!
        .currentPageIndex;

    return Padding(
      padding: EdgeInsets.only(right: 16.0),
      child: Text(
        'Count: ${_currentPageIndex + 1}',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class _CountInheritedWidget extends InheritedWidget {
  final int currentPageIndex;

  _CountInheritedWidget({
    required this.currentPageIndex,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(_CountInheritedWidget oldWidget) {
    return currentPageIndex != oldWidget.currentPageIndex;
  }
}
