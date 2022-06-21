import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:notepad_app/src/models/note.dart';
import 'package:uuid/uuid.dart';
part 'note_store.g.dart';

class NoteStore = _NoteStoreBase with _$NoteStore;

abstract class _NoteStoreBase with Store {
  final FirebaseDatabase _dbInst = FirebaseDatabase.instance;

  @observable
  bool isLoading = false;

  @action
  Future createANoteInFirebase(
      {required BuildContext context,
      String? title,
      String? content,
      required String uidUsuario}) async {
    isLoading = true;
    try {
      DatabaseReference _ref = _dbInst.ref(uidUsuario);
      var note = Note(
        idUsuario: uidUsuario,
        title: title,
        content: content,
        date_created: DateTime.now(),
      );
      note.id = const Uuid().v1();
      _ref.child(note.id);
      _ref.push().set(note.toJson());
      isLoading = false;
    } catch (e) {
      isLoading = false;
    }
  }
}
