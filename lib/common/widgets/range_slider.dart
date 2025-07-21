import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pcom_app/app/core/core.dart';

class MyRangeSlider extends StatefulWidget {
  const MyRangeSlider({super.key});

  @override
  _RangeSliderExampleState createState() => _RangeSliderExampleState();
}

class _RangeSliderExampleState extends State<MyRangeSlider> {
  RangeValues _currentRangeValues = const RangeValues(0, 300);

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: _currentRangeValues,
      min: 0,
      max: 300,
      divisions: 4,
      activeColor: R.theme.red,
      inactiveColor: R.theme.red.withOpacity(0.2),
      labels: RangeLabels(
        '\$${_currentRangeValues.start.round().toString()}k',
        '\$${_currentRangeValues.end.round().toString()}k',
      ),
      onChanged: (RangeValues values) {
        setState(() {
          _currentRangeValues = values;
        });
      },
    );
  }
}