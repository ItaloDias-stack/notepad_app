import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:notepad_app/src/presentation/components/custom_buttom.dart';
import 'package:notepad_app/src/presentation/components/custom_text_field.dart';
import 'package:notepad_app/src/stores/google_sign_in_store.dart';
import 'package:notepad_app/src/stores/register_store.dart';
import 'package:notepad_app/src/utils/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = "register_screen";
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  late GoogleSignInStore googleSignInStore =
      GetIt.instance.get<GoogleSignInStore>();
  late RegisterStore registerStore = GetIt.instance.get<RegisterStore>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryColor,
      body: Observer(builder: (context) {
        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Container(
                height: 470,
                width: MediaQuery.of(context).size.width - 100,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: googleSignInStore.isLoading
                      ? Center(
                          child: CircularProgressIndicator.adaptive(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              CustomColors.primaryColor,
                            ),
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: CustomColors.primaryColor,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.person,
                                    size: 100,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  CustomTextField(
                                    labelText: "E-mail",
                                    isPassword: false,
                                    placeholder: "Digite seu e-mail",
                                    controller: emailController,
                                    onChanged: registerStore.setEmail,
                                    validator: (value) =>
                                        value == null || value.isEmpty
                                            ? "Campo obrigatório"
                                            : null,
                                    icon: const Icon(Icons.person_outline),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CustomTextField(
                                    labelText: "Senha",
                                    isPassword: true,
                                    placeholder: "Digite sua senha",
                                    controller: passController,
                                    icon: const Icon(Icons.vpn_key),
                                    onChanged: registerStore.setPassword,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Campo obrigatório";
                                      } else if (value.length < 6) {
                                        return "A senha precisa ter no mínimo 6 caracteres";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  CustomButtom(
                                    text: "Salvar",
                                    backgroundColor: CustomColors.primaryColor,
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        print(registerStore.user.email);
                                        print(registerStore.user.password);
                                        await googleSignInStore
                                            .registerWithEmailAndPassword(
                                                context, registerStore.user);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
