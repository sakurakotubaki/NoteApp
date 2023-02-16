import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:state_tutorial/model/note_model.dart';

// Firestoreを操作するクラス.
class NoteRepository {
  // Firestoreにアクセスするゲッター.
  final collection = FirebaseFirestore.instance.collection('notes');

  Stream<List<NoteModel>> getSearch() {
    final stream = collection.snapshots();
    return stream.map((event) => event.docs.map((doc) {
          return NoteModel.fromJson(doc.data());
        }).toList());
  }

  // Firestoreにデータを追加するメソッド.
  Future<void> createNote(String title, String description) async {
    final now = DateTime.now();
    await collection.add({
      'title': title,
      'description': description,
      'createdAt': Timestamp.fromDate(now),
    });
  }

  // Firestoreのデータを更新するメソッド.
  Future<void> updateItem(String id, String title, String description) async {
    final now = DateTime.now();
    await collection.doc(id).update({
      'title': title,
      'description': description,
      'updatedAt': Timestamp.fromDate(now),
    });
  }

  // Firestoreのデータを削除するメソッド.
  Future<void> deleteItem(String id) async {
    await collection.doc(id).delete();
  }
}
