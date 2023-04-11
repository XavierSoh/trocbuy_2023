import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../county.dart';
import '../../providers/publish_provider.dart';
import '../../providers/selected_county.dart';
import '../../providers/selected_region.dart';

import '../../constants/constants.dart';
import '../../view/components/custom_cupertino_picker.dart';
import '../regs_class.dart';

class SwitchReg extends StatefulWidget {
  const SwitchReg({
    Key? key,
  }) : super(key: key);
  @override
  _SwitchRegState createState() => _SwitchRegState();
}

class _SwitchRegState extends State<SwitchReg> {
  // void onItemSelect(int index) {
  //   Provider.of<PublishProvider>(context, listen: false).changeSubRegOptions(
  //       Provider.of<PublishProvider>(context, listen: false)
  //           .subRegOptionsSelect,
  //       Provider.of<PublishProvider>(context, listen: false)
  //           .subRegOptionsSelectId);
  //   context.read<SelectedCounty>().change(
  //         context.read<SelectedCounty>().departement[index],
  //       );
  //   print(context.watch<SelectedCounty>().county.nameCountyLang);
  // }

  @override
  Widget build(BuildContext context) {
    if (context.watch<SelectedRegion>().region.idReg != -1) {
      Provider.of<SelectedCounty>(context).getDepartement(context);
      // context.read<SelectedCounty>().getDepartement(context);
      return CustomCupertinoPicker(
          ruleFilterName: context.watch<SelectedCounty>().county.nameCountyLang,
          onItemChanged: (index) {
            context.read<SelectedCounty>().change(
                  context.read<SelectedCounty>().departement[index],
                );
          },
          // onItemChanged: (index) {
          //   Provider.of<PublishProvider>(context, listen: false)
          //       .changeSubRegOptionsSelect(
          //           Reg0Auvergne.reg0Auvergne.keys.elementAt(index),
          //           Reg0Auvergne.reg0Auvergne.values.elementAt(index));
          // },
          onItemSelect: (_) =>
              // Provider.of<PublishProvider>(context, listen: false)
              //     .changeSubRegOptions(
              //         Provider.of<PublishProvider>(context, listen: false)
              //             .subRegOptionsSelect,
              //         Provider.of<PublishProvider>(context, listen: false)
              //             .subRegOptionsSelectId);
              // context.read<SelectedCounty>().county.nameCountyLang;
              // context.read<SelectedCounty>().county.idCounty;
              // context.read<SelectedCounty>().change(
              //       context.read<SelectedCounty>().departement[index],
              //     );
              print('id : ${context.read<SelectedCounty>().county.idCounty}')

          // print(context.watch<SelectedCounty>().county.nameCountyLang);
          ,
          children: context.watch<SelectedCounty>().departement.map((e) {
            return Text(e.nameCountyLang!);
          }).toList());
    } else {
      return const SizedBox(height: 0);
    }
    // switch (context.watch<SelectedRegion>().region.nameRegLang) {
    //   case 'Auvergne-Rhône-Alpes':
    //     return CustomCupertinoPicker(
    //         ruleFilterName: Provider.of<PublishProvider>(context).subRegOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubRegOptionsSelect(
    //                   Reg0Auvergne.reg0Auvergne.keys.elementAt(index),
    //                   Reg0Auvergne.reg0Auvergne.values.elementAt(index));
    //         },
    //         onItemSelect: onItemSelect,
    //         children: subRegsList0);
    //   case 'Bourgogne-Franche-Comté':
    //     return CustomCupertinoPicker(
    //         ruleFilterName: Provider.of<PublishProvider>(context).subRegOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubRegOptionsSelect(
    //                   Reg1Bourgogne.reg1Bourgogne.keys.elementAt(index),
    //                   Reg1Bourgogne.reg1Bourgogne.values.elementAt(index));
    //         },
    //         onItemSelect: onItemSelect,
    //         children: subRegsList1);
    //   case 'Bretagne':
    //     return CustomCupertinoPicker(
    //         ruleFilterName: Provider.of<PublishProvider>(context).subRegOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubRegOptionsSelect(
    //                   Reg2Bretagne.reg2Bretagne.keys.elementAt(index),
    //                   Reg2Bretagne.reg2Bretagne.values.elementAt(index));
    //         },
    //         onItemSelect: onItemSelect,
    //         children: subRegsList2);
    //   case 'Centre-Val de Loire':
    //     return CustomCupertinoPicker(
    //         ruleFilterName: Provider.of<PublishProvider>(context).subRegOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubRegOptionsSelect(
    //                   Reg3Centre.reg3Centre.keys.elementAt(index),
    //                   Reg3Centre.reg3Centre.values.elementAt(index));
    //         },
    //         onItemSelect: onItemSelect,
    //         children: subRegsList3);
    //   case 'Corse':
    //     return CustomCupertinoPicker(
    //         ruleFilterName: Provider.of<PublishProvider>(context).subRegOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubRegOptionsSelect(
    //                   Reg4Corse.reg4Corse.keys.elementAt(index),
    //                   Reg4Corse.reg4Corse.values.elementAt(index));
    //         },
    //         onItemSelect: onItemSelect,
    //         children: subRegsList4);
    //   case 'Grand Est':
    //     return CustomCupertinoPicker(
    //         ruleFilterName: Provider.of<PublishProvider>(context).subRegOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubRegOptionsSelect(
    //                   Reg5Grand.reg5Grand.keys.elementAt(index),
    //                   Reg5Grand.reg5Grand.values.elementAt(index));
    //         },
    //         onItemSelect: onItemSelect,
    //         children: subRegsList5);
    //   case 'Guadeloupe':
    //     return CustomCupertinoPicker(
    //         ruleFilterName: Provider.of<PublishProvider>(context).subRegOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubRegOptionsSelect(
    //                   Reg13Guadeloupe.reg13Guadeloupe.keys.elementAt(index),
    //                   Reg13Guadeloupe.reg13Guadeloupe.values.elementAt(index));
    //         },
    //         onItemSelect: onItemSelect,
    //         children: subRegsList13);
    //   case 'Guyane':
    //     return CustomCupertinoPicker(
    //         ruleFilterName: Provider.of<PublishProvider>(context).subRegOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubRegOptionsSelect(
    //                   Reg5Grand.reg5Grand.keys.elementAt(index),
    //                   Reg5Grand.reg5Grand.values.elementAt(index));
    //         },
    //         onItemSelect: onItemSelect,
    //         children: subRegsList5);
    //   case 'Hauts-de-France':
    //     return CustomCupertinoPicker(
    //         ruleFilterName: Provider.of<PublishProvider>(context).subRegOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubRegOptionsSelect(
    //                   Reg6Hauts.reg6Hauts.keys.elementAt(index),
    //                   Reg6Hauts.reg6Hauts.values.elementAt(index));
    //         },
    //         onItemSelect: onItemSelect,
    //         children: subRegsList6);
    //   case 'Île-de-France':
    //     return CustomCupertinoPicker(
    //         ruleFilterName: Provider.of<PublishProvider>(context).subRegOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubRegOptionsSelect(
    //                   Reg7Ile.reg7Ile.keys.elementAt(index),
    //                   Reg7Ile.reg7Ile.values.elementAt(index));
    //         },
    //         onItemSelect: onItemSelect,
    //         children: subRegsList7);
    //   case 'Martinique':
    //     return CustomCupertinoPicker(
    //         ruleFilterName: Provider.of<PublishProvider>(context).subRegOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubRegOptionsSelect(
    //                   Reg14Martinique.reg14Martinique.keys.elementAt(index),
    //                   Reg14Martinique.reg14Martinique.values.elementAt(index));
    //         },
    //         onItemSelect: onItemSelect,
    //         children: subRegsList14);
    //   case 'Mayotte':
    //     return CustomCupertinoPicker(
    //         ruleFilterName: Provider.of<PublishProvider>(context).subRegOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubRegOptionsSelect(
    //                   Reg17Mayotte.reg17Mayotte.keys.elementAt(index),
    //                   Reg17Mayotte.reg17Mayotte.values.elementAt(index));
    //         },
    //         onItemSelect: onItemSelect,
    //         children: subRegsList17);
    //   case 'Normandie':
    //     return CustomCupertinoPicker(
    //         ruleFilterName: Provider.of<PublishProvider>(context).subRegOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubRegOptionsSelect(
    //                   Reg8Normandie.reg8Normandie.keys.elementAt(index),
    //                   Reg8Normandie.reg8Normandie.values.elementAt(index));
    //         },
    //         onItemSelect: onItemSelect,
    //         children: subRegsList8);
    //   case 'Nouvelle-Aquitaine':
    //     return CustomCupertinoPicker(
    //         ruleFilterName: Provider.of<PublishProvider>(context).subRegOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubRegOptionsSelect(
    //                   Reg9Nouvelle.reg9Nouvelle.keys.elementAt(index),
    //                   Reg9Nouvelle.reg9Nouvelle.values.elementAt(index));
    //         },
    //         onItemSelect: onItemSelect,
    //         children: subRegsList9);
    //   case 'Occitanie':
    //     return CustomCupertinoPicker(
    //         ruleFilterName: Provider.of<PublishProvider>(context).subRegOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubRegOptionsSelect(
    //                   Reg10Occitanie.reg10Occitanie.keys.elementAt(index),
    //                   Reg10Occitanie.reg10Occitanie.values.elementAt(index));
    //         },
    //         onItemSelect: onItemSelect,
    //         children: subRegsList10);
    //   case 'Pays de la Loire':
    //     return CustomCupertinoPicker(
    //         ruleFilterName: Provider.of<PublishProvider>(context).subRegOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubRegOptionsSelect(
    //                   Reg11Pays.reg11Pays.keys.elementAt(index),
    //                   Reg11Pays.reg11Pays.values.elementAt(index));
    //         },
    //         onItemSelect: onItemSelect,
    //         children: subRegsList11);
    //   case 'Provence-Alpes-Côte d\'Azur':
    //     return CustomCupertinoPicker(
    //         ruleFilterName: Provider.of<PublishProvider>(context).subRegOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubRegOptionsSelect(
    //                   Reg12Provence.reg12Provence.keys.elementAt(index),
    //                   Reg12Provence.reg12Provence.values.elementAt(index));
    //         },
    //         onItemSelect: onItemSelect,
    //         children: subRegsList12);
    //   case 'La Réunion':
    //     return CustomCupertinoPicker(
    //         ruleFilterName: Provider.of<PublishProvider>(context).subRegOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubRegOptionsSelect(
    //                   Reg16Reunion.reg16Reunion.keys.elementAt(index),
    //                   Reg16Reunion.reg16Reunion.values.elementAt(index));
    //         },
    //         onItemSelect: onItemSelect,
    //         children: subRegsList16);
    //   case 'Autre Pays':
    //     return CustomCupertinoPicker(
    //         ruleFilterName: Provider.of<PublishProvider>(context).subRegOptions,
    //         onItemChanged: (index) {
    //           Provider.of<PublishProvider>(context, listen: false)
    //               .changeSubRegOptionsSelect(
    //                   Reg18Autre.reg18Autre.keys.elementAt(index),
    //                   Reg18Autre.reg18Autre.values.elementAt(index));
    //         },
    //         onItemSelect: onItemSelect,
    //         children: subRegsList18);

    //   default:
    //     return SizedBox(height: 0);
    // }
  }
}
