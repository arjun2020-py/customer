import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController(),
      passwrodControlller = TextEditingController();

  //create key for from vlidation
  final fromkey = GlobalKey<FormState>();
  void validateTextfield() {
    if (fromkey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Processing Data")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: fromkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              constraints: const BoxConstraints.tightForFinite(width: 500),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white10)),
              child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 130,
                          ),
                          Center(
                            child: Image.asset(
                              "assets/images/log1.png",
                              height: 300,
                            ),
                          ),
                          const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: const OutlineInputBorder(),
                                hintText: "Email",
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.person_outline_rounded))),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$')
                                      .hasMatch(value)) {
                                return 'Please Enter vaild email address';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: passwrodControlller,
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: const OutlineInputBorder(),
                              hintText: "Passwrod",
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon:
                                      const Icon(Icons.remove_red_eye_rounded)),
                            ),
                            validator: (value) {
                              if (value!.length <= 6) {
                                return 'Should be atleast 6 charcaters';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                              height: 40,
                              width: 300,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    side: const BorderSide(
                                        width: 3, color: Colors.white),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  onPressed: () async {
                                    validateTextfield();
                                    final auth = FirebaseAuth.instance;
                                    try {
                                      await auth.signInWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passwrodControlller.text);

                                      // ignore: use_build_context_synchronously
                                      Navigator.of(context)
                                          .pushNamed("Dashboad");
                                    } on FirebaseAuthException catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                              SnackBar(content: Text(e.code)));
                                      print(e.code);
                                      print("Login failed");
                                    }
                                  },
                                  child: const Text("Login"))),
                          const SizedBox(
                            height: 10,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed("Forgot");
                              },
                              child: const Text("Forgot Password?")),
                          TextButton(
                              onPressed: () =>
                                  Navigator.of(context).pushNamed("Register"),
                              child: const Text("Create an Account?")),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 20.0),
                                child: const Divider(
                                  color: Colors.black45,
                                  thickness: 0.3,
                                ),
                              )),
                              const Text("Or login with"),
                              Expanded(
                                  child: Container(
                                margin: const EdgeInsets.only(
                                    left: 20.0, right: 10.0),
                                child: const Divider(
                                  color: Colors.black45,
                                  thickness: 0.3,
                                ),
                              )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.facebook_rounded),
                                color: Colors.blueAccent,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const FaIcon(
                                    FontAwesomeIcons.twitter,
                                    color: Colors.blue,
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
