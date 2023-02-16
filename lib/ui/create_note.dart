import 'package:flutter/material.dart';
import 'package:state_tutorial/domain/model/database_service.dart';
import 'package:state_tutorial/theme/my_color.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({Key? key}) : super(key: key);

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ノートリポジトリをインスタンス化する.
    final notes = DataBaseService();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyAppBar.appBar.appColor,
        title: const Text('日記を作成', style: TextStyle(color: Colors.deepPurple)),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: title,
            ),
            TextField(
              controller: body,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () async {
                  // Firestoreに日記のデータを追加する.
                  setState(() {
                    notes.createNote(title.text, body.text);
                  });
                },
                child: const Text('日記を作成'))
          ],
        ),
      ),
    );
  }
}
