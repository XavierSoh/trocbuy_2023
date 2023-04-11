import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/publish_provider.dart';
import '../../providers/selected_cat_lang.dart';

import '../../constants/constants.dart';
import '../../view/account/component/textformfield_normal.dart';
import '../../view/components/custom_cupertino_picker.dart';
import 'cats_opts_class.dart';

class SwitchSubCatsOptions extends StatefulWidget {
  const SwitchSubCatsOptions({Key? key}) : super(key: key);

  @override
  _SwitchSubCatsOptionsState createState() => _SwitchSubCatsOptionsState();
}

class _SwitchSubCatsOptionsState extends State<SwitchSubCatsOptions> {
  @override
  Widget build(BuildContext context) {
    switch (Provider.of<SelectedCatLang>(context, listen: false)
        .subCatLang
        .nameCatLang) {
      case 'Hamsters/Lapins/Rongeurs':
        return Container(
          child: hamsters_Lapins_Rongeurs(),
        );
        break;

      case 'Chiens/Chats/Chevaux':
        return Container(
          child: chiens_Chats_Chevaux_Or_Adoption_DonAnimaux(),
        );
        break;
      case 'Adoption-Don Animaux':
        return Container(
          child: chiens_Chats_Chevaux_Or_Adoption_DonAnimaux(),
        );
        break;
      case 'Vêtements bébé':
        return Container(
          child: modeEnfant_Or_VetementsBebe(),
        );
        break;
      case 'Vêtements future maman':
        return Container(
          child:
              modeFemme_Or_ModeHomme_Or_VetementsFutureMaman_Or_PretAPorter(),
        );
        break;
      case 'Colocations':
        return Container(
          child: colocationsOrLocation(),
        );
        break;
      case 'Ventes immobilières':
        return Container(
          child: ventesImmobilieres(),
        );
        break;
      case 'Locations':
        return Container(
          child: colocationsOrLocation(),
        );
        break;
      case 'Chaussures':
        return Container(
          child: chaussures(),
        );
      case 'Prêt-à-porter':
        return Container(
          child:
              modeFemme_Or_ModeHomme_Or_VetementsFutureMaman_Or_PretAPorter(),
        );

      case 'Location vêtements':
        return Container(
          child: locationVetements(),
        );
        break;
      case 'Mode Femme':
        return Container(
          child:
              modeFemme_Or_ModeHomme_Or_VetementsFutureMaman_Or_PretAPorter(),
        );
        break;
      case 'Mode Homme':
        return Container(
          child:
              modeFemme_Or_ModeHomme_Or_VetementsFutureMaman_Or_PretAPorter(),
        );
        break;
      case 'Mode Enfant':
        return Container(
          child: modeEnfant_Or_VetementsBebe(),
        );
        break;
      case 'Prestations de services':
        return Container(
          child: prestationsDeServices(),
        );
        break;
      case 'Locations et Gîtes':
        return Container(
          child: locationsEtGites_Or_ChambresHotes(),
        );
        break;
      case 'Chambres d\'hôtes':
        return Container(
          child: locationsEtGites_Or_ChambresHotes(),
        );
        break;

      case 'Motos/Scooter/Quad':
        return Container(
          child: motosScooterQuad(),
        );
        break;
      case 'Caravaning':
        return Container(
          child: caravaning(),
        );
        break;

      case 'Voitures':
        return Container(
          child: voitures(),
        );
        break;

      case 'Nautisme':
        return Container(
          child: nautisme(),
        );
        break;
      case 'Utilitaires':
        return Container(
          child: utilitaires(),
        );
        break;

      default:
        return const SizedBox(
          height: 0,
        );
    }
  }

  void onItemChangedFunction(int index, Map<String, dynamic> map) {
    Provider.of<PublishProvider>(context, listen: false)
        .changeNameId(map.keys.elementAt(index), map.values.elementAt(index));
  }

  void onItemSelectedFunction(Map<String, dynamic> map) {
    for (var element in map.keys) {
      Provider.of<PublishProvider>(context, listen: false)
          .moreInfo
          .remove(element);
    }
    Provider.of<PublishProvider>(context, listen: false).addToMoreInfoMap(
        Provider.of<PublishProvider>(context, listen: false).idCatsSelect,
        Provider.of<PublishProvider>(context, listen: false).nameCatsSelect);
    Navigator.pop(context);
  }

  String? validate(value) {
    if (value.toString().isEmpty) {
      return "*";
    }
    return null;
  }

  Widget hamsters_Lapins_Rongeurs() {
    return Column(
      children: [
        CustomCupertinoPicker(
          ruleFilterName: 'Vaccine?',
          children: subCatsListAdsCats0Animaux1Hamsters,
          onItemChanged: (index) {
            onItemChangedFunction(
                index, AdsCats0Animaux1Hamsters.adsCats0Animaux1Hamsters);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(
                AdsCats0Animaux1Hamsters.adsCats0Animaux1Hamsters);
          },
        ),
      ],
    );
  }

  Widget chiens_Chats_Chevaux_Or_Adoption_DonAnimaux() {
    return Column(
      children: [
        CustomCupertinoPicker(
          ruleFilterName: 'Vaccine?',
          children: subCatsListAdsCats0Animaux1Hamsters,
          onItemChanged: (index) {
            onItemChangedFunction(
                index, AdsCats0Animaux1Hamsters.adsCats0Animaux1Hamsters);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(
                AdsCats0Animaux1Hamsters.adsCats0Animaux1Hamsters);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormFieldNormal(
            hintText: 'Age',
            keyboardType: TextInputType.number,
            controller: Provider.of<PublishProvider>(context).ageController,
            validator: validate,
          ),
        ),
      ],
    );
  }

  Widget modeEnfant_Or_VetementsBebe() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextFormFieldNormal(
            hintText: 'Taille',
            keyboardType: TextInputType.number,
            controller: Provider.of<PublishProvider>(context).tailleController,
            validator: validate,
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormFieldNormal(
            hintText: 'Age',
            keyboardType: TextInputType.number,
            controller: Provider.of<PublishProvider>(context).ageController,
            validator: validate,
          ),
        ],
      ),
    );
  }

  Widget modeFemme_Or_ModeHomme_Or_VetementsFutureMaman_Or_PretAPorter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextFormFieldNormal(
            hintText: 'Taille',
            keyboardType: TextInputType.number,
            controller: Provider.of<PublishProvider>(context).tailleController,
            validator: validate,
          ),
        ],
      ),
    );
  }

  Widget colocationsOrLocation() {
    return Column(
      children: [
        CustomCupertinoPicker(
          ruleFilterName: 'Interieur',
          children: subCatsListAdsCats3Immobilier0Interieur,
          onItemChanged: (index) {
            onItemChangedFunction(index,
                AdsCats3Immobilier0Interieur.adsCats3Immobilier0Interieur);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(
                AdsCats3Immobilier0Interieur.adsCats3Immobilier0Interieur);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        CustomCupertinoPicker(
          ruleFilterName: 'Type de bien',
          children: subCatsListAdsCats3Immobilier1Type,
          onItemChanged: (index) {
            onItemChangedFunction(
                index, AdsCats3Immobilier1Type.adsCats3Immobilier1Type);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(
                AdsCats3Immobilier1Type.adsCats3Immobilier1Type);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormFieldNormal(
            hintText: 'Surface',
            keyboardType: TextInputType.number,
            controller: Provider.of<PublishProvider>(context).surfaceController,
            validator: validate,
          ),
        ),
      ],
    );
  }

  Widget ventesImmobilieres() {
    return Column(
      children: [
        CustomCupertinoPicker(
          ruleFilterName: 'Type de bien',
          children: subCatsListAdsCats3Immobilier1Type,
          onItemChanged: (index) {
            onItemChangedFunction(
                index, AdsCats3Immobilier1Type.adsCats3Immobilier1Type);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(
                AdsCats3Immobilier1Type.adsCats3Immobilier1Type);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        CustomCupertinoPicker(
          ruleFilterName: 'Type de vente',
          children: subCatsListAdsCats3Immobilier1TypeVente,
          onItemChanged: (index) {
            onItemChangedFunction(index,
                AdsCats3Immobilier1TypeVente.adsCats3Immobilier1TypeVente);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(
                AdsCats3Immobilier1TypeVente.adsCats3Immobilier1TypeVente);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormFieldNormal(
            hintText: 'Surface',
            keyboardType: TextInputType.number,
            controller: Provider.of<PublishProvider>(context).surfaceController,
            validator: validate,
          ),
        ),
      ],
    );
  }

  Widget chaussures() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              TextFormFieldNormal(
                hintText: 'Pointure',
                keyboardType: TextInputType.number,
                controller:
                    Provider.of<PublishProvider>(context).pointureController,
                validator: validate,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget locationVetements() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFormFieldNormal(
                hintText: 'Taille',
                keyboardType: TextInputType.number,
                controller:
                    Provider.of<PublishProvider>(context).tailleController,
                validator: validate,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget prestationsDeServices() {
    return Column(
      children: [
        CustomCupertinoPicker(
          ruleFilterName: 'Type de prestation',
          children: subCatsListAdsCats10Service1Prestations,
          onItemChanged: (index) {
            onItemChangedFunction(index,
                AdsCats10Service1Prestations.adsCats10Service1Prestations);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(
                AdsCats10Service1Prestations.adsCats10Service1Prestations);
          },
        ),
      ],
    );
  }

  Widget locationsEtGites_Or_ChambresHotes() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextFormFieldNormal(
            hintText: 'Couchage (personnes)',
            controller:
                Provider.of<PublishProvider>(context).cauchageController,
            validator: validate,
          ),
        ],
      ),
    );
  }

  Widget motosScooterQuad() {
    return Column(
      children: [
        CustomCupertinoPicker(
          ruleFilterName: 'Type',
          children: subCatsListAdsCats12Vehcules4Motos0Type,
          onItemChanged: (index) {
            onItemChangedFunction(index,
                AdsCats12Vehcules4Motos0Type.adsCats12Vehcules4Motos0Type);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(
                AdsCats12Vehcules4Motos0Type.adsCats12Vehcules4Motos0Type);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        CustomCupertinoPicker(
          ruleFilterName: 'Marque',
          children: subCatsListAdsCats12Vehcules4Motos1Marque,
          onItemChanged: (index) {
            onItemChangedFunction(index,
                AdsCats12Vehcules4Motos1Marque.adsCats12Vehcules4Motos1Marque);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(
                AdsCats12Vehcules4Motos1Marque.adsCats12Vehcules4Motos1Marque);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        CustomCupertinoPicker(
          ruleFilterName: 'Annee',
          children: subCatsListAdsCats12Vehcules0Annee,
          onItemChanged: (index) {
            onItemChangedFunction(index, AdsCats12Cat0Annee.adsCats12Cat0Annee);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(AdsCats12Cat0Annee.adsCats12Cat0Annee);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        CustomCupertinoPicker(
          ruleFilterName: 'Cylindree',
          children: subCatsListAdsCats12Vehcules4Motos3Cylindree,
          onItemChanged: (index) {
            onItemChangedFunction(
                index,
                AdsCats12Vehcules4Motos3Cylindree
                    .adsCats12Vehcules4Motos3Cylindree);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(AdsCats12Vehcules4Motos3Cylindree
                .adsCats12Vehcules4Motos3Cylindree);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        CustomCupertinoPicker(
          ruleFilterName: 'Permis',
          children: subCatsListAdsCats12Vehcules1Permis,
          onItemChanged: (index) {
            onItemChangedFunction(
                index, AdsCats12Vehcules1Permis.adsCats12Vehcules1Permis);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(
                AdsCats12Vehcules1Permis.adsCats12Vehcules1Permis);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        CustomCupertinoPicker(
          ruleFilterName: 'Couleur',
          children: subCatsListAdsCats12Vehcules2Couleur,
          onItemChanged: (index) {
            onItemChangedFunction(
                index, AdsCats12Vehcules2Couleur.adsCats12Vehcules2Couleur);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(
                AdsCats12Vehcules2Couleur.adsCats12Vehcules2Couleur);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              TextFormFieldNormal(
                hintText: 'Kelometrage',
                keyboardType: TextInputType.number,
                controller: Provider.of<PublishProvider>(context).kmController,
                validator: validate,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldNormal(
                hintText: 'date 1ere mise en route',
                keyboardType: TextInputType.number,
                controller:
                    Provider.of<PublishProvider>(context).dateController,
                validator: validate,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget caravaning() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              TextFormFieldNormal(
                hintText: 'Kilometrage',
                keyboardType: TextInputType.number,
                controller: Provider.of<PublishProvider>(context).kmController,
                validator: validate,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget voitures() {
    return Column(
      children: [
        CustomCupertinoPicker(
          ruleFilterName: 'Marque',
          children: subCatsListAdsCats12Vehcules3Marque,
          onItemChanged: (index) {
            onItemChangedFunction(
                index, AdsCats12Vehcules3Marque.adsCats12Vehcules3Marque);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(
                AdsCats12Vehcules3Marque.adsCats12Vehcules3Marque);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        CustomCupertinoPicker(
          ruleFilterName: 'Type',
          children: subCatsListAdsCats12Vehcules7Voiture1Type,
          onItemChanged: (index) {
            onItemChangedFunction(index,
                AdsCats12Vehcules7Voiture1Type.adsCats12Vehcules7Voiture1Type);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(
                AdsCats12Vehcules7Voiture1Type.adsCats12Vehcules7Voiture1Type);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        CustomCupertinoPicker(
          ruleFilterName: 'Annee',
          children: subCatsListAdsCats12Vehcules0Annee,
          onItemChanged: (index) {
            onItemChangedFunction(
                index, AdsCats12Vehcules0Annee.adsCats12Vehcules0Annee);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(
                AdsCats12Vehcules0Annee.adsCats12Vehcules0Annee);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        CustomCupertinoPicker(
          ruleFilterName: 'Energie',
          children: subCatsListAdsCats12Vehcules4Energie,
          onItemChanged: (index) {
            onItemChangedFunction(
                index,
                AdsCats12Vehcules4EnergieVoiture
                    .adsCats12Vehcules4EnergieVoiture);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(AdsCats12Vehcules4EnergieVoiture
                .adsCats12Vehcules4EnergieVoiture);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        CustomCupertinoPicker(
          ruleFilterName: 'Boite de vitesse',
          children: subCatsListAdsCats12Vehcules5Boite,
          onItemChanged: (index) {
            onItemChangedFunction(index,
                AdsCats12Vehcules5BoiteVoiture.adsCats12Vehcules5BoiteVoiture);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(
                AdsCats12Vehcules5BoiteVoiture.adsCats12Vehcules5BoiteVoiture);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        CustomCupertinoPicker(
          ruleFilterName: 'Nombre de portes',
          children: subCatsListAdsCats12Vehcules6PlacesOrPortes,
          onItemChanged: (index) {
            onItemChangedFunction(
                index, AdsCats12Vehcules6Portes.adsCats12Vehcules6Portes);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(
                AdsCats12Vehcules6Portes.adsCats12Vehcules6Portes);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        CustomCupertinoPicker(
          ruleFilterName: 'Nombre de places',
          children: subCatsListAdsCats12Vehcules6PlacesOrPortes,
          onItemChanged: (index) {
            onItemChangedFunction(
                index, AdsCats12Vehcules6Places.adsCats12Vehcules6Places);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(
                AdsCats12Vehcules6Places.adsCats12Vehcules6Places);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        CustomCupertinoPicker(
          ruleFilterName: 'Couleur',
          children: subCatsListAdsCats12Vehcules2Couleur,
          onItemChanged: (index) {
            onItemChangedFunction(
                index,
                AdsCats12Vehcules7Voiture2Couleur
                    .adsCats12Vehcules7Voiture2Couleur);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(AdsCats12Vehcules7Voiture2Couleur
                .adsCats12Vehcules7Voiture2Couleur);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        CustomCupertinoPicker(
          ruleFilterName: 'Permis',
          children: subCatsListAdsCats12Vehcules1Permis,
          onItemChanged: (index) {
            onItemChangedFunction(
                index, AdsCats12Vehcules1Permis.adsCats12Vehcules1Permis);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(
                AdsCats12Vehcules1Permis.adsCats12Vehcules1Permis);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              TextFormFieldNormal(
                hintText: 'Model de voiture',
                controller: Provider.of<PublishProvider>(context)
                    .voitureModelController,
                validator: validate,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormFieldNormal(
                hintText: 'date 1er remise',
                keyboardType: TextInputType.number,
                controller:
                    Provider.of<PublishProvider>(context).date1erController,
                validator: validate,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormFieldNormal(
                hintText: 'Kilometrage',
                keyboardType: TextInputType.number,
                controller:
                    Provider.of<PublishProvider>(context).kmControllerVoiture,
                validator: validate,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormFieldNormal(
                hintText: 'Puissance fiscale',
                keyboardType: TextInputType.number,
                controller:
                    Provider.of<PublishProvider>(context).puissanceController,
                validator: validate,
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget nautisme() {
    return Column(
      children: [
        CustomCupertinoPicker(
          ruleFilterName: 'Nautisme',
          children: subCatsListAdsCats12Vehcules8Nautisme,
          onItemChanged: (index) {
            onItemChangedFunction(
                index, AdsCats12Vehcules8Nautisme.adsCats12Vehcules8Nautisme);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(
                AdsCats12Vehcules8Nautisme.adsCats12Vehcules8Nautisme);
          },
        ),
      ],
    );
  }

  Widget utilitaires() {
    return Column(
      children: [
        CustomCupertinoPicker(
          ruleFilterName: 'Marque',
          children: subCatsListAdsCats12Vehcules3Marque,
          onItemChanged: (index) {
            onItemChangedFunction(
                index, AdsCats12Vehcules3Marque.adsCats12Vehcules3Marque);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(
                AdsCats12Vehcules3Marque.adsCats12Vehcules3Marque);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        CustomCupertinoPicker(
          ruleFilterName: 'Annee Modele',
          children: subCatsListAdsCats12Vehcules0Annee,
          onItemChanged: (index) {
            onItemChangedFunction(index, AdsCats12Cat0Annee.adsCats12Cat0Annee);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(AdsCats12Cat0Annee.adsCats12Cat0Annee);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        CustomCupertinoPicker(
          ruleFilterName: 'Energie',
          children: subCatsListAdsCats12Vehcules4Energie,
          onItemChanged: (index) {
            onItemChangedFunction(
                index, AdsCats12Vehcules4Energie.adsCats12Vehcules4Energie);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(
                AdsCats12Vehcules4Energie.adsCats12Vehcules4Energie);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        CustomCupertinoPicker(
          ruleFilterName: 'Boite Vitesse',
          children: subCatsListAdsCats12Vehcules5Boite,
          onItemChanged: (index) {
            onItemChangedFunction(
                index, AdsCats12Vehcules5Boite.adsCats12Vehcules5Boite);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(
                AdsCats12Vehcules5Boite.adsCats12Vehcules5Boite);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        CustomCupertinoPicker(
          ruleFilterName: 'Nombre places',
          children: subCatsListAdsCats12Vehcules6PlacesOrPortes,
          onItemChanged: (index) {
            onItemChangedFunction(
                index, AdsCats12Vehcules6Portes.adsCats12Vehcules6Portes);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(
                AdsCats12Vehcules6Portes.adsCats12Vehcules6Portes);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        CustomCupertinoPicker(
          ruleFilterName: 'Nombre portes',
          children: subCatsListAdsCats12Vehcules6PlacesOrPortes,
          onItemChanged: (index) {
            onItemChangedFunction(
                index, AdsCats12Vehcules6Portes.adsCats12Vehcules6Portes);
          },
          onItemSelect: (_) {
            onItemSelectedFunction(
                AdsCats12Vehcules6Portes.adsCats12Vehcules6Portes);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              TextFormFieldNormal(
                hintText: 'Kelometrage',
                keyboardType: TextInputType.number,
                controller: Provider.of<PublishProvider>(context).kmController,
                validator: validate,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormFieldNormal(
                hintText: 'Puissance',
                keyboardType: TextInputType.number,
                controller:
                    Provider.of<PublishProvider>(context).puissanceController,
                validator: validate,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormFieldNormal(
                hintText: 'Date',
                controller:
                    Provider.of<PublishProvider>(context).dateController,
                validator: validate,
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
