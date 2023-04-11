import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../components/app_bar/default_app_bar.dart';

import '../../res/strings.dart';
import 'contact_us.dart';

const TextStyle questionStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
TextStyle answerStyle = const TextStyle(fontSize: 16);

class FAQ extends StatelessWidget {
  List<Map<String, String>> questionWithAnswer = [
    {
      'question': "Comment s'effectue une recherche avancée ? ",
      'answer': "Pour effectuer une recherche simple et rapide, entrez le nom du bien que vous recherchez, sélectionnez la catégorie ou la sous-catégorie et le département "
          "de votre choix dans le bloc \" recherche avancée \" situé à droite du site puis validez. Vous pouvez ensuite trier les annonces de façon plus pertinente en"
          "cochant une sélection dans \" Uniquement dans \". Vous souhaitez changer de région française ! Cliquez sur la mini carte de France pour choisir la région de"
          " votre recherche.",
    },
    {
      'question': "Comment déposer une petite annonce gratuite ? ",
      'answer':
          "Cliquez sur le bouton \"Déposer votre annonce\" situé sur toutes les pages en haut du site à droite, Créez votre compte gratuitement si vous n'êtes pas"
              " inscrit en remplissant le formulaire.\n"
              "Si vous êtes déjà inscrit, cliquez sur l'onglet du compte correspondant à votre précédente inscription \"Compte Membre\" \" Compte Pro\" rentrez votre adresse émail"
              " et votre mot de passe, Validez.",
    },
    {
      'question': "Comment se déroule le dépôt d'une petite annonce ?",
      'answer': "Remplissez le formulaire de dépôt puis validez.\n"
          "Une fois cette opération effectuée, un émail pour confirmer votre annonce vous sera envoyé instantanément (vérifiez dans vos courriers indésirables si vous ne recevez"
          " rien dans les 15 minutes qui suivent votre dépôt).\n"
          "Pour confirmer votre dépôt, vous devez impérativement cliquez sur le lien de confirmation présent dans cet émail. Notre équipe validera votre annonce dans un délai de 12 heures.\n"
          "Vous recevrez ensuite un émail de notre équipe qui confirmera sa validation.",
    },
    {
      'question': "ATTENTION :",
      'answer':
          "Il est tout à fait possible que votre annonce ne soit pas retenue pour non respect des règles, vous recevrez dans ce cas un émail.\nQui vous en informera",
    },
    {
      'question':
          "Pourquoi doit-on donner son adresse email dans le formulaire de mise en ligne d'une petite annonce ? ",
      'answer': "Vous devez donner votre adresse email pour plusieurs raisons :\n"
          "1- Un émail vous sera envoyé pour confirmer votre annonce.\n"
          "2- Vous serez averti de toutes informations relatives à votre annonce par notre équipe technique.\n"
          "3- Les utilisateurs intéressés par votre annonce pourront vous contacter en utilisant un formulaire prévu à cet effet.\n",
    },
    {
      'question': "Est-ce utile de fournir son numéro de téléphone ? ",
      'answer':
          "En donnant votre numéro de téléphone via le formulaire de mise en ligne d'une petite annonce, vous permettez aux utilisateurs de vous contacter directement par téléphone."
              " Cette option reste facultative.",
    },
    {
      'question': "Est-ce entièrement gratuit de déposer une petite annonce ? ",
      'answer':
          "Oui, le dépôt d'une petite annonce est entièrement gratuit pour les particuliers. Certaines catégories restent également gratuites pour les professionnels.",
    },
    {
      'question': "Combien de temps l'annonce reste en ligne ? ",
      'answer': "Votre annonce restera en ligne pour une durée de 60 jours.",
    },
    {
      'question': "Puis-je supprimer ou modifier mon annonce ? ",
      'answer':
          "Oui, vous pouvez à tout moment supprimer ou modifier votre annonce. En cas de modification, elle sera une Nouvelle fois en attente de validation par notre équipe technique.",
    },
    {
      'question': "Je ne reçois pas l'email de confirmation, comment faire ? ",
      'answer':
          "Vérifiez bien que l'émail n'est pas dans vos \"courriers indésirables ou spams\". Si il n'y est pas, il est possible que vous ayez fait une erreur de frappe, il vous faut alors"
              " déposer l'annonce une nouvelle fois.",
    },
    {
      'question': "Comment modifier ou supprimer mon annonce ? ",
      'answer':
          "Pour modifier ou supprimer votre annonce, rendez-vous sur la page de votre petite annonce, cliquez sur le lien \"supprimer cette annonce\" ou le lien \"modifier cette annonce\" puis"
              " saisissez votre mot de passe.",
    },
    {
      'question': "Comment faire si j'ai oublié mon mot de passe ? ",
      'answer': "Si vous avez oublié votre mot de passe, cliquez sur \"Compte Membre\" ou \"Compte Pro\"suivant votre inscription de départ, puis cliquez sur la ligne \"Mot de passe oublié\" "
          "saisissez votre adresse émail pour recevoir un nouveau mot de passe.\n"
          "Vous pourrez par la suite modifier votre mot de passe. Une fois connecté à votre compte, Cliquez sur \"informations personnelles\" et modifiez votre mot de passe.",
    },
  ];

  FAQ({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: "FAQ"),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (BuildContext context, int index) {
          if (index == questionWithAnswer.length - 1) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                RichText(
                    text: TextSpan(
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                        children: <TextSpan>[
                      const TextSpan(
                          text:
                              'Vous n\'avez pas trouvé de réponse à votre question ? '),
                      TextSpan(
                          text: Strings.kContactUs,
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => const ContactUs()));
                            })
                    ])),
                const SizedBox(
                  height: 20,
                ),
              ],
            );
          }
          return QuestionWithAnswerText(
            question: questionWithAnswer[index]['question']!,
            answer: questionWithAnswer[index]['answer']!,
          );
        },
        itemCount: questionWithAnswer.length,
      ),
    );
  }
}

class QuestionWithAnswerText extends StatelessWidget {
  final String question, answer;

  const QuestionWithAnswerText(
      {Key? key, required this.question, required this.answer})
      : super(key: key);
  @override
  build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              question,
              style: questionStyle,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
        Column(
          children: [
            Text(
              answer,
              style: answerStyle,
            ),
          ],
        )
      ],
    );
  }
}
