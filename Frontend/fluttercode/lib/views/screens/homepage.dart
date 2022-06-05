import 'package:flutter/material.dart';
import 'package:flutter_api_php/controllers/controller.dart';
import 'package:flutter_api_php/services/themeservices.dart';
import 'package:flutter_api_php/views/screens/login.dart';
import 'package:flutter_api_php/views/theme/theme.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../components/components.dart';

// ignore: must_be_immutable
class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);
  TextEditingController title = TextEditingController();
  TextEditingController file = TextEditingController(text: "abc");

  TextEditingController content = TextEditingController();
  GlobalKey<FormState> keyform3 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                ThemeServices().switchTheme();
              },
              icon: const Icon(Icons.dark_mode),
            ),
          ],
          leading: IconButton(
            onPressed: () {
              shP.clear();
              Get.to(() => const Login());
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.bottomSheet(
                isScrollControlled: true,
                Container(
                  padding: const EdgeInsets.all(15),
                  color: !ThemeServices().isDark() ? Colors.white : darkGreyClr,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Add Note',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                      Form(
                          key: keyform3,
                          child: Column(
                            children: [
                              defaultTextFormField(
                                  htext: 'Title',
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Title is required';
                                    }
                                    return null;
                                  },
                                  controller: title,
                                  textInputType: TextInputType.name),
                              const SizedBox(
                                height: 10,
                              ),
                              defaultTextFormField(
                                htext: 'Content',
                                maxLines: 5,
                                validate: (value) {
                                  if ((value!.isEmpty)) {
                                    return 'Enter your email correctly';
                                  } else if (value.isEmpty) {
                                    return 'Content is required ';
                                  }
                                  return null;
                                },
                                textInputType: TextInputType.text,
                                controller: content,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          )),
                      GetBuilder<NotesController>(
                        init: NotesController(),
                        builder: (controller) {
                          return myMaterialButton(
                              onpress: () async {
                                if (keyform3.currentState!.validate()) {
                                  controller.createnote(
                                    title: title.text,
                                    content: content.text,
                                  );
                                  Get.back();
                                }
                              },
                              label: 'Create Note');
                        },
                      ),
                    ],
                  ),
                ));
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        body: GetBuilder<NotesController>(
          init: NotesController(),
          builder: (controller) {
            return FutureBuilder(
              future: controller.getNotes(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data['status'] == 'Failed'
                      ? const Center(
                          child: Text(
                            "Don't Hava Any Notes",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                letterSpacing: 1.2),
                          ),
                        )
                      : GridView.builder(
                          controller: ScrollController(),
                          itemCount: snapshot.data['data'].length,
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      GetPlatform.isWeb || GetPlatform.isDesktop
                                          ? 5
                                          : 2,
                                  mainAxisSpacing: 2,
                                  crossAxisSpacing: 2),
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              margin: const EdgeInsets.all(8),
                              elevation: 4,
                              color: Colors.teal,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                          onPressed: () {
                                            controller.deletenote(
                                                index: snapshot.data['data']
                                                    [index]['notes_id']);
                                          },
                                          icon: const Icon(
                                            Icons.close,
                                          )),
                                    ),
                                    Text(
                                      snapshot.data['data'][index]['not_title']
                                          .toString()
                                          .toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Divider(
                                      thickness: 2,
                                      color: Colors.white38,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        snapshot.data['data'][index]
                                            ['notes_content'],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 7,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w200),
                                      ),
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Text(
                                        (index + 1).toString(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.teal,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          },
        ));
  }
}

/*









Container(
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.all(8),
                                color: Colors.teal,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                          onPressed: () {
                                            controller.deletenote(
                                                index: snapshot.data['data']
                                                    [index]['notes_id']);
                                          },
                                          icon: const Icon(
                                            Icons.close,
                                          )),
                                    ),
                                    Text(
                                      snapshot.data['data'][index]['not_title']
                                          .toString()
                                          .toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Divider(
                                      thickness: 2,
                                      color: Colors.white38,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        snapshot.data['data'][index]
                                            ['notes_content'],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 5,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w100),
                                      ),
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Text(
                                        (index + 1).toString(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.teal,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ));
                         

 */
