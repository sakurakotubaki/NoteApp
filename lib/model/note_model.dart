import 'package:cloud_firestore/cloud_firestore.dart';

// FireStoreのモデルクラスを作る.
class NoteModel {
  NoteModel(
      {required this.title,
      required this.description,
      required this.createdAt});

  NoteModel.fromJson(Map<String, Object?> json)
      : this(
          title: json['title']! as String,
          description: json['description']! as String,
          createdAt: json['createdAt']! as Timestamp,
        );

  final String title;
  final String description;
  final Timestamp createdAt;

  Map<String, Object?> toJson() {
    return {
      'title': title,
      'genre': description,
      'createdAt': createdAt,
    };
  }
}

final notesRef =
    FirebaseFirestore.instance.collection('notes').withConverter<NoteModel>(
          fromFirestore: (snapshot, _) => NoteModel.fromJson(snapshot.data()!),
          toFirestore: (note, _) => note.toJson(),
        );
