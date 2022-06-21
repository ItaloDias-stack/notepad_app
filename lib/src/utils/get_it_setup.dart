import 'package:get_it/get_it.dart';
import 'package:notepad_app/src/stores/google_sign_in_store.dart';
import 'package:notepad_app/src/stores/note_store.dart';
import 'package:notepad_app/src/stores/register_store.dart';

void getItSetup() {
  //Stores
  GetIt.I.registerSingleton<GoogleSignInStore>(
    GoogleSignInStore(),
  );

  GetIt.I.registerSingleton<RegisterStore>(
    RegisterStore(),
  );

  GetIt.I.registerSingleton<NoteStore>(
    NoteStore(),
  );
}
