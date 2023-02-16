import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:state_tutorial/domain/model/note_model.dart';

class DataBaseService {
  // Firestoreのnotesコレクションへアクセスするゲッター
  CollectionReference get notesCollection =>
      FirebaseFirestore.instance.collection('notes');

  // Firestoreにデータを追加するメソッド.
  Future<void> createNote(String title, String body) async {
    final now = DateTime.now();
    await notesCollection.add({
      'title': title,
      'body': body,
      'createdAt': Timestamp.fromDate(now),
    });
  }

  // Map<String, dynamic>と同じことをしている.
  List<NoteModel> noteFromFirestore(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      return NoteModel(
        documentReference: e.reference,
        createdAt: e['createdAt'],
        uid: e.id,
        title: e['title'],
        body: e['body'],
      );
    }).toList();
  }

  // Firestoreから全てのデータを取得する.
  Stream<List<NoteModel>> listNotes() {
    return notesCollection.snapshots().map(noteFromFirestore);
  }
}
