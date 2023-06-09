import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trocbuy/res/strings.dart';
import 'package:trocbuy/view/account/component/city_formfield.dart';
import 'package:trocbuy/view/account/component/phone_formfield.dart';
import 'package:trocbuy/view/components/region_picker.dart';
import '../../global_functions/default_validator.dart';
import '../../model/region.dart';
import '../../providers/selected_county.dart';
import '../../providers/selected_region.dart';
import '../components/app_bar/default_app_bar.dart';

import '../../constants/constants.dart';
import '../../model/Categories/switch_department.dart';
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
    Provider.of<PublishProvider>(context, listen: false).clearPublishProvider();
    super.initState();
  }

  final space = const SizedBox(height: 16.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Inscription'),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                TextFormFieldNormal(
                    controller: _compNomController,
                    hintText: 'Nom de l\'entreprise',
                    validator: DefaultValidator.enterpriseNameValidator),
                space,
                TextFormFieldNormal(
                  controller: _compNumController,
                  hintText: 'N° de l\'entreprise',
                  validator: DefaultValidator.validator,
                ),
                space,
                const RegionPicker(),
                space,
                const SwitchDepartment(),
                space,
                CityFormfield(controller: _villeController),
                space,
                TextFormFieldNormal(
                  controller: _adresseController,
                  hintText: 'Adresse du local',
                ),
                space,
                TextFormFieldNormal(
                  controller: _codePostalController,
                  hintText: 'Code postal (Ex: 75013)',
                ),
                space,
                PhoneFormField(controller: _phoneController),
                space,
                space,

                ButtonCreate(
                  minWidth: 260,
                  color: const Color.fromRGBO(31, 201, 99, 1).withOpacity(0.8),
                  title: 'Suivant',
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      CompteInformation.info['comp_name'] = _compNomController.text.toString();
                      CompteInformation.info['comp_num'] = _compNumController.text.toString();
                      CompteInformation.info['reg'] =
                          context.read<SelectedRegion>().region.idReg.toString();
                      CompteInformation.info['id_county'] =
                          context.read<SelectedCounty>().county.idCounty.toString();
                      CompteInformation.info['address'] = _adresseController.text.toString();
                      CompteInformation.info['postcode'] = _codePostalController.text.toString();
                      CompteInformation.info['city'] = _villeController.text.toString();
                      CompteInformation.info['phone'] = _phoneController.text.toString();
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const CreatComptePro2(),
                        ),
                      );
                    } else {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text(Strings.fillFirst),
                            actions: [
                              CupertinoButton(
                                child: Text('Ok'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
                space,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
