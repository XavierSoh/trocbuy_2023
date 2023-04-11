import 'package:flutter/material.dart';
import '../components/app_bar/default_app_bar.dart';

import 'Widget/cardMesTransactions.dart';

class MesTransactions extends StatefulWidget {
  const MesTransactions({Key? key}) : super(key: key);

  @override
  _MesTransactionsState createState() => _MesTransactionsState();
}

class _MesTransactionsState extends State<MesTransactions> {
  int numberAchats = 0;
  int numberVentes = 1;

  @override
  build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const DefaultAppBar(title: 'Mes Transactions'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              CardMesTransactions(
                imagePath: null,
                titerAnnonce: 'Chaussure et sac femme',
                prixAnnonce: '275',
                nomberVues: 100,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
