import 'package:flutter/material.dart';

import '../../components/button_create.dart';
import '../../publish/publish_screen.dart';

class NoAds extends StatelessWidget {
  const NoAds({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 0.0,
          ),
          const Text(
            'Acune annonce pour le moment',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              ButtonCreate(
                title: 'Déposer une annonce',
                padding: const EdgeInsets.symmetric(horizontal: 0),
                minWidth: 150,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PublishScreen(),
                    ),
                  );
                },
                color: const Color(0xff2c3348),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          )
        ],
      ),
    );
  }
}
