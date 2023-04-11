import 'package:flutter/material.dart';
import '../../../res/styles.dart';

class RegionArea extends StatefulWidget {
  const RegionArea({Key? key}) : super(key: key);

  @override
  State<RegionArea> createState() => _RegionAreaState();
}

class _RegionAreaState extends State<RegionArea> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: Stack(
          children: [
            Slider(
              activeColor: Colors.deepOrange,
              inactiveColor: Styles.principalColor.withOpacity(.5),
              value: _currentSliderValue,
              max: 200,
              min: 0,
              divisions: 10,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 24.0, top: 40.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "0",
                  ),
                  Text(
                    "200 km",
                  ),
                ],
              ),
            ),
            const Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, top: 8.0, bottom: 0.0),
                child: Text(
                  "Dans un rayon de ",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
