import 'package:flutter/widgets.dart';
import 'package:notepad_app/src/presentation/pages/create_note_screen.dart';
import 'package:notepad_app/src/presentation/pages/login_screen.dart';
import 'package:notepad_app/src/presentation/pages/notepad_home_screen.dart';
import 'package:notepad_app/src/presentation/pages/register_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  NotepadHomeScreen.routeName: (context) => const NotepadHomeScreen(),
  CreateNoteScreen.routeName: (context) => const CreateNoteScreen(),
};
