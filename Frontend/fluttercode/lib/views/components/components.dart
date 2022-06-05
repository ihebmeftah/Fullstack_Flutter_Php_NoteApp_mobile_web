import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget defaultTextFormField({
  String? Function(String? val)? validate,
  String?  valueinit,
  required String htext,
  bool isPass = false,
  Color cursorColor = Colors.white,
  double cursorHeight = 22.0,
  IconData? prefixIcon,
  IconData? sufixIcon,
  required TextEditingController? controller,
  TextInputAction? textInputAction,
  int? maxLength,
  int maxLines = 1,
  minLines,
  VoidCallback? pressicon,
  tapFunction,
  change,
  onsubmit,
  TextInputType? textInputType,
  Widget? label,
  bool? isEnable = true,
}) =>
    TextFormField(
      onFieldSubmitted: onsubmit,
      enabled: isEnable,
      validator: (value) => validate!(value),
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      textInputAction: textInputAction,
      controller: controller,
      cursorColor: cursorColor,
      cursorHeight: cursorHeight,
      obscureText: isPass,
      keyboardType: textInputType,
      onTap: tapFunction,
      onChanged: change, 
      initialValue : valueinit,
      decoration: InputDecoration(
          label: label,
          prefixIcon: Icon(
            prefixIcon,
          ),
          suffixIcon: IconButton(
            onPressed: pressicon,
            icon: Icon(
              sufixIcon,
            ),
            autofocus: false,
            color: Colors.black,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          hintText: htext),
    );

Widget myMaterialButton({
  required Function()? onpress,
  required String label,
}) =>
    MaterialButton(
      minWidth: 250.0,
      height: 50,
      onPressed: onpress,
      color: Colors.teal,
      child: Text(
        label.toUpperCase(),
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.white),
      ),
    );

snackbar({
  required bool isError,
  required String title,
  required String msg,
}) {
  return Get.snackbar(
    title,
    msg,
    backgroundColor: isError ? Colors.red : Colors.green,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.all(10),
  );
}
