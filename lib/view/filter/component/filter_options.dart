import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import '../../../model/filter_option.dart';
import 'title_widget.dart';
import '../filter_providers/cat_lang_filter_prov.dart';

import '../filter_functions.dart';
import '../filter_providers/options_prov.dart';

class FilterOptions extends StatelessWidget {
  const FilterOptions({Key? key}) : super(key: key);
  static const kNothinSelected = "nothin_for_now";
  static const kSelectedValue = "selected_value";
  static const initial = "--";
  @override
  Widget build(BuildContext context) {
    final watchCategory = context.watch<CatLangFilterProv>().catLang;
    return FutureBuilder(
      future: FilterFunctions.filterOptions(watchCategory.idCat!),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;
          case ConnectionState.waiting:
            return const Center(
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 32.0, top: 8.0),
                  child: SizedBox(
                    width: 15,
                    height: 15,
                    child: CupertinoActivityIndicator(),
                  ),
                ),
              ),
            );
          case ConnectionState.active:
            break;
          case ConnectionState.done:
            if (snapshot.hasData) {
              final readOptionsProv = context.read<OptionsProv>();
              WidgetsBinding.instance.addPostFrameCallback(
                (timeStamp) {
                  readOptionsProv.clearOptions();
                },
              );

              var filterOptions =
                  FilterFunctions.reformatFilterOptions(snapshot.data);

              filterOptions = filterOptions.toSet().toList();
              return ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, index) {
                  ///ADD OPTION FIELD NAME TO PROVIDER WITH VALUE "nothing"
                  WidgetsBinding.instance.addPostFrameCallback(
                    (timeStamp) {
                      readOptionsProv.changeOptions(filterOptions);
                    },
                  );

                  final FilterOption filterOption = filterOptions[index];
                  String value = initial;
                  return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return ListTile(
                        title: TitleWidget(
                            title:
                                filterOption.optionsNames.first.nameCatOptLang),
                        subtitle: DropdownButton<String>(
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_downward),
                          value: value,
                          onChanged: (String? newValue) {
                            setState(
                              () {
                                value = newValue!;
                              },
                            );
                            filterOption.selectedValue = value.toString();
                          },
                          items: filterOption.optionValues
                              .map<DropdownMenuItem<String>>(
                            (value) {
                              return DropdownMenuItem<String>(
                                value: value as String,
                                child: Text(value),
                              );
                            },
                          ).toList(),
                        ),
                      );
                    },
                  );
                },
              );
            }
            break;
        }

        return const SizedBox.shrink();
      },
    );
  }
}
