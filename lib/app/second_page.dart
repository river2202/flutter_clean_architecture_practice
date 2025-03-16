import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:rxdart/rxdart.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  FlutterCarouselController controller = FlutterCarouselController();

  final BehaviorSubject<({int currentPage, double pageDelta, int itemCount})>
  _slideIndicatorSubject = BehaviorSubject.seeded((
    currentPage: 0,
    pageDelta: 0,
    itemCount: 0,
  ));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Second Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.amber,
            child: StreamBuilder(
              stream: _slideIndicatorSubject.stream,
              builder:
                  (context, snapshot) => BarSlideIndicator(
                    currentPage: snapshot.data?.currentPage ?? 0,
                    pageDelta: snapshot.data?.pageDelta ?? 0,
                    pageTotalCount: snapshot.data?.itemCount ?? 0,
                  ),
            ),
          ),
          Expanded(
            child: FlutterCarousel(
              options: FlutterCarouselOptions(
                controller: controller,
                showIndicator: true,
                pageSnapping: true,
                disableCenter: true,
                viewportFraction: 1.0,
                aspectRatio: 1,
                padEnds: false,
                slideIndicator: _SlideIndicatorListener(
                  _slideIndicatorSubject.add,
                ),
              ),
              items:
                  [1, 2, 3, 4, 5].map((i) {
                    return Container(
                      // margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color:
                            Colors.primaries[Random().nextInt(
                              Colors.primaries.length,
                            )],
                      ),
                      child: Center(
                        child: Text(
                          'text $i',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class BarSlideIndicator extends StatelessWidget {
  const BarSlideIndicator({
    super.key,
    required this.currentPage,
    required this.pageDelta,
    required this.pageTotalCount,
  });

  final int currentPage;
  final double pageDelta;
  final int pageTotalCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 2,
      children: List.generate(
        pageTotalCount,
        (index) => SliderBar(
          value: index == currentPage + 1 ? pageDelta : 0.0,
          reverse: index <= currentPage,
        ),
      ),
    );
  }
}

class SliderBar extends StatelessWidget {
  const SliderBar({super.key, required this.value, required this.reverse});

  final double value;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 10,
      child: LinearProgressIndicator(
        minHeight: 10,
        value: value,
        color: reverse ? Colors.grey : Colors.blue,
        backgroundColor: reverse ? Colors.blue : Colors.grey,
      ),
    );
  }
}

class _SlideIndicatorListener extends SlideIndicator {
  _SlideIndicatorListener(this.onSlideIndicatorChanged);

  ValueChanged<({int currentPage, double pageDelta, int itemCount})>
  onSlideIndicatorChanged;

  @override
  Widget build(int currentPage, double pageDelta, int itemCount) {
    onSlideIndicatorChanged((
      currentPage: currentPage,
      pageDelta: pageDelta,
      itemCount: itemCount,
    ));
    return Offstage();
  }
}
