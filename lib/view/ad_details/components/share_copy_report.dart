import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import '../../../global_functions/ads_functions.dart';
import '../../../res/strings.dart';
import '../../../res/styles.dart';
import '../report_ad.dart';

import '../../../model/ad.dart';
import '../../../providers/selected_ad.dart';

/// Pour le partage et la copie d'un lien
/// Par Xavier SOH
class ShareCopyReport extends StatefulWidget {
  const ShareCopyReport({Key? key}) : super(key: key);

  @override
  State<ShareCopyReport> createState() => _ShareCopyReportState();
}

class _ShareCopyReportState extends State<ShareCopyReport> {
  @override
  Widget build(BuildContext context) {
    final currentAd = context.read<SelectedAd>().ad;
    return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
        child: FutureBuilder(
          future: AdsFunctions.getLink(currentAd!),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final url = snapshot.data as String;
              return Container(
                padding: const EdgeInsets.only(
                  left: 2.0,
                  top: 8.0,
                  right: 2.0,
                  bottom: 8.0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Styles.principalColor,
                    width: 0.3,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ShareAd(url: url),
                    const Text(
                      ' | ',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Copy(url: url), //copier le lien
                    const Text(
                      ' | ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Report(
                      ad: currentAd,
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }
}

class ShareAd extends StatelessWidget {
  const ShareAd({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      child: GestureDetector(
        child: const Icon(Icons.share, color: Styles.principalColor),
        onTap: () {
          Share.share(
              'Cette annonce parue sur TrocBuy pourrait vous intéresser:\n\n' +
                  url,
              subject: 'Annonce parue sur la plateforme trocbuy.fr');
        },
      ),
    );
  }
}

class Report extends StatelessWidget {
  final Ad ad;
  const Report({Key? key, required this.ad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        children: const <Widget>[
          Text(
            'Signaler l\'annonce',
          ),
          Icon(
            Icons.warning,
            color: Colors.red,
          ),
        ],
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ReportAd(),
          ),
        );
      },
    );
  }
}

class Copy extends StatelessWidget {
  const Copy({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return GestureDetector(
          child: Row(
            children: <Widget>[
              Text(
                Strings.kCopyLink,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.content_copy,
                textDirection: TextDirection.rtl,
                size: 20,
              ),
            ],
          ),
          onTap: () {
            Clipboard.setData(ClipboardData(text: url)).then((result) {
              final snackBar = SnackBar(
                duration: const Duration(seconds: 2),
                backgroundColor: Styles.principalColor,
                content: Row(
                  children: <Widget>[
                    Text(
                      Strings.kLinkCopied,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const Icon(
                      Icons.check,
                      color: Colors.orange,
                    )
                  ],
                ),
                action: SnackBarAction(
                  textColor: Colors.white,
                  label: Strings.kCancel,
                  onPressed: () {},
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                snackBar,
              );
            });
          },
        );
      },
    );
  }
}
