import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../res/strings.dart';
import '../account/create_compte_momber1.dart';
import '../account/create_compte_pro1.dart';
import '../components/button_create.dart';
import 'components/authentication_button.dart';
import 'functions/login_functions.dart';
import 'provider/info_compte.dart';
import 'reset_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: height * 45 / 100,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const SizedBox(height: 5),
                  AuthenticationButton(
                      controller: emailController,
                      hintText: Strings.kEmail,
                      isEmail: true,
                      validator: LoginFunction.emailValidator),
                  AuthenticationButton(
                      controller: passwordController,
                      hintText: Strings.kPasswordHint,
                      validator: LoginFunction.passwordValidator),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: GestureDetector(
                          child: Text(
                            Strings.kForgotPassword,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ResetPassword()));
                        },
                      ),
                    ],
                  ),
                  ButtonCreate(
                    minWidth: 260,
                    color: const Color.fromRGBO(31, 201, 99, 1),
                    title: 'Se connecter',
                    padding: const EdgeInsets.all(0),
                    onPressed: () async {
                      try {
                        await EasyLoading.show(status: 'Connexion en cours');
                        Provider.of<InfoCompteController>(context,
                                    listen: false)
                                .InfoGlobal['email'] =
                            emailController.text.toString();
                        Provider.of<InfoCompteController>(context,
                                    listen: false)
                                .InfoGlobal['password'] =
                            passwordController.text.toString();

                        var response = await http.post(
                            Uri.parse(
                                "https://api.trocbuy.fr/flutter/login.php"),
                            body: Provider.of<InfoCompteController>(context,
                                    listen: false)
                                .InfoGlobal);

                        Provider.of<InfoCompteController>(context,
                                    listen: false)
                                .InfoGlobal['etat'] =
                            json.decode(response.body)['resultat'].toString();
                        if (Provider.of<InfoCompteController>(context,
                                    listen: false)
                                .InfoGlobal['etat'] ==
                            'true') {
                          LoginFunction.signIn(response, context);
                        } else {
                          LoginFunction.showErrorAlertDialog(context);
                          Provider.of<InfoCompteController>(context,
                                  listen: false)
                              .InfoGlobal
                              .clear();
                        }
                        EasyLoading.dismiss();
                      } catch (e) {
                        EasyLoading.showError(
                          'Erreur de connexion, veuillez réessayer',
                          duration: const Duration(seconds: 2),
                        );
                      }
                    },
                  ),
                  // ignore: deprecated_member_use
                ]),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 20),
            child: Divider(
              thickness: 0.9,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Vous n'avez pas de compte ?"),
              SizedBox(
                height: 5,
              ),
              Text("Inscrivez-vous"),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonCreate(
            minWidth: 260,
            color: Colors.blueGrey,
            title: 'Compte Membre',
            padding: const EdgeInsets.all(0),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreatCompteMomber1(),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ButtonCreate(
            minWidth: 260,
            color: const Color(0xff2c3348).withOpacity(0.9),
            title: 'Compte Pro',
            padding: const EdgeInsets.all(0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreatComptePro1(),
                ),
              );
            },
          ),
          const SizedBox(height: 15)
        ],
      ),
    ));
  }
}
