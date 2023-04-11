import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:flutter_ip/flutter_ip.dart';
//import 'package:get_ip/get_ip.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
//import 'package:r_get_ip/r_get_ip.dart';

import '../../model/user_infos.dart';
import '../../providers/buy_credit_provider.dart';
import '../../res/strings.dart';
import '../../res/styles.dart';
import '../../services/payment/paypal/paypal_paiement.dart';
import '../components/app_bar/default_app_bar.dart';
import '../components/button_create.dart';

class BuyCredit extends StatefulWidget {
  static const id = 'acheterCredits';

  const BuyCredit({Key? key}) : super(key: key);

  @override
  _BuyCreditState createState() => _BuyCreditState();
}

class _BuyCreditState extends State<BuyCredit> {
  var ip;
  final List<String> _options = [
    '5€ + 2€ Offerts',
    '10€ + 4€ Offerts',
    '20€ + 6€ Offerts',
    '50€ + 10€ Offerts',
    '100€ + 20€ Offerts',
    '500€ + 100€ Offerts'
  ];

  Future<void> creditInfo() async {
    String url = 'https://api.trocbuy.fr/flutter/duo_credit.php';
    Provider.of<BuyCreditProvider>(context, listen: false)
        .changeIsLoading(true);
    try {
      await http.post(Uri.parse(url), body: UserInfos.info).then((value) async {
        String credit = await json.decode(value.body)['credit'];
        Provider.of<BuyCreditProvider>(context, listen: false)
            .updateCurrentBalance(num.parse(credit).toDouble());
        Provider.of<BuyCreditProvider>(context, listen: false)
            .changeIsLoading(false);
        Provider.of<BuyCreditProvider>(context, listen: false)
            .changeHasData(true);
      });
    } catch (e) {
      EasyLoading.showError(Strings.kTryAgainLater,
              duration: const Duration(seconds: 2))
          .then((value) {
        Provider.of<BuyCreditProvider>(context, listen: false)
            .changeIsLoading(false);
        Provider.of<BuyCreditProvider>(context, listen: false)
            .changeHasData(false);
      });
    }
  }

  Future<void> showAlertDialogMethodPayment(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Styles.principalColor,
          title: const Text(
            'Choisissez votre moyen de paiement : ',
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
          content: SizedBox(
            width: 220,
            height: 118,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                      height: 45,
                      minWidth: 240,
                      elevation: 8,
                      shape: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(250, 203, 0, 1), width: 1.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: const Color.fromRGBO(250, 203, 0, 1),
                      child: SizedBox(
                          height: 42,
                          child: Image.asset(
                            'images/paypal.png',
                            fit: BoxFit.cover,
                          )),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => PaypalPayment(
                              onFinish: (number) async {
                                // payment done
                              },
                            ),
                          ),
                        );
                      }),

                  const SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                    width: 240,
                    child: MaterialButton(
                        height: 45,
                        minWidth: 220,
                        elevation: 8,
                        shape: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey[800]!, width: 1.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Colors.grey[800],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.credit_card,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Carte bancaire",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ],
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          showAlertDialogCartVisaConfirmation(context);
                        }),
                  ),

                  // ignore: deprecated_member_use
                ],
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              child: const Text(
                "Annuler",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showAlertDialogCartVisaConfirmation(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Styles.principalColor,
          title: const Text(
            'Confirmation de paiment: ',
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
          content: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Montant à payer :',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  '${Provider.of<BuyCreditProvider>(context).balancePay} €',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              child: const Text(
                "Annuler",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                "Continue",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context);
                Fluttertoast.showToast(msg: 'bientot disponible');
                // payNow(
                //     '${Provider.of<BuyCreditProvider>(context, listen: false).balancePay}');
              },
            ),
          ],
        );
      },
    );
  }

  // void payNow(String amount) async {
  //   var amountInt = num.parse(amount);
  //   //the amount must be transformed to cents
  //   var response = await StripeServices.payNowHandler(
  //       amount: '${(amountInt.toInt()) * 2}', currency: 'EUR'); // TODO message
  //   //  EasyLoading.showInfo('${response.message}' , duration: Duration(seconds: 4));
  // }

  @override
  void initState() {
    // StripeServices.init();
    //TODO : Replace GETIP
    //ip = RGetIp.externalIP; //GetIp.ipAddress;
    Provider.of<BuyCreditProvider>(context, listen: false).resetBalance();
    creditInfo();
    super.initState();
  }

  @override
  build(BuildContext context) {
    _buildChips(List<String> options) {
      List<Widget> chips = [];

      for (int index = 0; index < options.length; index++) {
        ChoiceChip choiceChip = ChoiceChip(
          selected:
              Provider.of<BuyCreditProvider>(context).indexSelected == index,
          label: SizedBox(
            height: 30,
            width: 140,
            child: Center(
              child: Text(
                options[index],
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          elevation: 10,
          pressElevation: 5,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          selectedShadowColor: Colors.blueAccent,
          shadowColor: Colors.grey,
          backgroundColor: Colors.grey,
          selectedColor: const Color(0xff2c3348),
          onSelected: (bool selected) {
            if (selected) {
              Provider.of<BuyCreditProvider>(context, listen: false)
                  .changeIndexSelected(index);
              switch (index) {
                case 0:
                  return Provider.of<BuyCreditProvider>(context, listen: false)
                      .changeNewBalance(5, 2);

                case 1:
                  return Provider.of<BuyCreditProvider>(context, listen: false)
                      .changeNewBalance(10, 4);
                case 2:
                  return Provider.of<BuyCreditProvider>(context, listen: false)
                      .changeNewBalance(20, 6);
                case 3:
                  return Provider.of<BuyCreditProvider>(context, listen: false)
                      .changeNewBalance(50, 10);
                case 4:
                  return Provider.of<BuyCreditProvider>(context, listen: false)
                      .changeNewBalance(100, 20);
                case 5:
                  return Provider.of<BuyCreditProvider>(context, listen: false)
                      .changeNewBalance(500, 100);
              }
            }
          },
        );

        chips.add(Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: choiceChip));
      }

      return Wrap(
        children: chips,
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const DefaultAppBar(title: 'Acheter des credits'),
      body: Provider.of<BuyCreditProvider>(context).isLoading
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Styles.principalColor,
              ),
            )
          : (Provider.of<BuyCreditProvider>(context).hasData
              ? Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Pré-chargez votre compte et facilitez vos futurs achats. '
                            'Les montants sont affichés et crédités en TTC',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            //height: 40,
                            child: _buildChips(_options),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Solde actuel : ${Provider.of<BuyCreditProvider>(context).currentBalance} €',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Montant à ajouter : ${Provider.of<BuyCreditProvider>(context).balanceAdded} €',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Nouveau solde : ${Provider.of<BuyCreditProvider>(context).newBalance} €',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 60,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ButtonCreate(
                              title: 'Acheter',
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              minWidth: 150,
                              onPressed: () async {
                                showAlertDialogMethodPayment(context);
                              },
                              color: Colors.green,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : Center(
                  child: ButtonCreate(
                    title: 'Réessayer',
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    minWidth: 150,
                    onPressed: () {
                      creditInfo();
                    },
                    color: Colors.grey[700],
                  ),
                )),
    );
  }
}
