import 'package:flutter/material.dart';
import 'package:notepad_app/src/presentation/components/custom_text_field.dart';

class CreateNoteScreen extends StatefulWidget {
  static String routeName = "create_note_screen";

  const CreateNoteScreen({Key? key}) : super(key: key);

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  final _contentFocus = FocusNode();
  final _contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
      body: Container(
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
                  textStyle: TextStyle(
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
                    onChanged: (str) {},
                    maxLines: 300, // line limit extendable later
                    controller: _contentController,
                    focusNode: _contentFocus,
                    style: const TextStyle(color: Colors.black, fontSize: 22),
                    backgroundCursorColor: Colors.red,
                    cursorColor: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
