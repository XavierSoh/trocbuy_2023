class Filts {
  final int id;
  final String idColumn;
  final String categorieName; //rubrique
  final String region; //region
  final String criteria; //criteres de selection
  final String postalCode; //code postal
  final String searchText; //texte de recherche
  final String initialText;
  final bool searchInTitle;
  final bool searchUrgents;
  final bool searchPhoto;

  Filts(
      this.id,
      this.idColumn,
      this.categorieName,
      this.region,
      this.criteria,
      this.postalCode,
      this.searchText,
      this.initialText,
      this.searchInTitle,
      this.searchUrgents,
      this.searchPhoto);
}
