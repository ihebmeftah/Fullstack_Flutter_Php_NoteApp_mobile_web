import 'package:flutter_api_php/views/components/components.dart';
import 'package:get/get.dart';

import '../const.dart';
import '../main.dart';
import '../services/httpapi.dart';
import '../views/screens/homepage.dart';

class NotesController extends GetxController with HttpApi {
  HttpApi dio = HttpApi();
  int i = 0;

  login({
    required String email,
    required String password,
  }) async {
    var response = await dio.post(urlloginApi, {
      'usermail': email,
      'userpassword': password,
    });
    if (response['status'] == 'successfully') {
      snackbar(isError: false, title: 'Done', msg: 'Connected Successfully');

      shP.setString('id', response['data']['id'].toString());
      shP.setString('name', response['data']['username'].toString());
      shP.setString('email', response['data']['usermail'].toString());

      Get.offAll(() => Homepage());
    } else {
      snackbar(isError: true, title: 'Failed', msg: 'Compte inexisted');
    }
    update();
  }

  siginup({
    required String username,
    required String email,
    required String password,
  }) async {
    var response = await dio.post(urlsignupApi, {
      'username': username,
      'usermail': email,
      'userpassword': password,
    });
    if (response['status'] == 'successfully') {
      snackbar(
          isError: false, title: 'Done', msg: 'Registre Done Successfully');
    } else {
      snackbar(isError: true, title: 'Failed', msg: 'Registre Failed ');
    }
    update();
  }

  Future getNotes() async {
    var response = await post(getNoteApi, {"id": shP.getString('id')});
    update();
    return response;
  }

  Future createnote({
    required String title,
    required String content,
  }) async {
    var response = await post(
      createNoteApi,
      {'not_title': title, "notes_content": content, "id": shP.getString('id')},
    );
    update();
    return response;
  }

  Future deletenote({required String index}) async {
    var response = await post(deleteNoteApi, {"id": index});
    update();

    return response;
  }
}
