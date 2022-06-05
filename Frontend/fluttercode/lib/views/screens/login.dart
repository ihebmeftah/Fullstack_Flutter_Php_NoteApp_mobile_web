// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_api_php/controllers/controller.dart';
import 'package:flutter_api_php/views/screens/siginup.dart';
import 'package:get/get.dart';

import '../components/components.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  GlobalKey<FormState> keyform2 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: GetPlatform.isWeb
          ? const EdgeInsets.all(150.0)
          : const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Log in',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
          Form(
              key: keyform2,
              child: Column(
                children: [
                  defaultTextFormField(
                      htext: 'Email',
                      validate: (value) {
                        if (!GetUtils.isEmail(value!)) {
                          return 'Enter your email correctly';
                        } else if (value.isEmpty) {
                          return 'Email is required ';
                        }
                        return null;
                      },
                      textInputType: TextInputType.emailAddress,
                      controller: email,
                      prefixIcon: Icons.abc),
                  const SizedBox(
                    height: 10,
                  ),
                  defaultTextFormField(
                      htext: 'Password',
                      validate: (value) {
                        if (value!.length < 6) {
                          return 'Your password is less';
                        } else if (value.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                      textInputType: TextInputType.text,
                      isPass: true,
                      controller: password,
                      prefixIcon: Icons.abc),
                  const SizedBox(
                    height: 10,
                  )
                ],
              )),
          GetBuilder<NotesController>(
            init: NotesController(),
            builder: (controller) {
              return myMaterialButton(
                  onpress: () async {
                    if (keyform2.currentState!.validate()) {
                      await controller.login(
                          email: email.text, password: password.text);
                    }
                  },
                  label: 'Log In');
            },
          ),
          TextButton(
              onPressed: () {
                Get.off(() => Siginup());
              },
              child: const Text('Create Account'))
        ],
      ),
    ));
  }
}
