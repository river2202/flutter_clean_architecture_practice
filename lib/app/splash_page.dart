import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_practice/app/adaptive_carousel.dart';
import 'package:flutter_clean_architecture_practice/app/second_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('First page'),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: AdaptiveCarousel(itemRatio: 2 / 3, itemWidth: 150),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondPage()),
                );
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
