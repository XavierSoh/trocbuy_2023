import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:trocbuy/res/strings.dart';

import '../../constants/constants.dart';
import '../components/app_bar/default_app_bar.dart';
import '../components/button_create.dart';
import '../help_and_about/condition_general.dart';
import '../login_page/provider/info_compte.dart';
import 'account_home.dart';
import 'component/text_form_field_email.dart';
import 'component/textformfield_normal.dart';

class CreatComptePro2 extends StatefulWidget {
  const CreatComptePro2({Key? key}) : super(key: key);

  @override
  _CreatComptePro2State createState() => _CreatComptePro2State();
}

class _CreatComptePro2State extends State<CreatComptePro2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool onChangedCheckBox = false;
  bool _showPassword = true;
  bool _showPassword1 = true;

  String? validator(String value) {
    if (value.isEmpty) {
      return '*';
    }
    return null;
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormFieldNormal(
                  controller: _nomController,
                  hintText: 'Nom',
                ),
                space,
                TextFormFieldNormal(
                  controller: _prenomController,
                  hintText: 'Prénom',
                ),
                space,
                TextFormFieldEmail(
                  controller: _emailController,
                ),
                space,
                Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(10.0),
                  child: TextFormField(
                    controller: _passwordController,
                    // ignore: missing_return
                    validator: (String? input) {
                      if (input!.length < 8) {
                        return 'Le mot de passe doit contenir au moins 8 caractères';
                      } else if (_confirmPasswordController.text.toString() !=
                          _passwordController.text.toString()) {
                        return 'Mot de passe incorrect';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(15.0),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          icon: Icon(
                            _showPassword ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        hintText: 'Mot de passe',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade600,
                        )),
                    obscureText: _showPassword,
                  ),
                ),
                space,
                Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(10.0),
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    // ignore: missing_return
                    validator: (String? input) {
                      if (input!.length < 8) {
                        return 'Le mot de passe doit contenir au moins 8 caractères';
                      } else if (_confirmPasswordController.text.toString() !=
                          _passwordController.text.toString()) {
                        return 'Mot de passe incorrect';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(15.0),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _showPassword1 = !_showPassword1;
                            });
                          },
                          icon: Icon(
                            _showPassword1 ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        hintText: 'Confirmer le mot de passe',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade600,
                        )),
                    obscureText: _showPassword1,
                  ),
                ),
                space,
                Row(
                  children: [
                    Checkbox(
                        checkColor: Colors.white,
                        activeColor: const Color(0xff2c3348),
                        value: onChangedCheckBox,
                        onChanged: (bool? value) {
                          setState(() {
                            onChangedCheckBox = value!;
                          });
                        }),
                    Expanded(
                      child: Wrap(
                        children: [
                          const Text(
                            "j’accepte",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          InkWell(
                            child: const Text(
                              " les conditions générales ",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.green,
                                decorationThickness: 2,
                                //decorationStyle:
                                //TextDecorationStyle.dashed,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ConditionGenerale()));
                            },
                          ),
                          const Text(
                            "d’utilisation ",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                space,
                ButtonCreate(
                  minWidth: 260,
                  color: const Color.fromRGBO(31, 201, 99, 1).withOpacity(0.8),
                  title: 'Inscription',
                  padding: const EdgeInsets.all(0),
                  onPressed: () async {
                    try {
                      if (_formKey.currentState!.validate()) {
                        if (onChangedCheckBox) {
                          Provider.of<InfoCompteController>(context, listen: false)
                              .InfoGlobal
                              .clear();
                          await EasyLoading.show(status: 'Inscripion en cours');
                          CompteInformation.info['name'] = _nomController.text.toString();
                          CompteInformation.info['first_name'] = _prenomController.text.toString();
                          CompteInformation.info['email'] = _emailController.text.toString();
                          CompteInformation.info['pas'] = _passwordController.text.toString();
                          CompteInformation.info['type'] = '2';
                          CompteInformation.info['state'] = '2';
                          var response = await http.post(
                              Uri.parse("https://api.trocbuy.fr/flutter/duo_create_account.php"),
                              body: CompteInformation.info);
                          if (jsonDecode(response.body)['id'] != '0') {
                            CompteInformation.id_acc = response.body.toString();

                            Navigator.pushNamedAndRemoveUntil(
                                context, AccountHome.id, (route) => route.isFirst);
                            EasyLoading.showSuccess(
                              Strings.inscriptionReussie,
                              duration: const Duration(seconds: 2),
                            );
                          } else {
                            EasyLoading.showError('Adresse email est déjà utilisée',
                                duration: const Duration(seconds: 2));
                          }
                        } else {
                          Fluttertoast.showToast(
                              msg: 'Veuillez accepter les conditions générales',
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              fontSize: 16.0);
                        }
                      } else {
                        showCupertinoDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: Text(Strings.correctFirst),
                              actions: [
                                CupertinoButton(
                                  child: const Text('Ok'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          },
                        );
                      }
                    } catch (e) {
                      EasyLoading.showError('Erreur d\'inscripion, veuillez réessayer',
                          duration: const Duration(seconds: 2));
                    }

                    EasyLoading.dismiss();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
