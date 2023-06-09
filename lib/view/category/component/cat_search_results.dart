import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trocbuy/providers/search_model_prov.dart';

import '../../../res/strings.dart';
import '../../../res/styles.dart';
import '../../components/ads_top_buttons.dart';
import '../../components/app_bar/default_app_bar.dart';
import '../../components/search_bar.dart' as my_search_bar;
import 'search_result_content.dart';

class CatSearchResult extends StatelessWidget {
  const CatSearchResult({Key? key}) : super(key: key);

  static const id = "cat_search_result";

  @override
  Widget build(BuildContext context) {
    final search = context.read<SearchModelProv>().searchModel;

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
                        if (search.suggestion != null)
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 32.0, bottom: 8.0),
                            child: AutoSizeText(
                              Strings.kResultFor + " " + search.suggestion! ??
                                  '',
                              maxLines: 2,
                            ),
                          ),
                        const AdsTopButtons(),
                        const SearchResultContent(),
                      ],
                    )
                  ],
                ),
              ),
              my_search_bar.SearchBar(
                hintText: Strings.kSearchBarHintText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
