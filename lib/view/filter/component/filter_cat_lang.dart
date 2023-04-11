import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import '../../../model/cat_lang.dart';
import '../../../res/strings.dart';
import '../../../res/styles.dart';
import 'title_widget.dart';
import '../filter_providers/cat_lang_filter_prov.dart';

class FilterCatLang extends StatelessWidget {
  const FilterCatLang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readCategory = context.read<CatLangFilterProv>();
    final watchCategory = context.watch<CatLangFilterProv>();

    return ListTile(
      title: TitleWidget(title: Strings.kCategory),
      subtitle: DropdownButton<CatLang>(
        value: watchCategory.catLang,
        isExpanded: true,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        underline: Container(
          height: 2,
          color: Styles.principalColor,
        ),
        onChanged: (CatLang? newValue) async {
          readCategory.changeCategory(newValue!);
        },
        items: CatLang.catsLang
            .where(
              (element) => element.parCat != 0,
            )
            .map<DropdownMenuItem<CatLang>>(
              (CatLang e) => DropdownMenuItem<CatLang>(
                value: e,
                child: Text(
                  e.nameCatLang!,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
