import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/is_login.dart';

Future<void> getFirestoreUser(User firebaseUser) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setString('id', firebaseUser.uid);
  await sharedPreferences.setString('email', firebaseUser.email!);
  await sharedPreferences.setString('nickname', firebaseUser.displayName!);
  await sharedPreferences.setString('photoUrl', firebaseUser.photoURL!);
}

Future<void> getDocumenteUser(List<DocumentSnapshot> documents) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  await sharedPreferences.setString('id', documents[0]['id']);
  await sharedPreferences.setString('email', documents[0]['email']);
  await sharedPreferences.setString('nickname', documents[0]['nickname']);
  await sharedPreferences.setString('photoUrl', documents[0]['photoUrl'] ?? '');
  await sharedPreferences.setString('aboutMe', documents[0]['aboutMe'] ?? '');
}

Future<void> setUserInfo(Response documents) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences
      .setString('id_acc', json.decode(documents.body)['id_acc'])
      .then((value) => IsLogin.state == true);
  // await sharedPreferences.setString(
  //     'email', json.decode(documents.body)['email'] ?? '');
  // await sharedPreferences.setString(
  //     'name', json.decode(documents.body)['name'] ?? '');
  // await sharedPreferences.setString(
  //     'pseudo', json.decode(documents.body)['pseudo'] ?? '');
  // await sharedPreferences.setString(
  //     'phone', json.decode(documents.body)['phone'] ?? '');
  // await sharedPreferences.setString(
  //     'civility', json.decode(documents.body)['civility'] ?? '');
  // await sharedPreferences.setString(
  //     'address', json.decode(documents.body)['address'] ?? '');
  // await sharedPreferences.setString(
  //     'city', json.decode(documents.body)['city'] ?? '');
  // await sharedPreferences.setString(
  //     'postcode', json.decode(documents.body)['postcode'] ?? '');
  // await sharedPreferences.setString(
  //     'type', json.decode(documents.body)['type'] ?? '');
  // await sharedPreferences.setString(
  //     'state', json.decode(documents.body)['state'] ?? '');
  // await sharedPreferences.setString(
  //     'first_name', json.decode(documents.body)['first_name'] ?? '');
  // await sharedPreferences.setString(
  //     'comp_name', json.decode(documents.body)['comp_name'] ?? '');
  // await sharedPreferences.setString(
  //     'comp_num', json.decode(documents.body)['comp_num'] ?? '');
}

// Future<void> getUserInfo({required BuildContext context}) async {

//   FavoriteFunctions.a =
//       await adsFavoriteMag().getListFavorite(Provider.of<InfoCompteController>(
//     context,
//   ).InfoGlobal['id_acc']);
//  }
