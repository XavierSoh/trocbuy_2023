import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  TextEditingController? textEditingController;

  Function()? onPressed;
  String? hintText;
  bool? obscureText;
  PasswordField(
      {Key? key,
      this.textEditingController,
      this.onPressed,
      this.hintText,
      this.obscureText})
      : super(key: key);

  @override
  build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(10.0),
          child: TextFormField(
            textInputAction: TextInputAction.done,
            controller: textEditingController,
            // ignore: missing_return
            validator: (input) {
              if (input!.length < 6) {
                return 'Mot de passe doit contenir au moins 8 caractères';
              } else
                return null;
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(15.0),
                suffixIcon: IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    obscureText! ? Icons.visibility : Icons.visibility_off,
                    color:
                        obscureText! ? Colors.grey.shade600 : Colors.blueAccent,
                  ),
                ),
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey.shade600,
                )),
            obscureText: obscureText!,
          ),
        ),
      ),
    );
  }
}
