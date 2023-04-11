class Informations2 {
  final String nomoption2, option2, quantite2;

  Informations2(this.nomoption2, this.option2, this.quantite2);

  showOption2() {
    if (this.nomoption2 == 'null')
      return false;
    else
      return true;
  }
}
