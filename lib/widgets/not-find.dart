import 'package:flutter/material.dart';

class NotFind extends StatelessWidget {
  NotFind({super.key , this.title = "খুঁজে পাওয়া যাচ্ছে না!"});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:  CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/not-find.png", fit: BoxFit.cover, height: 150, width: 150),
        Text("$title", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)
      ],
    ));
  }
}
