import 'package:flutter/material.dart';
import '../../model/date_helper.dart';

class AddTimeComponent extends StatelessWidget {
  const AddTimeComponent(
      {Key? key, required this.dateHelper, this.isCentered = true})
      : super(key: key);
  final DateHelper dateHelper;
  final bool isCentered;
  @override
  build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: isCentered == true
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: <Widget>[
          const Icon(Icons.access_time, size: 12),
          Flexible(
            child: Text(
              dateHelper.getDate(),
            ),
          ),
        ],
      ),
    );
  }
}
