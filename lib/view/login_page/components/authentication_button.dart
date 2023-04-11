import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/password_provider.dart';

class AuthenticationButton extends StatelessWidget {
  const AuthenticationButton(
      {Key? key,
      required this.controller,
      required this.validator,
      required this.hintText,
      this.isEmail = false})
      : super(key: key);

  final TextEditingController controller;
  final String? Function(String?) validator;
  final String hintText;
  final bool isEmail;
  @override
  build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(10.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15.0),
          suffixIcon: IconButton(
            onPressed: () {
              Provider.of<PasswordProvider>(context, listen: false)
                  .changeHidePassword();
            },
            icon: !isEmail
                ? Icon(
                    Provider.of<PasswordProvider>(context).hidePassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey.shade600,
                  )
                : Icon(Icons.email),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade600),
        ),
        obscureText: !isEmail
            ? Provider.of<PasswordProvider>(context).hidePassword
            : false,
      ),
    );
  }
}
