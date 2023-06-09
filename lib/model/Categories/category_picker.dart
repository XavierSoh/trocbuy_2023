import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trocbuy/model/cat_lang.dart';
import 'package:trocbuy/providers/selected_cat_lang.dart';
import 'package:trocbuy/view/components/custom_cupertino_picker.dart';

class CategoryPicker extends StatelessWidget {
  const CategoryPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        child: DropdownButton<CatLang>(
          dropdownColor: Colors.white,
          focusColor: Colors.white,
          underline: const SizedBox.shrink(),
          value: Provider.of<SelectedCatLang>(
            context,
          ).catLang,
          items: CatLang.cats
              .map(
                (e) => DropdownMenuItem<CatLang>(value: e, child: Text(e.nameCatLang??'--')),
          )
              .toList(),
          onChanged: (value) {

            Provider.of<SelectedCatLang>(context, listen: false)
                .changeSubCatLang(CatLang(nameCatLang: 'Choisissez la sous catégorie', parCat: -1));
            Provider.of<SelectedCatLang>(context, listen: false)
                .changeCatLang(value!);


          },
        ),
      ),
    );
    return CustomCupertinoPicker(
      ruleFilterName: Provider.of<SelectedCatLang>(
        context,
      ).catLang.nameCatLang,
      children: CatLang.cats
          .map(
            (e) => Text(e.nameCatLang!),
      )
          .toList(),
      onItemChanged: (index) {
        Provider.of<SelectedCatLang>(context, listen: false)
            .changeCatLang(CatLang.cats[index]);

        // Provider.of<PublishProvider>(context, listen: false)
        //     .changeCategoriesSelect(
        //         AdsCats.adsCats.keys.elementAt(index));
      },
      onItemSelect: (_) {
        // Provider.of<PublishProvider>(context, listen: false)
        //     .changeSubCatsOptions('Choisissez la sous catégorie');
        // Provider.of<PublishProvider>(context, listen: false)
        //     .changeCategoriesName(
        //         Provider.of<PublishProvider>(context, listen: false)
        //             .categoriesSelect);
        Navigator.pop(context);
      },
    );
  }
}