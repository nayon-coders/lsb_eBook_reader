import 'package:flutter/material.dart';

Future alertPopup({required BuildContext context,required VoidCallback onYes})async{
  return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title:const Text("Are you sure ?"),
          content:const SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Are you sure? Do you want to Logout?"),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed:onYes, child: const Text("YES")),
            TextButton(onPressed:()=>Navigator.pop(context), child: const Text("NO")),
          ],
        );

      });
}