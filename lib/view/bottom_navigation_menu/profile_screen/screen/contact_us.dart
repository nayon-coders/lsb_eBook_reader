import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../utility/app_color.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});
  final htmlData ="""<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Ahmed's English</title>
</head>
<body>
    <h1>Contact Us</h1>
    <p>Welcome to Ahmed’s English, an innovative online learning platform dedicated to helping students excel in English for various competitive exams, including SSC, HSC, university admission tests, BCS, and job exams in Bangladesh. Our mission is to provide high-quality English education, enabling learners to achieve their academic and professional goals. Founded by renowned English educator Ahmmad Ullah, the platform combines traditional teaching methods with modern technology to deliver a comprehensive learning experience.</p>

    <p>You can contact us through several ways. Choose the option that is most convenient for you from the options below:</p>

    <h2>Contact Information</h2>
    <p><strong>Phone:</strong> 01701842233</p>
    <p><strong>Email:</strong> <a href="mailto:fojent2015@gmail.com">fojent2015@gmail.com</a></p>

    <h2>Follow Us</h2>
    <p><strong>Facebook Page:</strong> <a href="https://www.facebook.com/ahmedsenglish.official" target="_blank">Ahmed’s English</a></p>
    <p><strong>Facebook Group:</strong> <a href="https://www.facebook.com/groups/ahmedsenglish.official" target="_blank">Ahmed’s English Group</a></p>
    <p><strong>YouTube Channel:</strong> <a href="https://www.youtube.com/@ahmed.english" target="_blank">Ahmed’s English</a></p>
</body>
</html>
""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title:const Text("Contact Us",style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
        centerTitle: true,
        backgroundColor: AppColors.bgColor,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(onPressed: ()=>Get.back(), icon:const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        padding:const EdgeInsets.all(20),
        child: HtmlWidget(
          htmlData,
          textStyle:const TextStyle(color: Colors.black, backgroundColor: AppColors.bgColor),

        ),
      ),
    );
  }
}
