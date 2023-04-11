import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../res/strings.dart';
import '../../res/styles.dart';
import '../account/component/text_form_field_email.dart';
import '../account/component/textformfield_normal.dart';
import '../components/app_bar/default_app_bar.dart';
import '../components/button_create.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController reportController = TextEditingController();
  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: Strings.kContactUs),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 50),
              TextFormFieldEmail(
                controller: emailController,
                onChanged: (String value) {
                  emailController.text = value;
                },
              ),
              const SizedBox(height: 20),
              TextFormFieldNormal(
                controller: reportController,
                hintText: Strings.kSendProblem,
                maxLines: 8,
                validator: (value) {
                  if (value.toString().isEmpty) return '*';
                  return null;
                },
                onChanged: (String string) {
                  reportController.text = string;
                },
                suffixIcon: const SizedBox.shrink(),
              ),
              const SizedBox(height: 80),
              ButtonCreate(
                padding: EdgeInsets.zero,
                title: Strings.kSend,
                color: Styles.principalColor,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      await EasyLoading.show(status: Strings.kRunning);
                    } catch (e) {
                      EasyLoading.showError(
                        Strings.kTryAgainLater,
                        duration: const Duration(seconds: 2),
                      );
                    }
                    EasyLoading.dismiss();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
