import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  String uid;
  String title;
  String body;
  DocumentReference documentReference;
  Timestamp createdAt;

  NoteModel(
      {required this.uid,
      required this.title,
      required this.body,
      required this.documentReference,
      required this.createdAt});
}
