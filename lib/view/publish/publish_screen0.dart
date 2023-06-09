import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:trocbuy/global_functions/default_validator.dart';
import 'package:trocbuy/model/Categories/category_picker.dart';
import 'package:trocbuy/model/Categories/switch__sub_cat.dart';
import 'package:trocbuy/res/strings.dart';
import 'package:trocbuy/view/components/region_picker.dart';
import '../../providers/location_provider.dart';
import '../../providers/publish_provider.dart';
import '../../providers/selected_cat_lang.dart';
import '../../providers/selected_region.dart';
import '../../services/Location/lat_lag_location.dart';
import 'publish_screen01.dart';
import 'show_maps.dart';
import '../../model/Categories/switch_department.dart';
import '../../model/user_infos.dart';
import '../account/component/textformfield_normal.dart';
import '../components/button_create.dart';
import '../components/custom_cupertino_picker.dart';
import 'component/titre_votre_annonce.dart';
import 'publish_screen1.dart';

class PublishScreen0 extends StatefulWidget {
  final LatLng? myPosition;
  const PublishScreen0({
    this.myPosition,
    Key? key,
  }) : super(key: key);

  @override
  _PublishScreen0State createState() => _PublishScreen0State();
}

class _PublishScreen0State extends State<PublishScreen0> {
  final maxLines = 5;
  String? ip;
  // List<String> _status = ["Offre", "Recherche", "Echange"];

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _webSiteController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _videoWebSiteController = TextEditingController();
  final TextEditingController _phoneNumberController =
  TextEditingController(text: UserInfos.info['phone']);
  final TextEditingController _cityController =
  TextEditingController(text: UserInfos.info['city']);
  final TextEditingController _postalCodeController =
  TextEditingController(text: UserInfos.info['postcode']);
  final TextEditingController _addressController =
  TextEditingController(text: UserInfos.info['address']);

  LocationFunction locationFunction = LocationFunction();

  getPermission() async {
    await locationFunction.getPosition();
  }

  @override
  void initState() {
    // TODO: implement initState
    getPermission();

    /*
    allMarkers.add(
      new Marker(
          markerId: MarkerId('myposition2'),
          draggable: false,
          visible: true,
          consumeTapEvents: false,
          position: .myPosition),
    );
    */
    super.initState();
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              const TitleVotreAnnonce(),
              const SizedBox(height: 8),
              const SizedBox(height: 15),
              TextFormFieldNormal(
                hintText: "Titre d'annonce",
                controller: _titleController,
                validator: DefaultValidator.validator,
              ),
              const SizedBox(height: 15),
              TextFormFieldNormal(
                hintText: 'Prix €(optionnel)',
                controller: _priceController,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 15),
              TextFormFieldNormal(
                hintText: 'Description',
                maxLines: 3,
                controller: _textController,
              ),
              const SizedBox(
                height: 15,
              ),
              const CategoryPicker(),
              const SizedBox(
                height: 15,
              ),
              const SwitchSubCat(),
              const SizedBox(
                height: 15,
              ),
              const RegionPicker(),

              const SizedBox(
                height: 15,
              ),
              Visibility(
                  visible: context.watch<SelectedRegion>().region.idReg != -1,
                  child: const SwitchDepartment()),
              const SizedBox(
                height: 15,
              ),
              TextFormFieldNormal(
                hintText: 'Site internet (facultatif)',
                controller: _webSiteController,
                //validator: validate,
              ),
              const SizedBox(height: 15.0),
              TextFormFieldNormal(
                // validator: validate,
                hintText: 'Lien vidéo (facultatif)',
                controller: _videoWebSiteController,
              ),
              const SizedBox(height: 15.0),
              TextFormFieldNormal(
                hintText: 'Numéro de téléphone',
                controller: _phoneNumberController,
                //validator: validate,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormFieldNormal(
                hintText: 'Ville',
                controller: _cityController,
                validator: DefaultValidator.validator,

                // validator: validate,
              ),
              const SizedBox(height: 15.0),
              TextFormFieldNormal(
                hintText: 'Code postal (ex : 75013)',
                controller: _postalCodeController,
                keyboardType: TextInputType.number,
                validator: DefaultValidator.validator,

              ),
              const SizedBox(height: 15.0),
              TextFormFieldNormal(
                hintText: 'Adresse',
                controller: _addressController,
                validator: DefaultValidator.validator,

              ),
              const SizedBox(
                height: 15,
              ),
              MaterialButton(
                elevation: 8,
                padding: const EdgeInsets.all(10),
                disabledColor: Colors.white10,
                shape: OutlineInputBorder(
                  borderSide:
                  const BorderSide(color: Colors.grey, width: 1.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () {
                  Provider.of<LocationProvider>(context, listen: false)
                      .changeLatLng(
                      LatLng(locationFunction.lat, locationFunction.lng));
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => const ShowMaps()));
                },
                child: Text(
                  'Cliquer ici pour vous géolocaliser',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Provider.of<PublishProvider>(context).colorGPS
                        ? Colors.lightGreen
                        : Colors.grey[600],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Checkbox(
                        checkColor: Colors.white,
                        activeColor: const Color(0xff2c3348),
                        value: Provider.of<PublishProvider>(context)
                            .checkBoxPhoneHidden,
                        onChanged: (bool? value) {
                          Provider.of<PublishProvider>(context, listen: false)
                              .changeCheckBoxPhoneHidden(value!);
                        }),
                    const Expanded(
                        child: Text("Utiliser mon numéro téléphone dans l'annonce")
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonCreate(
                    title: 'Suivant',
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    minWidth: 150,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        var categoriesSelect1 = Provider.of<PublishProvider>(
                            context,
                            listen: false)
                            .categoriesSelect;
                        /*   Provider.of<PublishProvider>(context, listen: false)
                            .changePassword(_passwordController.text.toString());*/
                        Provider.of<PublishProvider>(context, listen: false)
                            .changeTitle(_titleController.text.toString());
                        Provider.of<PublishProvider>(context, listen: false)
                            .changePrice(_priceController.text.toString());
                        Provider.of<PublishProvider>(context, listen: false)
                            .changeText(_textController.text.toString());
                        Provider.of<PublishProvider>(context, listen: false)
                            .changeWebSite(
                            _webSiteController.text.toString());
                        Provider.of<PublishProvider>(context, listen: false)
                            .changeVideoWebSite(
                            _videoWebSiteController.text.toString());
                        Provider.of<PublishProvider>(context, listen: false)
                            .changeCity(_cityController.text.toString());
                        Provider.of<PublishProvider>(context, listen: false)
                            .changePostalCode(
                            _postalCodeController.text.toString());
                        Provider.of<PublishProvider>(context, listen: false)
                            .changeAddress(
                            _addressController.text.toString());
                        Provider.of<PublishProvider>(context, listen: false)
                            .changePhoneNumber(
                            _phoneNumberController.text.toString());
                        if (subCats.contains(Provider.of<SelectedCatLang>(
                            context,
                            listen: false)
                            .subCatLang
                            .nameCatLang)) {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => PublishScreen01(),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => PublishScreen1(),
                            ),
                          );
                        }
                      }
                      else {
                        showCupertinoDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: Text(Strings.fillFirst),
                                actions: [
                                  CupertinoButton(
                                      child: const Text('Ok'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      })
                                ],
                              );
                            });
                      }
                    },
                    color: Colors.green,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}



List<String> subCats = [
  'Hamsters/Lapins/Rongeurs',
  'Chiens/Chats/Chevaux',
  'Adoption-Don Animaux',
  'Vêtements bébé',
  'Vêtements future maman',
  'Colocations',
  'Ventes immobilières',
  'Locations',
  'Chaussures',
  'Prêt-à-porter',
  'Location vêtements',
  'Mode Femme',
  'Mode Homme',
  'Mode Enfant',
  'Prestations de services',
  'Locations et Gîtes',
  'Chambres d\'hôtes',
  'Motos/Scooter/Quad',
  'Caravaning',
  'Voitures',
  'Nautisme',
  'Utilitaires',
];