class SearchModel{
  String? catLang;
  String? searchText;
  String? suggestion;

  SearchModel({this.catLang, this.searchText, this.suggestion});

  Map<String, dynamic> toJson()=>{
    'cat_lang_name':catLang?.trim(),
    'search_text':searchText?.trim(),
    'suggestion':suggestion?.trim()
  };
}
