import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:notepad_app/src/presentation/components/custom_buttom.dart';
import 'package:notepad_app/src/presentation/components/custom_icon_buttom.dart';
import 'package:notepad_app/src/presentation/components/custom_text_field.dart';
import 'package:notepad_app/src/presentation/pages/notepad_home_screen.dart';
import 'package:notepad_app/src/presentation/pages/register_screen.dart';
import 'package:notepad_app/src/stores/google_sign_in_store.dart';
import 'package:notepad_app/src/stores/register_store.dart';
import 'package:notepad_app/src/utils/app_colors.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login_screen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  late GoogleSignInStore googleSignInStore =
      GetIt.instance.get<GoogleSignInStore>();
  late RegisterStore registerStore = GetIt.instance.get<RegisterStore>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Observer(builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: googleSignInStore.isLoading
                ? Center(
                    child: CircularProgressIndicator.adaptive(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        CustomColors.primaryColor,
                      ),
                    ),
                  )
                : Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipPath(
                            clipper: MyClipper(),
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/full-bloom.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0, bottom: 20),
                                child: CustomTextField(
                                  labelText: "E-mail",
                                  isPassword: false,
                                  placeholder: "Digite seu e-mail",
                                  controller: emailController,
                                  onChanged: registerStore.setEmail,
                                  validator: (value) =>
                                      value == null || value.isEmpty
                                          ? "Campo obrigat??rio"
                                          : null,
                                  icon: const Icon(Icons.person_outline),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0),
                                child: CustomTextField(
                                  labelText: "Senha",
                                  isPassword: true,
                                  placeholder: "Digite sua senha",
                                  controller: passController,
                                  icon: const Icon(Icons.vpn_key),
                                  onChanged: registerStore.setPassword,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Campo obrigat??rio";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(height: 25),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0),
                                child: CustomButtom(
                                  text: "Login",
                                  backgroundColor: CustomColors.primaryColor,
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      await googleSignInStore
                                          .signInWithEmailAndPassword(
                                              context, registerStore.user);
                                      if (googleSignInStore.user != null) {
                                        Navigator.pushNamed(context,
                                            NotepadHomeScreen.routeName);
                                      }
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0),
                                child: CustomIconButtom(
                                  icon: const Icon(
                                    FontAwesomeIcons.google,
                                    color: Colors.white,
                                  ),
                                  text: "Login com google",
                                  backgroundColor: Colors.redAccent,
                                  onPressed: () async {
                                    await googleSignInStore
                                        .googleLogin(context);
                                    Navigator.pushNamed(
                                        context, NotepadHomeScreen.routeName);
                                  },
                                ),
                              ),
                              const SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0),
                                child: CustomButtom(
                                  onPressed: () => Navigator.pushNamed(
                                    context,
                                    RegisterScreen.routeName,
                                  ),
                                  text: "N??o possui uma conta?",
                                  backgroundColor: Colors.white,
                                  textColor: CustomColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
          );
        }),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = Path();
    p.lineTo(size.width, 0.0);
    p.lineTo(size.width, size.height * 0.85);
    p.arcToPoint(
      Offset(0.0, size.height * 0.85),
      radius: const Radius.elliptical(50.0, 10.0),
      rotation: 0.0,
    );
    p.lineTo(0.0, 0.0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
