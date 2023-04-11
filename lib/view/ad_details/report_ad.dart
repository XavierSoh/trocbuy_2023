import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:provider/provider.dart';
import '../../res/strings.dart';
import '../components/app_bar/default_app_bar.dart';

import '../../providers/selected_ad.dart';
import '../account/component/text_form_field_email.dart';
import '../account/component/textformfield_normal.dart';
import '../components/button_create.dart';

class ReportAd extends StatefulWidget {
  const ReportAd({Key? key}) : super(key: key);

  @override
  _ReportAdState createState() => _ReportAdState();
}

class _ReportAdState extends State<ReportAd> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController reportController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addNumberController = TextEditingController();

  String supportToContact = Strings.kTheDirection;

  @override
  build(BuildContext context) {
    final selectedAd = context.read<SelectedAd>().ad;
    addNumberController.text =
        Strings.kAddNumberText + selectedAd!.idAd.toString();
    reportController.text = Strings.reportControllerText;
    return Scaffold(
      appBar: DefaultAppBar(
        title: Strings.kContactFormText,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              TextFormFieldNormal(
                controller: nameController,
                hintText: Strings.kYourName,
                validator: (value) {
                  if (value!.isEmpty) {
                    return Strings.kYouForgotYorName;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormFieldEmail(
                controller: emailController,
              ),
              const SizedBox(height: 20),
              TextFormFieldNormal(
                controller: phoneController,
                hintText: Strings.kYourPhoneOptional,
                withTextSize: true,
                validator: (value) {
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(10.0),
                child: DropdownButtonFormField(
                  value: supportToContact,
                  items: [Strings.kTheDirection, Strings.kTechnicalService]
                      .map(
                        (e) => DropdownMenuItem<String>(
                          child: Text(e),
                          value: e,
                        ),
                      )
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      supportToContact = newValue!;
                    });
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(15.0),
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormFieldNormal(
                controller: addNumberController,
              ),
              const SizedBox(height: 20),
              TextFormFieldNormal(
                controller: reportController,
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
                color: Colors.green,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      final Email email = Email(
                        body: phoneController.text +
                            "\n " +
                            addNumberController.text +
                            "\n" +
                            reportController.text,
                        subject: supportToContact,
                        recipients: ['sohfranc@gmail.com'],
                        //cc: ['cc@example.com'],
                        //bcc: ['bcc@example.com'],
                        //attachmentPaths: ['/path/to/attachment.zip'],
                        isHTML: false,
                      );

                      await FlutterEmailSender.send(email);
                    } catch (e) {}
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
