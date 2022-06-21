import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:notepad_app/src/presentation/pages/create_note_screen.dart';

class NotepadHomeScreen extends StatefulWidget {
  static String routeName = "notepad_home_screen";
  const NotepadHomeScreen({Key? key}) : super(key: key);

  @override
  State<NotepadHomeScreen> createState() => _NotepadHomeScreenState();
}

class _NotepadHomeScreenState extends State<NotepadHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.pushNamed(context, CreateNoteScreen.routeName);
        },
        child: const Icon(
          Icons.add_outlined,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Observer(
          builder: ((context) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              child: const Center(
                child: Text(
                  "Nenhuma anotação foi criada",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
