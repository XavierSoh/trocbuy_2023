import 'package:flutter/material.dart';
import '../../components/app_bar/default_app_bar.dart';

class UpdateImages extends StatelessWidget {
  const UpdateImages({Key? key}) : super(key: key);
  static const String id = 'update_images';
  @override
  build(BuildContext context) {
    return const Scaffold(
        appBar: DefaultAppBar(
      title: 'Pictures',
    ));
  }
}
