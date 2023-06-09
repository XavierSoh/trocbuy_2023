import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MessageModel {
  String? reference;
  String senderEmail;
  String receiverEmail;

  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  DateTime date;
  int? idAd;
  String? author;
  String? sender;
  String? title;
  String? message;
  bool unread;
  String? conversation;
  List<String> emails;

  static DateTime _dateFromJson(Timestamp timestamp) => timestamp.toDate();

  static Timestamp _dateToJson(DateTime time) => Timestamp.fromDate(time);

  MessageModel(
      {required this.senderEmail,
      this.reference,
      required this.emails,
      this.conversation,
      required this.receiverEmail,
      this.message,
      this.sender,
      required this.date,
      this.idAd,
      this.author,
      this.title,
      this.unread=true
      });

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);

  static fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageModel &&
          runtimeType == other.runtimeType &&
          conversation == other.conversation
          ;

  @override
  int get hashCode => conversation.hashCode ^ conversation.hashCode;
}
