import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCupertinoPicker extends StatefulWidget {
  final String? ruleFilterName;
  final Function(int value)? onItemChanged;
  final Function(int value)? onItemSelect;
  final List<Widget>? children;
  final String? filterName;

  final String? text;

  CustomCupertinoPicker(
      {@required this.ruleFilterName,
      @required this.onItemChanged,
      @required this.children,
      this.filterName,
      this.onItemSelect,
      this.text});
  @override
  _CustomCupertinoPickerState createState() => _CustomCupertinoPickerState();
}

class _CustomCupertinoPickerState extends State<CustomCupertinoPicker> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      // ignore: deprecated_member_use
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                /*side: BorderSide(color: kPrincipal_colour)*/
              ),
            elevation: 8
          ),
          onPressed: () {
            showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0),
                        )),
                    height: MediaQuery.of(context).size.height / 3.5,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CupertinoButton(
                                  child: const Text(
                                    'Sélectionner',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    widget.onItemSelect;
                                    Navigator.pop(context);
                                  }),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 6,
                          child: Center(
                            child: CupertinoPicker(
                                backgroundColor: Colors.white,
                                itemExtent: 28,
                                squeeze: .95,
                                scrollController:
                                    FixedExtentScrollController(initialItem: 0),
                                diameterRatio: 4,
                                children: widget.children!,
                                onSelectedItemChanged: widget.onItemChanged!),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
          child: Text(
            widget.ruleFilterName!,
            style: const TextStyle(fontSize: 18.0, fontFamily: 'ytv'),
          )),
    );
  }
}
