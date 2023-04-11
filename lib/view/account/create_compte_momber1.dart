import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../global_functions/default_validator.dart';
import '../../model/region.dart';
import '../../providers/selected_county.dart';
import '../../providers/selected_region.dart';
import '../../res/strings.dart';

import '../../constants/constants.dart';
import '../../model/Categories/switch_reg.dart';
import '../../model/regs_class.dart';
import '../../providers/publish_provider.dart';
import '../components/app_bar/default_app_bar.dart';
import '../components/button_create.dart';
import '../components/custom_cupertino_picker.dart';
import '../components/style1.dart';
import 'component/textformfield_normal.dart';
import 'create_compte_momber2.dart';

class CreatCompteMomber1 extends StatefulWidget {
  static const id = 'momber_account';
  const CreatCompteMomber1({Key? key}) : super(key: key);

  @override
  _CreatCompteMomber1State createState() => _CreatCompteMomber1State();
}

class _CreatCompteMomber1State extends State<CreatCompteMomber1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _adresseController = TextEditingController();
  final TextEditingController _codePostalController = TextEditingController();
  final TextEditingController _villeController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String civilityv = 'M';
  String civilitySelect = 'M';

  @override
  void initState() {
    // TODO: implement initState
    // Provider.of<PublishProvider>(context, listen: false).clearPublishProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const DefaultAppBar(title: 'Inscription'),
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TextFormFieldNormal(
                            controller: _nomController,
                            hintText: 'Nom',
                            validator: DefaultValidator.validator,
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          TextFormFieldNormal(
                            controller: _prenomController,
                            hintText: 'Prénom',
                            validator: DefaultValidator.validator,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomCupertinoPicker(
                      ruleFilterName: civilitySelect,
                      children: Strings.kCivilityList
                          .map((e) => DropdownStyle1(
                                getKey: e,
                              ))
                          .toList(),
                      onItemChanged: (index) {
                        setState(() {
                          civilitySelect = Strings.kCivilityList[index];
                        });
                      },
                      onItemSelect: (_) {
                        setState(() {
                          civilityv = civilitySelect;
                        });
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomCupertinoPicker(
                      ruleFilterName:
                          context.watch<SelectedRegion>().region.nameRegLang,
                      children: Region.regions
                          .map(
                            (e) => Text(e.nameRegLang),
                          )
                          .toList(),
                      onItemChanged: (index) {
                        context.read<SelectedRegion>().change(
                              Region.regions[index],
                            );
                      },
                      onItemSelect: (index) {
                        context.read<SelectedRegion>().region.nameRegLang;
                        context.read<SelectedRegion>().region.idReg;
                        context.read<SelectedRegion>().change(
                              Region.regions[index],
                            );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SwitchReg(),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TextFormFieldNormal(
                            controller: _villeController,
                            hintText: 'Ville',
                            validator: DefaultValidator.validator,
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          TextFormFieldNormal(
                            controller: _adresseController,
                            hintText: 'Adresse local',
                            validator: DefaultValidator.validator,
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          TextFormFieldNormal(
                            controller: _codePostalController,
                            hintText: 'Code postal (ex: 75013)',
                            validator: DefaultValidator.validator,
                          ),

                          const SizedBox(
                            height: 25.0,
                          ),
                          // TextFormFieldNormal(
                          TextFormFieldNormal(
                            controller: _phoneController,
                            hintText: 'Numéro de téléphone',
                            validator: DefaultValidator.validator,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
                ButtonCreate(
                  padding: const EdgeInsets.all(0),
                  minWidth: 260,
                  color: const Color.fromRGBO(31, 201, 99, 1).withOpacity(0.8),
                  title: 'Suivant',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      CompteInformation.info['civility'] = civilityv;
                      CompteInformation.info['name'] =
                          _nomController.text.toString();
                      CompteInformation.info['first_name'] =
                          _prenomController.text.toString();
                      CompteInformation.info['reg'] = context
                          .read<SelectedRegion>()
                          .region
                          .idReg
                          .toString();
                      CompteInformation.info['id_county'] = context
                          .read<SelectedCounty>()
                          .county
                          .idCounty
                          .toString();
                      CompteInformation.info['address'] =
                          _adresseController.text.toString();
                      CompteInformation.info['postcode'] =
                          _codePostalController.text.toString();
                      CompteInformation.info['city'] =
                          _villeController.text.toString();
                      CompteInformation.info['phone'] =
                          _phoneController.text.toString();

                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const CreatCompteMomber2(),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
