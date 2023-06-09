import 'package:flutter/foundation.dart';
import 'package:trocbuy/model/message_model.dart';

import '../model/ad.dart';

class MessageModelProv with DiagnosticableTreeMixin, ChangeNotifier {
 late  MessageModel messageModel;

  change(MessageModel value) {
    messageModel =value;
    notifyListeners();
  }
}
