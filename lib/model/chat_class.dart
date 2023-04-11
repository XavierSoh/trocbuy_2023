import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  String sender;
  String receiver;
  String senderUid;
  String receiverUid;
  String message;
  Timestamp timestamp;

  Chat(this.sender, this.receiver, this.senderUid, this.receiverUid,
      this.message, this.timestamp);
}
