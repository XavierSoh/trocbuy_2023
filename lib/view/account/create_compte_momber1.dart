import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:trocbuy/view/account/component/city_formfield.dart';
import 'package:trocbuy/view/account/component/phone_formfield.dart';
import 'package:trocbuy/view/components/region_picker.dart';
import '../../global_functions/default_validator.dart';
import '../../model/region.dart';
import '../../providers/selected_county.dart';
import '../../providers/selected_region.dart';
import '../../res/strings.dart';
import '../../constants/constants.dart';
import '../../model/Categories/switch_department.dart';
import '../components/app_bar/default_app_bar.dart';
import '../components/button_create.dart';
import '../components/custom_cupertino_picker.dart';
import '../components/style1.dart';
import 'component/textformfield_normal.dart';
import 'create_compte_momber2.dart';
import '../../res/strings.dart';

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

  String civilityv = 'Votre civilité';
  String civilitySelect = 'Votre civilité';
  final space = const SizedBox(height: 25.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Inscription'),
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  space,
                  TextFormFieldNormal(
                    controller: _nomController,
                    hintText: 'Nom',
                    validator: DefaultValidator.nameValidator,
                  ),
                  space,
                  TextFormFieldNormal(
                    controller: _prenomController,
                    hintText: 'Prénom',
                  ),
                  space,
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
                  space,
                  const RegionPicker(),

                  space,
                  Visibility(
                      visible: context.watch<SelectedRegion>().region.idReg != -1,
                      child: const SwitchDepartment()),
                  space,
                  CityFormfield(controller: _villeController),
                  space,
                  TextFormFieldNormal(
                    controller: _adresseController,
                    hintText: 'Adresse',
                    validator: DefaultValidator.validator,
                  ),
                  space,
                  TextFormFieldNormal(
                    controller: _codePostalController,
                    hintText: 'Code postal (ex: 75013)',
                    validator: DefaultValidator.postalValidator,
                  ),
                  space,
                  PhoneFormField(controller: _phoneController),
                  space,
                  ButtonCreate(
                    padding: const EdgeInsets.all(0),
                    minWidth: 260,
                    color: const Color.fromRGBO(31, 201, 99, 1).withOpacity(0.8),
                    title: 'Suivant',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (CompteInformation.info['civility'] != 'Votre civilité') {
                          CompteInformation.info['civility'] = civilityv;
                        } else {
                          CompteInformation.info['civility'] = civilitySelect;
                        }
                        CompteInformation.info['name'] = _nomController.text.toString();
                        CompteInformation.info['first_name'] = _prenomController.text.toString();
                        CompteInformation.info['reg'] =
                            context.read<SelectedRegion>().region.idReg.toString();
                        CompteInformation.info['id_county'] =
                            context.read<SelectedCounty>().county.idCounty.toString();
                        CompteInformation.info['address'] = _adresseController.text.toString();
                        CompteInformation.info['postcode'] = _codePostalController.text.toString();
                        //CompteInformation.info['city'] = _villeController.text.toString();
                        CompteInformation.info['phone'] = _phoneController.text.toString();

                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const CreatCompteMomber2(),
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
                                      })
                                ],
                              );
                            });
                      }
                    },
                  ),
                  space,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


