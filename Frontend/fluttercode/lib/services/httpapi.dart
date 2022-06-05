// ignore_for_file: file_names, avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter_api_php/views/components/components.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class HttpApi {

  
  uploadrequedt(String url, Map data, File file) async {
    var request = http.MultipartRequest("POST", Uri.parse(url));
    var stream = http.ByteStream(file.openRead());
    var length = await file.length();
    var mfile = http.MultipartFile('file', stream, length,
        filename: basename(file.path));
    request.files.add(mfile);
    data.forEach((key, value) {
      request.fields[key] = value;
    });

    var myrequest = await request.send();
    var response = await http.Response.fromStream(myrequest);
    if (myrequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      snackbar(
          isError: true,
          title: 'statusCode',
          msg: myrequest.statusCode.toString());
    }
  }

  post(String url, Map data) async {
    try {
      var resp = await http.post(Uri.parse(url), body: data);
      if (resp.statusCode == 200) {
        return jsonDecode(resp.body);
      } else {
        print(resp.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
