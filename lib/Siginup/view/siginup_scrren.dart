import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ScreenRegister extends StatefulWidget {
  const ScreenRegister({super.key});

  @override
  State<ScreenRegister> createState() => _ScreenRegisterState();
}

class _ScreenRegisterState extends State<ScreenRegister> {
  TextEditingController emailController = TextEditingController(),
      passwrodController = TextEditingController(),
      mobileController = TextEditingController(),
      confromPasswrodController = TextEditingController();

  final fromkey = GlobalKey<FormState>();

  // void validteTextfield() {
  //   if (fromkey.currentState!.validate()) {
  //     // ScaffoldMessenger.of(context)
  //     //     .showSnackBar(SnackBar(content: Text("Succfully register")));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: fromkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 110,
                    ),
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/siginup.png",
                          height: 250,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Signup",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          hintText: "Email",
                          suffixIcon: Icon(Icons.person_outline_rounded)),
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
                      controller: mobileController,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          hintText: "Mobilno",
                          suffixIcon: Icon(Icons.mobile_friendly_outlined)),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^(\+\d{1,3}[- ]?)?\d{10}$')
                                .hasMatch(value)) {
                          return "Wrong  mobile number ";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: passwrodController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          hintText: "passwrod",
                          suffixIcon: Icon(Icons.remove_red_eye_rounded)),
                      validator: (value) {
                        if (value!.length <= 6) {
                          return 'Should be atleast 6 charcaters';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: confromPasswrodController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          hintText: "Cnform Passwrod",
                          suffixIcon: Icon(Icons.remove_red_eye)),
                      validator: (value) {
                        if (value != passwrodController.text) {
                          return "Passwrod is correct";
                        }
                        // } else {
                        //   return "Passwrod is incorrect";
                        // }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 40,
                      width: 300,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            side:
                                const BorderSide(width: 3, color: Colors.white),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          onPressed: () {
                            if (fromkey.currentState!.validate()) {
                              CreateUser(
                                  emailController.text, // = email
                                  passwrodController.text, // = passwrod
                                  mobileController.text,
                                  confromPasswrodController.text,
                                  context);
                            }
                          },
                          child: const Text("Siginup")),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account ?"),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Login"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> CreateUser(String email, String mobil, String passwrod,
    String confrompass, BuildContext context) async {
  final auth = FirebaseAuth.instance;
  final userRef = FirebaseFirestore.instance.collection('Users');

  try {
    await auth.createUserWithEmailAndPassword(email: email, password: passwrod);
    await userRef.add({
      "userid": auth.currentUser!.uid,
      "email": email,
      "mobil": mobil,
      "passwrod": passwrod,
      "confrom passwrod": confrompass,
      "profileimage": ''
    });
    Navigator.pushNamed(context, 'Login');
  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.code)));
    print(e.code);
    print("Login filed");
  }
}
