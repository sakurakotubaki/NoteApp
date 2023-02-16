import 'package:flutter/material.dart';
import 'package:state_tutorial/domain/model/note_model.dart';
import 'package:state_tutorial/theme/my_color.dart';

class NoteDetail extends StatelessWidget {
  const NoteDetail({Key? key, required this.note}) : super(key: key);

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyAppBar.appBar.appColor,
          title: const Text('日記詳細', style: TextStyle(color: Colors.deepPurple)),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Text(note.title),
                    const SizedBox(height: 20),
                    Text(note.body),
                    const SizedBox(height: 20),
                    Text(note.createdAt.toDate().toIso8601String())
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
