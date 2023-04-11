import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'title_widget.dart';
import '../filter_providers/price_min_max.dart';

class PrixMaxMin extends StatelessWidget {
  const PrixMaxMin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final read = context.read<PriceMinMaxProv>();

    return ListTile(
      isThreeLine: true,
      title: const TitleWidget(title: 'Prix (€)'),
      subtitle: Column(
        children: [
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: TextFormField(
                  onChanged: (newValue) {
                    read.changeMinPrice(
                      double.parse(
                        newValue,
                      ),
                    );
                  },
                  enabled: true,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Prix mini',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.0))),
                ),
                width: MediaQuery.of(context).size.width / 2.5,
              ),
              const Text('à'),
              SizedBox(
                child: TextFormField(
                  onChanged: (newValue) {
                    read.changeMaxPrice(
                      double.parse(
                        newValue,
                      ),
                    );
                  },
                  enabled: true,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Prix maximum',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.0),
                    ),
                  ),
                ),
                width: MediaQuery.of(context).size.width / 2.5,
              )
            ],
          ),
        ],
      ),
    );
  }
}
