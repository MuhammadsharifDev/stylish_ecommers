import 'package:flutter/material.dart';

class UnSplashPage extends StatelessWidget {
  const UnSplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> pages = [
      'Page 1',
      'Page 2',
      'Page 3',
      'Page 4',
      'Page 5',
    ];
    return Scaffold(
      appBar: AppBar(
        leading: Text('1/3'),
        actions: [
          Text('Skip')
        ],
      ),
      body: SafeArea(
        child: PageView.builder(
            itemBuilder: (context, index) => Column(
              children: [
                Text(pages[index]),
              ],
            ),
          itemCount: pages.length,
        ),
      ),
    );
  }
}
