import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../global_functions/default_validator.dart';
import '../../model/region.dart';
import '../../providers/selected_county.dart';
import '../../providers/selected_region.dart';
import '../components/app_bar/default_app_bar.dart';

import '../../constants/constants.dart';
import '../../model/Categories/switch_reg.dart';
import '../../model/regs_class.dart';
import '../../providers/publish_provider.dart';
import '../components/button_create.dart';
import '../components/custom_cupertino_picker.dart';
import 'component/textformfield_normal.dart';
import 'create_compte_pro2.dart';

class CreatComptePro1 extends StatefulWidget {
  static const id = 'pro_account';
  const CreatComptePro1({Key? key}) : super(key: key);

  @override
  _CreatComptePro1State createState() => _CreatComptePro1State();
}

class _CreatComptePro1State extends State<CreatComptePro1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _compNomController = TextEditingController();
  final TextEditingController _compNumController = TextEditingController();
  final TextEditingController _adresseController = TextEditingController();
  final TextEditingController _codePostalController = TextEditingController();
  final TextEditingController _villeController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool onChangedCheckBox = false;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<PublishProvider>(context, listen: false).clearPublishProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      appBar: const DefaultAppBar(title: 'Inscription'),
      body: Form(
        key: _formKey,
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 15.0,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              TextFormFieldNormal(
                                controller: _compNomController,
                                hintText: 'Nom de l\'entreprise',
                                validator: DefaultValidator.validator,
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              TextFormFieldNormal(
                                controller: _compNumController,
                                hintText: 'N° de l\'entreprise',
                                validator: DefaultValidator.validator,
                              ),
                              const SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                        CustomCupertinoPicker(
                          ruleFilterName: context
                              .watch<SelectedRegion>()
                              .region
                              .nameRegLang,
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
                          onItemSelect: (_) {
                            context.read<SelectedRegion>().region.nameRegLang;
                            context.read<SelectedRegion>().region.idReg;
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const SwitchReg(),
                        const SizedBox(
                          height: 20.0,
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
                                height: 20.0,
                              ),
                              TextFormFieldNormal(
                                controller: _adresseController,
                                hintText: 'Adresse local',
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              TextFormFieldNormal(
                                controller: _codePostalController,
                                hintText: 'Code postal (Ex: 75013)',
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              TextFormFieldNormal(
                                controller: _phoneController,
                                hintText: 'Numéro de téléphone',
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                ButtonCreate(
                  minWidth: 260,
                  color: const Color.fromRGBO(31, 201, 99, 1).withOpacity(0.8),
                  title: 'Suivant',
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      CompteInformation.info['comp_name'] =
                          _compNomController.text.toString();
                      CompteInformation.info['comp_num'] =
                          _compNumController.text.toString();
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
                          builder: (context) => const CreatComptePro2(),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
