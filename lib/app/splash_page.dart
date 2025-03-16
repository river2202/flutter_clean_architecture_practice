import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

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
          ],
        ),
      ),
    );
  }
}

class AdaptiveCarousel extends StatelessWidget {
  const AdaptiveCarousel({
    super.key,
    required this.itemRatio,
    required this.itemWidth,
  });

  final double itemRatio;
  final double itemWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemCount = (constraints.maxWidth / itemWidth).ceil();

        return FlutterCarousel(
          options: FlutterCarouselOptions(
            showIndicator: false,
            pageSnapping: false,
            disableCenter: true,
            slideIndicator: CircularSlideIndicator(),
            aspectRatio: itemRatio * itemCount,
            viewportFraction: 1.0 / itemCount,
            padEnds: false,
          ),
          items:
              [1, 2, 3, 4, 5].map((i) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: Colors.amber),
                  child: Text('text $i', style: TextStyle(fontSize: 16.0)),
                );
              }).toList(),
        );
      },
    );
  }
}
