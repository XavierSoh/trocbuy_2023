class SearchHelper {
  final String? categoryName, region, criteria, postalcode, searchText;
  final bool? titleOnly, urgentAds, withPhotoAds;

  SearchHelper(
      {this.categoryName,
      this.region,
      this.criteria,
      this.postalcode,
      this.searchText,
      this.titleOnly,
      this.urgentAds,
      this.withPhotoAds});
}
