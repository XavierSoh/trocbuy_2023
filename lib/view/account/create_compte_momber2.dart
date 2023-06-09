import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../res/strings.dart';

import '../../constants/constants.dart';
import '../components/app_bar/default_app_bar.dart';
import '../components/button_create.dart';
import '../help_and_about/condition_general.dart';
import '../login_page/provider/info_compte.dart';
import 'account_home.dart';
import 'component/text_form_field_email.dart';
import 'component/textformfield_normal.dart';
import '../../global_functions/default_validator.dart';
import 'package:email_validator/email_validator.dart';

class CreatCompteMomber2 extends StatefulWidget {
  const CreatCompteMomber2({Key? key}) : super(key: key);

  @override
  _CreatCompteMomber2State createState() => _CreatCompteMomber2State();
}

class _CreatCompteMomber2State extends State<CreatCompteMomber2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _pseudoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool onChangedCheckBoxCondition = false;
  bool onChangedCheckBoxPseudo = false;
  bool _showPassword = true;
  bool _showPassword1 = true;

  final space = const SizedBox(height: 32.0);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Inscription'),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TextFormFieldNormal(
                            controller: _pseudoController,
                            hintText: 'Pseudo',
                            validator: DefaultValidator.validator,
                          ),
                          space,
                          TextFormFieldEmail(controller: _emailController),
                          space,
                          Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(10.0),
                            child: TextFormField(
                              controller: _passwordController,
                              // ignore: missing_return
                              validator: (String? input) {
                                if (input!.length < 8) {
                                  return 'Mot de passe doit contenir au moins 8 caractères';
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
                                  return 'Mot de passe doit contenir au moins 8 caractères';
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
                                  value: onChangedCheckBoxPseudo,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      onChangedCheckBoxPseudo = value!;
                                    });
                                  }),
                              const Text("Utiliser mon pseudo dans mes annonces"),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                activeColor: const Color(0xff2c3348),
                                value: onChangedCheckBoxCondition,
                                onChanged: (bool? value) {
                                  setState(
                                    () {
                                      onChangedCheckBoxCondition = value!;
                                    },
                                  );
                                },
                              ),
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
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ConditionGenerale(),
                                          ),
                                        );
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
                        ],
                      ),
                    ),
                    space,
                    ButtonCreate(
                      minWidth: 260,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      color: const Color.fromRGBO(31, 201, 99, 1).withOpacity(0.8),
                      title: 'Inscription',
                      onPressed: () async {
                        try {
                          if (_formKey.currentState!.validate()) {
                            if (onChangedCheckBoxCondition) {
                              Provider.of<InfoCompteController>(context, listen: false)
                                  .InfoGlobal
                                  .clear();
                              await EasyLoading.show(status: 'Inscripion en cours');
                              CompteInformation.info['pseudo'] = _pseudoController.text.toString();
                              onChangedCheckBoxPseudo
                                  ? CompteInformation.info['pseudo_display'] = '1'
                                  : CompteInformation.info['pseudo_display'] = '0';
                              CompteInformation.info['email'] = _emailController.text.toString();
                              CompteInformation.info['pas'] = _passwordController.text.toString();
                              CompteInformation.info['type'] = '1';
                              CompteInformation.info['state'] = '2';

                              var response = await http.post(
                                  Uri.parse(
                                      "https://api.trocbuy.fr/flutter/duo_create_account.php"),
                                  body: CompteInformation.info);

                              if (jsonDecode(response.body)['id'] != '0') {
                                Provider.of<InfoCompteController>(context, listen: false)
                                    .insertToInfoGlobal('id_acc', response.body.toString());

                                setState(() {});
                                Navigator.pushNamedAndRemoveUntil(context, AccountHome.id, (route)=>route.isFirst);
                                EasyLoading.showSuccess(
                                  Strings.inscriptionReussie,
                                  duration: const Duration(seconds: 2),
                                );
                              } else {
                                showCupertinoDialog(
                                    context: context,
                                    builder: (context) {
                                      return CupertinoAlertDialog(
                                        title: Text(Strings.emailExists),
                                        actions: [
                                          CupertinoButton(
                                            child: const Text('Ok'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      );
                                    });
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
                                });
                          }
                        } catch (e) {
                          EasyLoading.showError('Erreur d\'inscripion, veuillez réessayer',
                              duration: const Duration(seconds: 2));
                        }

                        EasyLoading.dismiss();
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
