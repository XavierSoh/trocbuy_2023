import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../res/styles.dart';
import '../components/app_bar/default_app_bar.dart';
import 'contact_us.dart';

const TextStyle descriptionStyle = const TextStyle(fontSize: 16);

class ConditionGenerale extends StatelessWidget {
  String informationLegales =
      "Le site internet trobuy.fr, ci-après dénommé « trobuy » permet à ses utilisateurs de déposer ou de consulter des petites annonces gratuitement.\n"
      "Le site s’adresse aux particuliers et aux professionnels.\n"
      "Nos internautes en déposant et en consultant les annonces sur trocbuy acceptent de fait nos Conditions Générales d’Utilisation.\n"
      "Le site est édité par Fornella sarl au capital de 8.000 euros, immatriculée au registre du commerce et des sociétés de Paris sous le numéro: 44215199900020, ayant son siège social au : 155, rue du château des rentiers - 75013 Paris.\n"
      "Le Directeur de Publication de trobuy est Monsieur F. Joël Numéro de TVA intracommunautaire : FR2144215199900020\n"
      "Pour plus d’information sur l’entreprise, contacter par mail notre équipe éditoriale.\n"
      "Si votre requête est portée sur une annonce, vous trouverez sa référence dans l’adresse internet de la page de cette annonce.\n"
      "Exemple :http://www.trobuy.fr/Aquitaine-Gironde-Voitures-PORSCHE-911-type-996-3-6-162267.html, la référence sera 162267 trobuy.fr est hébergé par OVH. 2, rue Kellermann 59100 Roubaix-France.";
  var textWithTitle = [
    {
      'title': "Préambule : Définitions",
      'description':
          "Chacun des termes mentionnés ci-dessous aura dans les présentes Conditions Générales d’utilisation de trocbuy (ci-après dénommées les “CGU“) la signification suivante :"
    },
    {
      'title': "Annonce :",
      'description':
          "c’est l’ensemble des renseignements fournis par l’utilisateur, ces données sont textuelles, sonores, photographies, etc… dans le but de vendre, d’acheter ou de louer un bien sur trocbuy.fr."
    },
    {
      'title': "Annonceur:",
      'description':
          "est celui qui dépose une annonce sur le site, il doit être physique et majeur ou moral.\n"
              "Le terme \"Annonceur\" regroupe dans les \"CGU \"les deux types d'Annonceur déposant des annonces via Trobuy, à savoir :\n"
              "Dans les “CGU“, nous retrouverons le terme “annonceur“."
    },
    {
      'title': "L'Annonceur \"Particulier\" :",
      'description':
          "est une personne physique qui a atteint l’âge de majorité, il n’est pas obligé de créer un compte pour déposer ou consulter les annonces sur le site trocbuy.fr.\n"
              "Il peut également s’agir des professionnels qui déposent les annonces dans les rubriques: Emplois, Services, etc…en France métropolitaine et dans les DOM-TOM."
    },
    {
      'title': "L'Annonceur \"Professionnel\" :",
      'description':
          "c’est une personne morale, son activité sur Trobuy est exclusivement à des fins professionnelles, il est obligé d’ouvrir un compte pour déposer ses annonces dans des catégories bien définies."
    },
    {
      'title': "Fornella sarl",
      'description':
          "désigne la société qui édite et exploite le Site Internet, Fornella sarl, est une société à responsabilité limitée, au capital de 8000 euros, immatriculée au registre du commerce et des sociétés de Paris sous le numéro 44215199900020, dont le siège social est situé 155 rue du château des rentiers 75013 Paris.",
    },
    {
      'title': "trocbuy",
      'description':
          "désigne l’ensemble des services mis à la disposition des Utilisateurs et des Annonceurs sur le site Internet, tels que décrits à l'article 3.1."
    },
    {
      'title': "Le site internet :",
      'description':
          "désigne le site internet exploité par Fornella sarl accessible principalement depuis l'URL et permettant aux Utilisateurs et aux Annonceurs d'accéder via internet à trocbuy décrit à l'article 3.1 des présentes \"CGU\"."
    },
    {
      'title': "Utilisateur :",
      'description':
          "est un visiteur, utilisant trocbuy via le Site Internet, ordinateur, téléphone et autre…"
    },
    {
      'title': "ARTICLE 1- OBJET",
      'description':
          "Les \"CGU\" ont pour but de déterminer les conditions d'utilisation de Trobuy mis à disposition des Utilisateurs et des Annonceurs via le Site Internet.\n"
              "Les conditions de souscription par les Annonceurs aux options payantes (dénommées ci-après \" Options Payantes\") sont fixées dans les conditions générales de vente réservées :"
    },
    {
      'title': "ARTICLE 2 : ACCEPTATION",
      'description':
          "L’utilisation de nos services ne peut se faire qu’après acceptation de nos \"CGU\", cette acceptation engage votre responsabilité."
    },
    {
      'title': "ARTICLE 3 : UTILISATION DU SITE TROCBUY",
      'description':
          "3.1 L’ouverture d’un compte est recommandé aux particuliers et obligatoire aux professionnels de l’Immobilier, de l’Automobile, du Multimédia, et de Maison et loisirs.\n"
              "L’ouverture d’un compte vous permet de déposer rapidement vos annonces et de mieux les gérer.\n"
              "Pour utiliser notre service, il faut d’abord avoir accès à notre site."
    },
    {
      'title': "Utilisateurs:",
      'description': "Les utilisateurs ont accès à toutes les annonces du site.\n"
          "Ils peuvent également les sauvegarder dans l’espace “ma sélection“.\n"
          "Ils peuvent partager le site avec des amis via les réseaux sociaux : facebook, google+ et twetter, partager ou envoyer une annonce aux amis via les réseaux ou par mail.\n"
          "Ils peuvent contacter l’ Annonceur par mail ou par téléphone.\n"
          "Signaler un abus."
    },
    {
      'title': "Annonceurs :",
      'description': "Ils peuvent déposer des annonces.\n"
          "Il est conseillé d’avoir un compte pour mieux gérer ses annonces sur le site, par exemple :\n"
          ". Pouvoir supprimer les annonces déposées.\n"
          ". Changer d’option.\n"
          ". Modifier son annonce."
    },
    {
      'title': "LES OPTIONS",
      'description': "Les périodicités, elles peuvent être :\n"
          "- chaque jour pendant 7 jours\n"
          "- chaque jour pendant 15 jours\n"
          "- chaque jour pendant 30 jours"
    },
    {
      'title': "Option: Annonce PREMIUM",
      'description': "Cette option permet à votre petite annonce de se démarquer des autres annonces du site, elle la met en valeur.\n"
          "L’annonce PREMIUM permet de garantir à votre annonce une bonne visibilité.\n"
          "En choisissant cette option, l’annonce apparaît dans le menu du haut de la page d’accueil et des pages internes du site en fonction de la recherche de l’utilisateur.\n"
          "L’option PREMIUM est souscrite au moment où vous déposez votre annonce sur le site, elle peut également se faire dans l’espace de la gestion de l’annonce, en cliquant sur l’option “Annonce PREMIUM“\n"
          "Elle est payante, et sera facturée aux annonceurs.\n"
          "Il est fortement conseillé d’ajouter des photos à votre annonce, l’ajout des photos est gratuit pour les 5 premières photos, et payante pour les photos supplémentaires.\n"
          "L’annonce PREMIUM s’affiche d’une manière aléatoire. Aucun remboursement ne sera possible après la mise en valeur de votre annonce."
    },
    {
      'title': "Option : Annonce encadrée",
      'description': "Cette option vous permet de démarquer votre annonce des autres annonces de la page des résultats.\n"
          "Elle est encadrée avec un fonds de couleur vive voyante. Vous pouvez mettre cette option sur votre annonce, même après sa validation, en utilisant le mot de passe utilisé lors de son dépôt, vous pouvez également le faire au moment où vous déposez votre annonce, en cochant la case “Encadrée“.\n"
          "Cette option a une durée de 7 jours, de 15 jours ou de 30 jours, et sera supprimée automatiquement de notre base de données après ces périodes, Trobuy peut également la retirer conformément à l’article 2.4 des Conditions générales de diffusion du site.\n"
          "L’annonceur peut également pour une raison ou une autre supprimer son annonce.\n"
          "Cette option est payante.\n"
          "Votre annonce sera validée par trocbuy avant sa diffusion. Un email de confirmation vous sera ensuite envoyé à l’issue de votre paiement.\n"
          "Si votre annonce est refusée par trocbuy en raison de sa non-conformité aux règles de diffusion, votre paiement par carte bancaire sera annulé. Vous recevrez un email d'information.\n"
          "Aucun remboursement n’est possible après la mise en place de l'option."
    },
    {
      'title': "Option : Annonce en tête de liste",
      'description': "Cette option vous permet de remonter en tête de liste sur la page de listing des annonces et sur la page de la catégorie de votre annonce pour lui donner plus de visibilité.\n"
          "Vous pouvez choisir : 7 jours, 15 jours ou 30 jours pour la durée de votre annonce à cet emplacement privilégié.\n"
          "Pour souscrire à cette option, vous pouvez vous rendre à la page de l’annonce, sélectionnez “ Annonce en tête“\n"
          "Cette option est payante.\n"
          "Votre annonce sera validée par trocbuy avant sa diffusion. Un email de confirmation vous sera ensuite envoyé à l’issue de votre paiement.\n"
          "Si votre annonce est refusée par trocbuy en raison de sa non-conformité aux règles de diffusion, votre paiement par carte bancaire sera annulé. Vous recevrez un email d'information.\n"
          "Aucun remboursement n’est possible après la mise en ligne de l’une de nos options.\n"
          "Pensez à vous inscrire gratuitement à notre Newsletter pour être informé des dernières publications dans la catégorie de votre choix."
    },
    {
      'title': "Option: Logo Urgent",
      'description': "Le logo “Urgent“ permet de distinguer votre annonce du reste du listing des annonces, le logo est une banderole rouge portant la mention “Urgent“.\n"
          "Vous pouvez choisir : 7 jours, 15 jours ou 30 jours pour la durée de votre annonce avec cette option.\n"
          "Pour souscrire à cette option, vous pouvez vous rendre à la page de l’annonce, sélectionnez “ Annonce Urgente “\n"
          "Cette option est payante.\n"
          "Le règlement des options se fait par :\n"
          "paypal, cliquez sur Paypal pour payer avec votre compte Paypal ou par CB si vous n’avez pas de Compte Paypal ou par virement\n"
          "Aucune carte ou coordonnée bancaire n'est nécessaire.\n"
          "Il suffit tout simplement de disposer d’un téléphone, un coup de fil, et vous obtenez un code pour valoriser votre annonce."
    },
    {'title': "3.2 Diffusion des Annonces", 'description': ""},
    {
      'title': "3.2.1 Règles générales",
      'description': "Tout Utilisateur peut déposer des Annonces sur le site, ce qui lui confère le statut d’annonceur.\n"
          "L'Annonceur Particulier ou “le particulier“ déposera gratuitement son Annonce sur le site trocbuy en cliquant sur le bouton “Déposer votre annonce“.\n"
          "L’annonce sera mise en ligne maximum 12 heures après validation de celle-ci par notre équipe éditoriale.\n"
          "Elle va être diffusée sur notre site et sur l’ensemble des sites du réseau flashregion (option)."
    },
    {
      'title': "3.2.2 Engagement de l'Annonceur",
      'description': "L'Annonceur est seul responsable des annonces qu’il dépose sur notre site, elle ne doit pas :\n"
          "- contrevenir à une réglementation en vigueur.\n"
          "- contenir des messages de diffamation ou dommageable à l’égard de tiers.\n"
          "- contenir un lien hypertexte de redirection vers d’autres sites internet.\n"
          "- Pas de tromperie sur la qualité du bien à vendre.\n"
          "- Pas de déclaration qui nuise aux intérêts ni à l’image de Trobuy\n"
          "- Nous acceptons les annonces pour vendre votre bien, sans lien publicitaire\n"
          "L’annonceur reste seul responsable du contenu de son annonce, il garantit ainsi Trobuy contre toute condamnation devant les tribunaux.\n"
          "Il dégage ainsi Trobuy de toute responsabilité.\n"
          "L’annonceur prend acte que son annonce peut être supprimée à tout moment de notre base de données si celle-ci ne respectait pas nos \"CGU\", il ne sera ni indemnisé, ni remboursé des frais engagés pour des options payantes.\n"
          "L’annonce est présente sur notre site pendant 60 jours, au-delà de ce délai, l’annonceur reçoit un mail lui notifiant l’expiration de celle-ci. Il pourra la reconduire."
    },
    {'title': "3.3. Liens hypertextes", 'description': ""},
    {
      'title': "3.3.1. Liens à partir du site trocbuy",
      'description':
          "Trobuy peut contenir des liens hypertextes redirigeant vers des sites exploités par des tiers. Ces liens sont fournis à simple titre d'information."
    },
    {
      'title': "Fornella sarl",
      'description':
          "n'exerce aucun contrôle sur ces sites et décline toute responsabilité quant à l'accès, au contenu ou à l'utilisation de ces sites, ainsi qu'aux dommages pouvant résulter de la consultation des informations présentes sur ces sites.\n"
              "La décision d'activer ces liens relève de la pleine et entière responsabilité de l'Utilisateur."
    },
    {
      'title': "3.3.2. Liens vers trocbuy",
      'description':
          "Aucun lien hypertexte ne peut être créé vers le site trocbuy sans l'accord préalable et exprès de FORNELLA sarl.\n"
              "Si un internaute ou une personne morale désire créer, à partir de son site, un lien hypertexte vers trocbuy et ce quel que soit le support, il doit préalablement prendre contact avec Fornella sarl en lui adressant un email via l'adresse contact du site."
    },
    {
      'title':
          "3.5 Protection, collecte, utilisation et communication des données personnelles.",
      'description': ""
    },
    {
      'title': "3.5.1 : Protection des données personnelles",
      'description':
          "Conformément à la loi nº78-17 du 6 janvier 1978, dite \" Informatique et libertés \", Trobuy a fait l'objet d'une déclaration auprès de la Commission Nationale de l'Informatique et des Libertés (C.N.I.L) sous le numéro :1583511.\n"
              "Conformément aux articles 38, 39 et 40 de la loi nº78-17 du 6 janvier 1978, tout Utilisateur et Annonceur particulier (agissant exclusivement à des fins privées et non commerciales) du Service du site trocbuy disposent à tout moment d'un droit d'opposition, d'accès, de rectification, de suppression ainsi que d'opposition au traitement des données le concernant.\n"
              "Ils peuvent le faire en en utilisant le:",
      'inkwellText': "formulaire de contact"
    },
    {
      'title': "3.5.2 : Collecte et utilisation des données personnelles",
      'description':
          "Pour déposer une annonce sur trocbuy, l’annonceur renseigne un formulaire de dépôt avec son n° de téléphone et son adresse mail.\n"
              "trocbuy peut utiliser ces informations à diverses fins :"
    },
    {
      'title': "Les données personnelles",
      'description': "trocbuy peut utiliser ces données personnelles aux fins suivantes :\n"
          "Pour gérer son annonce.\n"
          "Pour valider et publier son annonce.\n"
          "l'envoi de formulaires de réponses\n"
          "pour lui faire des propositions commerciales de notre service, des relances, envoie des factures, le suivi de son annonce.\n"
          "l'envoi de propositions commerciales et/ou promotionnelles, émanant de sociétés partenaires de trocbuy.\n"
          "les envois ne seront faits que par trocbuy, qui s’engage à ne pas vendre ces données au tiers sans consentement des annonceurs concernés, l'envoi d'enquêtes de satisfaction statistiques."
    },
    {
      'title': "3.5.3 : Communication des données personnelles",
      'description':
          "Conformément à la loi nº78-17 du 6 janvier 1978, Trobuy s’engage à garder dans sa base de données toutes les données personnelles collectées.\n"
              "Par dérogation, l'Utilisateur et l'Annonceur sont informés que Trobuy peut être amené à communiquer ces données personnelles collectées: aux autorités administratives et judiciaires autorisées, uniquement sur réquisition judiciaire,"
    },
    {
      'title': "3.6 Prospection commerciale et collecte déloyale",
      'description':
          "Il est interdit de télécharger des données du site à des fins commerciales, sous peines des poursuites pénales prévues par les articles 226-16 à 226-24 du code pénal qui sanctionnent le délit de collecte illicite des données personnelles."
    },
    {
      'article': "ARTICLE 4 MODERATION DES ANNONCES",
      'title': "4.1. Suppression des Annonces illicites",
      'description':
          "trocbuy se réserve le droit de supprimer toute annonce qui ne respecte pas ses règles de diffusion, sans prévenir l’annonceur, qui ne sera ni remboursé des sommes versées pour une option, ni indemnisé."
    },
    {
      'title': "4.2. Notification des abus",
      'description':
          "Tout visiteur peut nous signaler un abus, par mail en cliquant sur le bouton “contact“."
    },
    {
      'article': "ARTICLE 5 : RESPONSABILITE ET GARANTIES",
      'title': "5.1. Responsabilité et obligations de trocbuy ",
      'description':
          "trocbuy est soumis à un régime de responsabilité atténuée prévu aux articles 6.I.2. et suivants de la loi nº2004-575 du 21 juin 2004 pour la confiance dans l'économie numérique.\n"
              "Trobuy n’est donc par conséquence pas responsable du contenu des annonces déposées dans sa base de données par un annonceur.\n"
              "trocbuy met en relation les annonceurs et les utilisateurs de son service, et n’est pas responsable envers les uns et les autres."
    },
    {
      'title': "5.2. Limitation de responsabilité",
      'description': "trocbuy s’engage à mettre tous les moyens nécessaires pour que utilisateurs et annonceurs puissent mieux profiter de ses services.\n"
          "trocbuy ne sera pas responsable du dysfonctionnement de ses services, des modifications, des pannes, etc…\n"
          "En général de tous les problèmes techniques qui pourraient advenir.\n"
          "Les annonceurs et les utilisateurs sont donc seuls responsables des dommages causés aux tiers et des conséquences qui pourraient en découler."
    },
    {
      'article': "ARTICLE 6 : PROPRIETE INTELLECTUELLE",
      'title': "6.1.",
      'description': "Le Service de trocbuy est protégé par les lois sur le droit d'auteur et les traités internationaux.\n"
          "Les contenus affichés sont protégés par le droit d'auteur en tant que travail collectif et/ou compilation, conformément aux lois sur les droits d'auteur et les conventions internationales.\n"
          "Toute utilisation non expressément autorisée des Eléments du Site Internet, entraîne une violation des droits d'auteur et constitue une contrefaçon.\n"
          "Elle peut aussi entraîner une violation des droits à l'image, droits des personnes ou de tous autres droits et réglementations en vigueur.\n"
          "Elle peut donc engager la responsabilité civile et/ou pénale de son auteur."
    },
    {
      'title': "6.2.",
      'description': "Copier ou reproduire tout ou partie des sites vers un autre serveur ou un autre emplacement dans le but d'une reproduction ou redistribution postérieures est interdit.\n"
          "Tout Utilisateur et Annonceur de trocbuy s'engagent notamment à ne pas :\n"
          "reproduire en nombre, à des fins commerciales ou non des petites Annonces présentes sur le site trocbuy.fr.\n"
          "utiliser un robot.\n"
          "copier les informations sur des supports de toute nature permettant de reconstituer tout ou partie des fichiers d'origine.\n"
          "Toute reproduction, représentation, modification ou extraction de tout ou partie des Eléments et ce de quelque manière que ce soit, faite sans l'autorisation préalable et écrite de Trobuy est illicite.\n"
          "Ces actes illicites engagent la responsabilité de ses auteurs et sont susceptibles d'entraîner des poursuites judiciaires à leur encontre et notamment pour contrefaçon."
    },
    {
      'title': "6.3.",
      'description':
          "Les marques et logos trocbuy et trocbuy.fr, ainsi que les marques et logos des partenaires de trocbuy sont des marques déposées. Toute reproduction totale ou partielle de ces marques et/ou logos sans l'autorisation préalable et écrite de trocbuy est interdite."
    },
    {
      'title': "6.4",
      'description':
          "Fornella sarl est producteur des bases de données de Trobuy. En conséquence, toute extraction et/ou réutilisation de la ou des bases de données au sens des articles L 342-1 et L 342-2 du code de la propriété intellectuelle est interdite."
    },
    {
      'title': "6.5.",
      'description':
          "Fornella sarl se réserve la possibilité de saisir toutes voies de droit à l'encontre des personnes qui n'auraient pas respecté les interdictions contenues dans le présent article."
    },
    {
      'article': "ARTICLE 7 : MODIFICATION DU SITE TROCBUY.FR ET DES \"CGU\"",
      'title': "",
      'description':
          "trocbuy se réserve le droit d’interrompre l’accès à son site à tout moment, et même de modifier son contenu ou une partie de contenu. Les utilisateurs et les annonceurs doivent régulièrement prendre connaissance de nos \"CGU\"."
    },
    {
      'article': "ARTICLE 8 : DISPOSITIONS DIVERSES",
      'title': "",
      'description':
          "Le fait qu’une partie des \"CGU\" soit invalide ou illégale n’entraine pas la nullité des autres dispositions celles-ci continuent à fonctionner entre trobuy, les utilisateurs et les annonceurs.\n"
              "Les présentes \"CGU \" sont soumises au droit français."
    },

    //{'title': "", 'description': ""},
  ];
  Color kPrincipal_colour = const Color(0xff2c3348);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.principalColor,
      child: SafeArea(
        child: Scaffold(
          appBar: const DefaultAppBar(
            title: "CGU",
          ),
          body: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "INFORMATIONS LEGALES",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      informationLegales,
                      style: descriptionStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "CONDITIONS GENERALES D'UTILISATION DE TROCBUY",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextWithTitle(
                      title: textWithTitle[index]['title'] ?? "",
                      description: textWithTitle[index]['description'] ?? "",
                    )
                  ],
                );
              }
              return TextWithTitle(
                article: textWithTitle[index]['article'] ?? "",
                title: textWithTitle[index]['title'] ?? "",
                description: textWithTitle[index]['description'] ?? "",
                inkwellText: textWithTitle[index]['inkwellText'] ?? "",
              );
            },
            itemCount: textWithTitle.length,
          ),
        ),
      ),
    );
  }
}

class TextWithTitle extends StatelessWidget {
  TextWithTitle(
      {this.article = "",
      this.title = "",
      this.description = "",
      this.inkwellText = "",
      Key? key})
      : super(key: key);
  String? article;
  String? title;
  String? description;
  String? inkwellText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        article != null
            ? Column(
                children: [
                  Text(
                    article ?? "",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )
            : const SizedBox.shrink(),
        title != ""
            ? Column(
                children: [
                  Text(
                    title ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )
            : const SizedBox(
                height: 0,
              ),
        description != ""
            ? Column(
                children: [
                  inkwellText == null
                      ? Text(
                          description ?? "",
                          style: descriptionStyle,
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              description ?? "",
                              style: descriptionStyle,
                            ),
                            InkWell(
                              onTap: () {
                                //TODO
                                // Navigate to formulaire contact
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => const ContactUs(),
                                  ),
                                );
                              },
                              child: Text(
                                inkwellText ?? "",
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.blue),
                              ),
                            )
                          ],
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )
            : const SizedBox(
                height: 0,
              ),
      ],
    );
  }
}
