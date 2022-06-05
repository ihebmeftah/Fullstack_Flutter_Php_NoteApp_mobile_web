import 'package:flutter/material.dart';
import 'package:flutter_api_php/controllers/controller.dart';
import 'package:flutter_api_php/views/screens/login.dart';
import 'package:get/get.dart';

import '../components/components.dart';

// ignore: must_be_immutable
class Siginup extends StatelessWidget {
  Siginup({Key? key}) : super(key: key);
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> keyform = GlobalKey();

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
            'Sign in',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
          Form(
              key: keyform,
              child: Column(
                children: [
                  defaultTextFormField(
                      htext: 'User',
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'User name is required';
                        }
                        return null;
                      },
                      controller: username,
                      prefixIcon: Icons.abc,
                      textInputType: TextInputType.name),
                  const SizedBox(
                    height: 10,
                  ),
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
                      if (keyform.currentState!.validate()) {
                        await controller.siginup(
                            username: username.text,
                            email: email.text,
                            password: password.text);
                      }
                    },
                    label: 'Sign Up');
              }),
          TextButton(
              onPressed: () {
                Get.off(() => const Login());
              },
              child: const Text('I have Account'))
        ],
      ),
    ));
  }
}
