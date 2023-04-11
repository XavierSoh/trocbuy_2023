import 'package:flutter/material.dart';

class DropdownStyle1 extends StatelessWidget {
  final String? getKey;
  final getValue;
  DropdownStyle1({this.getKey, this.getValue});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Center(
        child: Text(
          getKey!,
        ),
      ),
      width: MediaQuery.of(context).size.width,
      color: getValue == false ? Colors.grey[500] : Colors.white,
    );
  }
}
