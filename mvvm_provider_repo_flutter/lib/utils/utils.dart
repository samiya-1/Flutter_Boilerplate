import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

 static void focusChange(BuildContext context,FocusNode currentNode,FocusNode nextFocus){
currentNode.unfocus();
FocusScope.of(context).requestFocus(nextFocus);
 }




  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message, backgroundColor: Colors.red);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.bounceIn,
        message: message,
        backgroundColor: Colors.blue,
        title: 'Internet Connection Error',
        duration: Duration(seconds: 10),
      )..show(context),
    );
  }

  static snackBars(String message, BuildContext context) {
    return ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
