import 'package:flutter/material.dart';

import '../../../res/strings.dart';
import '../../favorite/favorite_screen.dart';
import '../../help_and_about/about.dart';
import '../../help_and_about/condition_general.dart';
import '../../help_and_about/contact_us.dart';
import '../../help_and_about/faq.dart';
import '../buy_credit.dart';
import '../password.dart';

class ExpansionList extends StatefulWidget {
  const ExpansionList({Key? key}) : super(key: key);

  @override
  _ExpansionListState createState() => _ExpansionListState();
}

class _ExpansionListState extends State<ExpansionList> {
  final List<Item> _dataSettings = generateItemSettings(1, "Parametres");
  final List<Item> _dataAides = generateItemSettings(1, Strings.kHelp);

  buildListPanelParametre() {
    return ExpansionPanelList(
      elevation: 0,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _dataSettings[index].isExpanded = !isExpanded;
        });
      },
      children: _dataSettings.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                  title: Row(
                children: [
                  const Icon(Icons.settings, size: 32),
                  const SizedBox(width: 20),
                  Text(
                    item.headerValue,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ));
            },
            body: Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: Column(
                children: [
                  ListTile(
                    title: const Text("Acheter des Credits"),
                    trailing:
                        const Icon(Icons.arrow_forward_ios_outlined, size: 20),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BuyCredit()));
                    },
                  ),
                  ListTile(
                    title: const Text("Mot de passe"),
                    trailing:
                        const Icon(Icons.arrow_forward_ios_outlined, size: 20),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChangePassword(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text("Favoris"),
                    trailing:
                        const Icon(Icons.arrow_forward_ios_outlined, size: 20),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FavoriteScreen()));
                    },
                  ),
                ],
              ),
            ),
            isExpanded: item.isExpanded);
      }).toList(),
    );
  }

  buildListPanelAides() {
    return ExpansionPanelList(
      elevation: 0,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _dataAides[index].isExpanded = !isExpanded;
        });
      },
      children: _dataAides.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Row(
                  children: [
                    const Icon(Icons.help_outline, size: 32),
                    const SizedBox(width: 20),
                    Text(Strings.kHelp, style: const TextStyle(fontSize: 18)),
                  ],
                ),
              );
            },
            body: Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text(Strings.kHelpCenter),
                    trailing:
                        const Icon(Icons.arrow_forward_ios_outlined, size: 20),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FAQ()));
                    },
                  ),
                  ListTile(
                    title: Text(Strings.kContactUs),
                    trailing:
                        const Icon(Icons.arrow_forward_ios_outlined, size: 20),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ContactUs(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(Strings.kCGU),
                    trailing:
                        const Icon(Icons.arrow_forward_ios_outlined, size: 20),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConditionGenerale(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(Strings.kAppInfo),
                    trailing:
                        const Icon(Icons.arrow_forward_ios_outlined, size: 20),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, About.id);
                    },
                  ),
                ],
              ),
            ),
            isExpanded: item.isExpanded);
      }).toList(),
    );
  }

  @override
  build(BuildContext context) {
    return Column(
      children: [buildListPanelParametre(), buildListPanelAides()],
    );
  }
}

class Item {
  String expandedValue;
  String headerValue;
  bool isExpanded;

  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });
}

List<Item> generateItemSettings(int numberOfItem, String title) {
  return List.generate(numberOfItem, (index) {
    return Item(
      headerValue: title,
      expandedValue: 'this is item number $index',
    );
  });
}
