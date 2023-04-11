import '../res/strings.dart';

enum AdSortBy { recent, old, crescent, descending }

extension ExtensionAdSortBy on AdSortBy {
  String? get name {
    switch (this) {
      case AdSortBy.crescent:
        return Strings.kCrescent;
      case AdSortBy.descending:
        return Strings.kDescending;
      case AdSortBy.old:
        return Strings.kOld;
      case AdSortBy.recent:
        return Strings.kRecent;
    }
  }
}
