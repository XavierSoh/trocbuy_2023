import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cat_lang.dart';
import '../../providers/publish_provider.dart';
import '../../providers/selected_cat_lang.dart';

import '../../view/components/custom_cupertino_picker.dart';

class SwitchCat extends StatefulWidget {
  const SwitchCat({Key? key}) : super(key: key);

  @override
  _SwitchCatState createState() => _SwitchCatState();
}

class _SwitchCatState extends State<SwitchCat> {
  void onItemSelect() {
    Provider.of<PublishProvider>(context, listen: false).changeSubCatsOptions(
        Provider.of<PublishProvider>(context, listen: false)
            .subCatsOptionsSelect);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    List<CatLang> subCAteg = CatLang.Subcats.where((element) =>
        element.parCat ==
        Provider.of<SelectedCatLang>(context).catLang.idCat).toList();

    subCAteg = [
      ...[CatLang(nameCatLang: 'Choisissez la sous catégorie', parCat: -1)],
      ...subCAteg
    ];
    if (subCAteg.isNotEmpty) {
      return CustomCupertinoPicker(
          ruleFilterName:
              Provider.of<SelectedCatLang>(context).subCatLang.nameCatLang,
          onItemChanged: (index) {
            Provider.of<SelectedCatLang>(context, listen: false)
                .changeSubCatLang(subCAteg[index]);
          },
          onItemSelect: (_) => onItemSelect,
          children: subCAteg.map((e) => Text(e.nameCatLang!)).toList());
    } else {
      return const SizedBox(height: 0);
    }
    // switch (Provider.of<PublishProvider>(context).categoriesName) {
    //   case 'ANIMAUX':
    //     return CustomCupertinoPicker(
    //         ruleFilterName:
    //             Provider.of<PublishProvider>(context).subCatsOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubCatsOptionsSelect(
    //                   Cat0Animaux.cat0Animaux.keys.elementAt(index));
    //         },
    //         onItemSelect: (_) => onItemSelect,
    //         children: subCatsList0);
    //   case 'BEBE-PUERICULTURE':
    //     return CustomCupertinoPicker(
    //         ruleFilterName:
    //             Provider.of<PublishProvider>(context).subCatsOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubCatsOptionsSelect(
    //                   Cat1Bebe.cat1Bebe.keys.elementAt(index));
    //         },
    //         onItemSelect: (_) => onItemSelect,
    //         children: subCatsList1);
    //   case 'EMPLOI':
    //     return CustomCupertinoPicker(
    //         ruleFilterName:
    //             Provider.of<PublishProvider>(context).subCatsOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubCatsOptionsSelect(
    //                   Cat2Emploi.cat2Emploi.keys.elementAt(index));
    //         },
    //         onItemSelect: (_) => onItemSelect,
    //         children: subCatsList2);
    //   case 'IMMOBILIER':
    //     return CustomCupertinoPicker(
    //         ruleFilterName:
    //             Provider.of<PublishProvider>(context).subCatsOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubCatsOptionsSelect(
    //                   Cat3Immobiler.cat3Immobiler.keys.elementAt(index));
    //         },
    //         onItemSelect: (_) => onItemSelect,
    //         children: subCatsList3);
    //   case 'MULTIMEDIA':
    //     return CustomCupertinoPicker(
    //         ruleFilterName:
    //             Provider.of<PublishProvider>(context).subCatsOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubCatsOptionsSelect(
    //                   Cat4Multimedia.cat4Multimedia.keys.elementAt(index));
    //         },
    //         onItemSelect: (_) => onItemSelect,
    //         children: subCatsList4);
    //   case 'JEUX-CULTURE-LOISIRS':
    //     return CustomCupertinoPicker(
    //         ruleFilterName:
    //             Provider.of<PublishProvider>(context).subCatsOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubCatsOptionsSelect(
    //                   Cat5JeuxCulture.cat5JeuxCulture.keys.elementAt(index));
    //         },
    //         onItemSelect: (_) => onItemSelect,
    //         children: subCatsList5);
    //   case 'MAISON':
    //     return CustomCupertinoPicker(
    //         ruleFilterName:
    //             Provider.of<PublishProvider>(context).subCatsOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubCatsOptionsSelect(
    //                   Cat6Maison.cat6Maison.keys.elementAt(index));
    //         },
    //         onItemSelect: (_) => onItemSelect,
    //         children: subCatsList6);
    //   case 'MODE-BEAUTE-BIJOUX':
    //     return CustomCupertinoPicker(
    //         ruleFilterName:
    //             Provider.of<PublishProvider>(context).subCatsOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubCatsOptionsSelect(
    //                   Cat7ModeBeaute.cat7ModeBeaute.keys.elementAt(index));
    //         },
    //         onItemSelect: (_) => onItemSelect,
    //         children: subCatsList7);
    //   case 'MATERIEL PROFESSIONNEL':
    //     return CustomCupertinoPicker(
    //         ruleFilterName:
    //             Provider.of<PublishProvider>(context).subCatsOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubCatsOptionsSelect(
    //                   Cat8MaterialPro.cat8MaterialPro.keys.elementAt(index));
    //         },
    //         onItemSelect: (_) => onItemSelect,
    //         children: subCatsList8);
    //   case 'RENCONTRE':
    //     return CustomCupertinoPicker(
    //         ruleFilterName:
    //             Provider.of<PublishProvider>(context).subCatsOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubCatsOptionsSelect(
    //                   Cat9Rencontre.cat9Rencontre.keys.elementAt(index));
    //         },
    //         onItemSelect: (_) => onItemSelect,
    //         children: subCatsList9);
    //   case 'SERVICES':
    //     return CustomCupertinoPicker(
    //         ruleFilterName:
    //             Provider.of<PublishProvider>(context).subCatsOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubCatsOptionsSelect(
    //                   Cat10Service.cat10Service.keys.elementAt(index));
    //         },
    //         onItemSelect: (_) => onItemSelect,
    //         children: subCatsList10);
    //   case 'VACANCES':
    //     return CustomCupertinoPicker(
    //         ruleFilterName:
    //             Provider.of<PublishProvider>(context).subCatsOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubCatsOptionsSelect(
    //                   Cat11Vacances.cat11Vacances.keys.elementAt(index));
    //         },
    //         onItemSelect: (_) => onItemSelect,
    //         children: subCatsList11);
    //   case 'VEHICULES':
    //     return CustomCupertinoPicker(
    //         ruleFilterName:
    //             Provider.of<PublishProvider>(context).subCatsOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubCatsOptionsSelect(
    //                   Cat12Vehicules.cat12Vehicules.keys.elementAt(index));
    //         },
    //         onItemSelect: (_) => onItemSelect,
    //         children: subCatsList12);
    //   case 'DIVERS':
    //     return CustomCupertinoPicker(
    //         ruleFilterName:
    //             Provider.of<PublishProvider>(context).subCatsOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubCatsOptionsSelect(Cat13DiversAutres
    //                   .cat13DiversAutres.keys
    //                   .elementAt(index));
    //         },
    //         onItemSelect: (_) => onItemSelect,
    //         children: subCatsList13);

    //   default:
    //     return const SizedBox(height: 0);
    // }
  }
}
