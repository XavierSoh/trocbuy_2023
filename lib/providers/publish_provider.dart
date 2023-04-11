import 'dart:io';

import 'package:flutter/foundation.dart'
    show ChangeNotifier, DiagnosticableTreeMixin;
import 'package:flutter/material.dart';

import '../constants/constants.dart' show PictureNum;

class PublishProvider with ChangeNotifier, DiagnosticableTreeMixin {
  // Screen 1: Ads info

  String title = '';
  String price = '';
  String text = '';
  String webSite = '';
  String password = '';
  String videoWebSite = '';
  String categoriesName = 'Choisissez la catégorie';
  String categoriesSelect = '';
  String region = 'Choisissez la région';
  String regionId = '';
  String regionSelect = '';
  String regionSelectId = '';
  String subCatsOptionsSelect = '';
  String subCatsOptions = 'Choisissez la sous catégorie';
  String subRegOptionsSelect = '';
  String subRegOptionsSelectId = '';
  String subRegOptions = 'Choisissez le département';
  String subRegOptionsId = '';
  String city = '';
  String postalCode = '';
  String address = '';
  String phoneNumber = '';
  bool checkBoxPhoneHidden = false;
  bool colorGPS = false;

  void changeTitle(String value) {
    title = value;
    notifyListeners();
  }

  void changePassword(String value) {
    title = value;
    notifyListeners();
  }

  void changePrice(String value) {
    price = value;
    notifyListeners();
  }

  void changeText(String value) {
    text = value;
    notifyListeners();
  }

  void changeWebSite(String value) {
    webSite = value;
    notifyListeners();
  }

  void changeVideoWebSite(String value) {
    videoWebSite = value;
    notifyListeners();
  }

  void changeCategoriesSelect(String catsSelect) {
    categoriesSelect = catsSelect;
    notifyListeners();
  }

  void changeCategoriesName(String catsName) {
    categoriesName = catsName;
    subCatsOptions = 'Choisissez la sous catégorie';
    notifyListeners();
  }

  void changeSubCatsOptionsSelect(String subCatsSelect) {
    subCatsOptionsSelect = subCatsSelect;
    notifyListeners();
  }

  void changeSubCatsOptions(String subCats) {
    subCatsOptions = subCats;
    notifyListeners();
  }

  void changeRegionSelect(String regSelect, String idSelect) {
    regionSelect = regSelect;
    regionSelectId = idSelect;
    notifyListeners();
  }

  void changeRegion(String reg, String id) {
    region = reg;
    regionId = id;
    subRegOptions = 'Choisissez le département';
    notifyListeners();
  }

  void changeSubRegOptionsSelect(String subRegSelect, String subRegSelectId) {
    subRegOptionsSelect = subRegSelect;
    subRegOptionsSelectId = subRegSelectId;
    notifyListeners();
  }

  void changeSubRegOptions(String subReg, String subRegId) {
    subRegOptions = subReg;
    subRegOptionsId = subRegId;
    notifyListeners();
  }

  void changeCity(String value) {
    city = value;
    notifyListeners();
  }

  void changePostalCode(String value) {
    postalCode = value;
    notifyListeners();
  }

  void changeAddress(String value) {
    address = value;
    notifyListeners();
  }

  void changePhoneNumber(String value) {
    phoneNumber = value;
    notifyListeners();
  }

  void changeCheckBoxPhoneHidden(bool checkValue) {
    checkBoxPhoneHidden = checkValue;
    notifyListeners();
  }

  void colorGPSChanged(bool checkValue) {
    colorGPS = checkValue;
    notifyListeners();
  }

  // Screen 01: More info for ads categories
  final formKey = GlobalKey<FormState>();
  TextEditingController kmController = TextEditingController();
  TextEditingController kmControllerVoiture = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController date1erController = TextEditingController();
  TextEditingController voitureModelController = TextEditingController();
  TextEditingController puissanceController = TextEditingController();
  TextEditingController tailleController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController surfaceController = TextEditingController();
  TextEditingController cauchageController = TextEditingController();
  TextEditingController pointureController = TextEditingController();
  String nameCatsSelect = '';
  String idCatsSelect = '';

  void changeNameId(String name, String id) {
    nameCatsSelect = name;
    idCatsSelect = id;

    notifyListeners();
  }

  Map<String, dynamic> moreInfo = {};
  void addToMoreInfoMap(String key, String value) {
    moreInfo.addAll({key: value});
    notifyListeners();
  }

  // Screen 2: Pictures
  int pictureNumber = 0;
  var imagePath = List<String>.generate(PictureNum.number, (index) => '');
  var imageBase64 = List<String>.generate(PictureNum.number, (index) => '');
  var imageName = List<String>.generate(PictureNum.number, (index) => '');
  void updatePictureNumber() {
    pictureNumber = (imagePath.length - 1);
    notifyListeners();
  }

  //---------------------------------------
  void changeImagePath(dynamic value, int index) {
    imagePath[index] = value.path;
    notifyListeners();
  }

  void changeImageName(dynamic value, int index) {
    imageName[index] = value.path.split('/').last;
    notifyListeners();
  }

  void changeImageBase64(String value64, int index) {
    imageBase64[index] = value64;
    notifyListeners();
  }

  //---------------------------------------
  void addNewPathEmpty() {
    imagePath.add('');
    notifyListeners();
  }

  void addNewImageNameEmpty() {
    imageName.add('');
    notifyListeners();
  }

  void addNewImageBase64Empty() {
    imageBase64.add('');
    notifyListeners();
  }

  //---------------------------------------
  void removeImagePath(int index) {
    imagePath.removeAt(index);
    notifyListeners();
  }

  void removeImageName(int index) {
    imageName.removeAt(index);
    notifyListeners();
  }

  void removeImageBase64(int index) {
    imageBase64.removeAt(index);
    notifyListeners();
  }
  // Screen 3: Options and Condition

  String radioItem1 = "";
  String radioItem2 = "";
  String radioItem3 = "";
  String radioItem4 = "";
  bool checkBoxOption = false;
  bool checkBoxCondition = false;
  void changeRadioItem1(String value) {
    radioItem1 = value;
    checkBoxOption = false;
    notifyListeners();
  }

  void changeRadioItem2(String value) {
    radioItem2 = value;
    checkBoxOption = false;
    notifyListeners();
  }

  void changeRadioItem3(String value) {
    radioItem3 = value;
    checkBoxOption = false;
    notifyListeners();
  }

  void changeRadioItem4(String value) {
    radioItem4 = value;
    checkBoxOption = false;
    notifyListeners();
  }

  void changeCheckBoxOption(bool value) {
    if (value) {
      radioItem1 = 'Item 1';
      radioItem2 = 'Item 6';
      radioItem3 = 'Item 11';
      radioItem4 = 'Item 16';
    }

    checkBoxOption = value;
    notifyListeners();
  }

  void changeCheckBoxCondition(bool value) {
    checkBoxCondition = value;

    notifyListeners();
  }

  void clearPublishProvider() {
    title = '';
    price = '';
    text = '';
    webSite = '';
    password = '';
    videoWebSite = '';
    categoriesName = 'Choisissez la catégorie';
    categoriesSelect = '';
    region = 'Choisissez la région';
    regionId = '';
    regionSelect = '';
    regionSelectId = '';
    subCatsOptionsSelect = '';
    subCatsOptions = 'Choisissez la sous catégorie';
    subRegOptionsSelect = '';
    subRegOptionsSelectId = '';
    subRegOptions = 'Choisissez le département';
    subRegOptionsId = '';
    city = '';
    postalCode = '';
    address = '';
    phoneNumber = '';
    checkBoxPhoneHidden = false;
    colorGPS = false;
    kmController.clear();
    kmControllerVoiture.clear();
    dateController.clear();
    date1erController.clear();
    voitureModelController.clear();
    puissanceController.clear();
    tailleController.clear();
    ageController.clear();
    surfaceController.clear();
    cauchageController.clear();
    pointureController.clear();
    nameCatsSelect = '';
    idCatsSelect = '';
    moreInfo = {};
    pictureNumber = 0;
    imagePath = List<String>.generate(PictureNum.number, (index) => '');
    imageBase64 = List<String>.generate(PictureNum.number, (index) => '');
    imageName = List<String>.generate(PictureNum.number, (index) => '');
    radioItem1 = "";
    radioItem2 = "";
    radioItem3 = "";
    radioItem4 = "";
    checkBoxOption = false;
    checkBoxCondition = false;
    notifyListeners();
  }
}
