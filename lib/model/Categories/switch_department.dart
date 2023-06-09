import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../county.dart';
import '../../providers/selected_county.dart';
import '../../providers/selected_region.dart';

class SwitchDepartment extends StatefulWidget {
  const SwitchDepartment({
    Key? key,
  }) : super(key: key);

  @override
  _SwitchDepartmentState createState() => _SwitchDepartmentState();
}

class _SwitchDepartmentState extends State<SwitchDepartment> {

  @override
  Widget build(BuildContext context) {
    if (context.watch<SelectedRegion>().region.idReg != -1) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              /*side: BorderSide(color: kPrincipal_colour)*/
            ),
            elevation: 8),
        onPressed: null,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: DropdownButton<County>(
            dropdownColor: Colors.white,
            focusColor: Colors.white,
            underline: const SizedBox.shrink(),
            value: context.watch<SelectedCounty>().county,
            items: context
                .watch<SelectedCounty>()
                .department
                .map(
                  (e) => DropdownMenuItem<County>(value: e, child: Text(e.nameCountyLang ?? '--')),
                )
                .toList(),
            onChanged: (value) {
              context.read<SelectedCounty>().change(value!);
            },
          ),
        ),
      );

    } else {
      return const SizedBox(height: 0);
    }

  }
}
