class Informations {
  final String id_ad;
  final String id_reg;
  final String id_county;
  final String id_cat;
  final String postcode;
  final String status;
  final String type;
  final String title;
  final String text;
  final String price;
  final String id_acc;
  final String date;
  final String heure;

  final String urgent;
  final String lat;
  final String lng;
  final String comment_total;
  final String comment_average;
  final String framed;
  final String auteur;
  final String phone;
  final String phone_hidden;
  final String visit_num;
  final String date_last_visit;
  final String heure_last_visit;
  final String picture_num;
  final String picture_name;
  final String categorie;
  final String nomeField;
  final String field;
  final String nomoption1;
  final String uniteoption1;
  final String option1;
  final String quantite;
  final String city;
  final String email;


  Informations(
      this.id_ad,
      this.id_reg,
      this.id_county,
      this.id_cat,
      this.postcode,
      this.status,
      this.type,
      this.title,
      this.text,
      this.price,
      this.id_acc,
      this.date,
      this.heure,

      this.urgent,
      this.lat,
      this.lng,
      this.comment_total,
      this.comment_average,
      this.framed,
      this.auteur,
      this.phone,
      this.phone_hidden,
      this.visit_num,
      this.date_last_visit,
      this.heure_last_visit,
      this.picture_num,
      this.picture_name,
      this.categorie,
      this.nomeField,
      this.field,
      this.nomoption1,
      this.uniteoption1,
      this.option1,
      this.quantite,
      this.email,
      this.city);

  showField() {
    if (this.nomeField == 'null')
      return false;
    else
      return true;
  }

  showOption1() {
    if (this.nomoption1 == 'null')
      return false;
    else
      return true;
  }
}
