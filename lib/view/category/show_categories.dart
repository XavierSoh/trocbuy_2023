import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trocbuy/view/category/single_category_ads.dart';
import '../../model/cat_lang.dart';
import '../../providers/selected_cat_lang.dart';
import '../../res/strings.dart';
import '../../res/styles.dart';
import 'cat_lang_functions.dart';
import '../components/app_bar/default_app_bar.dart';
import '../components/custom_progress_indicator.dart';

class ShowCategories extends StatefulWidget {
  static const id = "show_category";
  const ShowCategories({Key? key}) : super(key: key);

  @override
  State<ShowCategories> createState() => _ShowCategoriesState();
}

class _ShowCategoriesState extends State<ShowCategories> {
  Map<int, dynamic> subCat = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: Strings.kChooseCategory,
      ),
      body: FutureBuilder(
        future: CatLangFunctions.getCats(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            List<CatLang> catLangs = snapshot.data;

            return ListView.builder(
              itemCount: catLangs.length,
              itemBuilder: (BuildContext context, int index) {
                return ExpansionTile(
                  onExpansionChanged: (value) async {
                    if (value) {
                      if (subCat[index] == null) {
                        print(index);
                        Map<String, dynamic> subCatLong =
                            await CatLangFunctions().getSubCat(catLangs[index]);
                        setState(() {
                          subCat[index] = subCatLong["subCategory"];
                        });
                        print(subCat);
                      }
                    }
                  },
                  title: Text(
                    catLangs[index].nameCatLang!,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Styles.principalColor,
                    ),
                  ),
                  leading: Container(
                    width: 50,
                    height: 50,
                    color: Styles.principalColor,
                    //images
                    child: Image.asset(
                        CatLangFunctions.getAssetPath(
                          catLangs[index].nameCatLang!,
                        ),
                        fit: BoxFit.fill),
                  ),
                  children: <Widget>[
                    //SOUS CATEGORIES DES ANNONCES

                    (subCat[index] != null && subCat[index].length != 0)
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: subCat[index].length,
                            itemBuilder: (BuildContext context, int i) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 72),
                                child: TextButton(
                                  onPressed: () {
                                    context
                                        .read<SelectedCatLang>()
                                        .changeCatLang(subCat[index][i]);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SingleCategoryAds(),
                                      ),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Row(
                                      children: <Widget>[
                                        const Icon(
                                          Icons.navigate_next,
                                          color: Styles.principalColor,
                                        ),
                                        Text(
                                          '${subCat[index][i].nameCatLang}'
                                          ' (${subCat[index][i].quantity})',
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Styles.principalColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : const Center(child: CustomProgressIndicator()),
                  ],
                );
              },
            );
          }
          return const CustomProgressIndicator();
        },
      ),
    );
  }
}
/* FutureBuilder(
                  future: CatLangFunctions().getSubCat(catLangs[index]),
                  builder: (BuildContext context, AsyncSnapshot snapshot2) {
                    if (snapshot2.hasData) {
                      final total = snapshot2.data['total'];
                      final quantity = snapshot2.data['quantity'];
                      final List<CatLang> catLangs2 =
                          snapshot2.data["subCategory"];
                      return ExpansionTile(
                         onExpansionChanged: (value) {
                           
                         },
                        title: Text(
                          catLangs[index].nameCatLang!,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Styles.principalColor,
                          ),
                        ),
                        leading: Container(
                          width: 50,
                          height: 50,
                          color: Styles.principalColor,
                          //images
                          child: Image.asset(
                              CatLangFunctions.getAssetPath(
                                catLangs[index].nameCatLang!,
                              ),
                              fit: BoxFit.fill),
                        ),
                        subtitle: Text(
                          total <= 1
                              ? '$total ${Strings.kAd}'
                              : '$total ${Strings.kAds}',
                        ),
                        children: <Widget>[
                          //SOUS CATEGORIES DES ANNONCES
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: catLangs2.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 72),
                                child: FlatButton(
                                  onPressed: () {
                                    context
                                        .read<SelectedCatLang>()
                                        .changeCatLang(catLangs2[index]);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SingleCategoryAds(),
                                      ),
                                    );
                                  },
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  padding: const EdgeInsets.all(0),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Row(
                                      children: <Widget>[
                                        const Icon(
                                          Icons.navigate_next,
                                          color: Styles.principalColor,
                                        ),
                                        Text(
                                          '${catLangs2[index].nameCatLang}'
                                          ' (${catLangs2[index].quantity})',
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Styles.principalColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    }
                    return const SizedBox.shrink();
                  },
                );
              */