import 'package:flutter/material.dart';
import 'package:state_tutorial/domain/model/database_service.dart';
import 'package:state_tutorial/domain/model/note_model.dart';
import 'package:state_tutorial/theme/my_color.dart';
import 'package:state_tutorial/ui/create_note.dart';
import 'package:state_tutorial/ui/edit_note.dart';

class NoteRead extends StatelessWidget {
  const NoteRead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CreateNote(),
                    fullscreenDialog: true,
                  ));
                },
                icon: const Icon(Icons.add),
                color: Colors.purple,
              )
            ],
            backgroundColor: MyAppBar.appBar.appColor,
            title: const Text(
              'Flutter別荘日記',
              style: TextStyle(color: Colors.deepPurple),
            )),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Expanded(
                child: StreamBuilder<List<NoteModel>>(
                  stream: DataBaseService().listNotes(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator(
                          color: Colors.green, strokeWidth: 8.0);
                    }
                    List<NoteModel>? notes = snapshot.data;
                    return ListView.builder(
                        itemCount: notes!.length,
                        itemBuilder: (context, index) {
                          final note = notes[index];
                          return ListTile(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      NoteDetail(note: note)));
                            },
                            title: Text(note.title),
                            subtitle: Text(note.body),
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
