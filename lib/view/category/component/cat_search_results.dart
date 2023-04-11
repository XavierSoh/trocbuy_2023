import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../res/strings.dart';
import '../../../res/styles.dart';
import 'search_result_content.dart';
import '../../components/app_bar/default_app_bar.dart';
import '../../components/search_bar.dart';

import '../../components/ads_top_buttons.dart';

class CatSearchResult extends StatelessWidget {
  const CatSearchResult({Key? key}) : super(key: key);

  static const id = "cat_search_result";

  @override
  Widget build(BuildContext context) {
    final String suggestion =
        ModalRoute.of(context)!.settings.arguments.toString();
    print('object');
    print(suggestion);

    return Container(
      color: Styles.principalColor,
      child: SafeArea(
        child: Scaffold(
          appBar: DefaultAppBar(
            title: Strings.kAdvancedResearch,
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Wrap(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 32.0, bottom: 8.0),
                          child: AutoSizeText(
                            Strings.kResultFor + " " + suggestion,
                            maxLines: 2,
                          ),
                        ),
                        const AdsTopButtons(),
                        SearchResultContent(
                          suggestion: suggestion,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SearchBar(
                hintText: Strings.kSearchBarHintText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
