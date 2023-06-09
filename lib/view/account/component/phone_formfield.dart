import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:trocbuy/constants/constants.dart';

class PhoneFormField extends StatelessWidget {
  const PhoneFormField({Key? key, required this.controller}) : super(key: key);
final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return  Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(10.0),
      child: InternationalPhoneNumberInput(
        selectorConfig: const SelectorConfig(
          useEmoji: true,
          leadingPadding: 16.0,
          trailingSpace: false,
        ),
        inputDecoration: const InputDecoration(
            hintText: 'Numéro de téléphone',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15.0)),
        locale: 'fr_FR',
        textFieldController: controller,
        textStyle: TextStyle(
          color: Colors.grey.shade600,
        ),
        errorMessage: 'Numéro de téléphone invalide',
        autoValidateMode: AutovalidateMode.onUserInteraction,
        countries: const ['FR'],
        onInputChanged: (value) {
          CompteInformation.info['phone'] = value.phoneNumber;
        },
      ),
    );
  }
}
