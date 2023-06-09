class DefaultValidator {
  static String? validator(String? value) {
    if (value!.isEmpty) {
      return "Veuillez remplir ce champ";
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return "Veuillez entrer votre nom";
    }
    return null;
  }
  static String? enterpriseNameValidator(String? value) {
    if (value!.isEmpty) {
      return "Veuillez renseigner le nom de l'entreprise";
    }
    return null;
  }
  static String? postalValidator(String? value) {
    if (value!.isEmpty) {
      return "Code postal requis";
    }
    return null;
  }

}
