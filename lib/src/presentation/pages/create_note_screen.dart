import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:notepad_app/src/models/note.dart';
import 'package:notepad_app/src/presentation/components/custom_text_field.dart';
import 'package:notepad_app/src/stores/google_sign_in_store.dart';
import 'package:notepad_app/src/stores/note_store.dart';
import 'package:notepad_app/src/utils/app_colors.dart';

class CreateNoteScreen extends StatefulWidget {
  static String routeName = "create_note_screen";

  const CreateNoteScreen({Key? key}) : super(key: key);

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  final _contentFocus = FocusNode();
  final _contentController = TextEditingController();
  final _titleController = TextEditingController();
  late NoteStore noteStore = GetIt.instance.get<NoteStore>();

  late GoogleSignInStore googleSignInStore =
      GetIt.instance.get<GoogleSignInStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              child: const Icon(
                Icons.check,
                size: 30,
                color: Colors.grey,
              ),
              onTap: () async {
                await noteStore.createANoteInFirebase(
                  context: context,
                  uidUsuario: googleSignInStore.user!.uid,
                  content: _contentController.text,
                  title: _titleController.text,
                );
              },
            ),
          ),
        ],
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_outlined,
            size: 30,
            color: Colors.grey,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Observer(builder: (context) {
        return noteStore.isLoading
            ? Container(
                height: MediaQuery.of(context).size.height,
                child: CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    CustomColors.primaryColor,
                  ),
                ),
              )
            : Container(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: CustomTextField(
                          isPassword: false,
                          placeholder: "Título...",
                          haveBorder: false,
                          controller: _titleController,
                          textStyle: const TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: EditableText(
                            //onChanged: (str) {},
                            maxLines: 300, // line limit extendable later
                            controller: _contentController,
                            focusNode: _contentFocus,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 22),
                            backgroundCursorColor: Colors.red,
                            cursorColor: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
