import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../model/cap_extension.dart';
import '../../../res/styles.dart';

import '../../../model/ad_option1.dart';
import '../../../model/ad_option2.dart';
import '../../../model/ad_option3.dart';
import '../../../model/ad_options_colors.dart';

RenderObjectWidget buildOptionsRow(
    BuildContext context, dynamic e, String typeOption) {
  if (typeOption == "option1") {
    e = e as AdOption1;
    return e.option1Name.toString() != "null"
        ? Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: AutoSizeText(
                  e.option1Name.toString().capitalize(),
                  maxLines: 2,
                ),
              ),
              const Icon(Icons.navigate_next),
              AutoSizeText(
                e.option1.toString().capitalize() + " ",
                maxLines: 2,
              ),
              e.option1Name == "Couleur"
                  ? CircleAvatar(
                      maxRadius: 8.1,
                      backgroundColor: Styles.principalColor.withOpacity(.8),
                      child: CircleAvatar(
                        maxRadius: 8,
                        backgroundColor:
                            AdsOptionsColors.colors[e.option1.toString()],
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          )
        : const SizedBox.shrink();
  } else if (typeOption == "option2") {
    e = e as AdOption2;
    return e.option2Name.toString() != "null"
        ? Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: AutoSizeText(
                  e.option2Name.toString().capitalize(),
                  maxLines: 2,
                ),
              ),
              const Icon(Icons.navigate_next),
              AutoSizeText(
                e.option2.toString().capitalize(),
                maxLines: 2,
              ),
              e.option2Name == "Couleur"
                  ? CircleAvatar(
                      maxRadius: 8,
                      backgroundColor:
                          AdsOptionsColors.colors[e.option2.toString()],
                    )
                  : const SizedBox.shrink()
            ],
          )
        : const SizedBox.shrink();
  } else if (typeOption == "option3") {
    e = e as AdOption3;
    return e.option3Name.toString() != null
        ? Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: AutoSizeText(
                  e.option3Name.toString().capitalize(),
                  maxLines: 2,
                ),
              ),
              const Icon(Icons.navigate_next),
              AutoSizeText(
                e.option3.toString(),
                maxLines: 2,
              ),
              if (e.unity.toString() != null)
                AutoSizeText(
                  " " + e.unity.toString().capitalize(),
                  maxLines: 2,
                )
              else
                const SizedBox.shrink(),
            ],
          )
        : const SizedBox.shrink();
  }
  return const SizedBox.shrink();
}
