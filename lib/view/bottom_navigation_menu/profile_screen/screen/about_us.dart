import 'package:ebook_reader/utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  final htmlData = """<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Ahmed's English</title>
</head>
<body>
    <h1>About Us</h1>
    <p>Welcome to Ahmed’s English, an innovative online learning platform dedicated to helping students excel in English for various competitive exams, including SSC, HSC, university admission tests, BCS, and job exams in Bangladesh. Our mission is to provide high-quality English education, enabling learners to achieve their academic and professional goals. Founded by renowned English educator Ahmmad Ullah, the platform combines traditional teaching methods with modern technology to deliver a comprehensive learning experience.</p>

    <p>Ahmmad Ullah is a prominent figure in English education, known for his widely acclaimed English learning books for competitive exams, including ‘Text Marker’, ‘Vocab Marker’, ‘English Marker’, ‘Written Marker’, and ‘Ahmed’s English for All Exam’. With a background in law from Dhaka University, he has drawn on years of experience to develop courses and materials that meet the specific needs of students preparing for competitive exams.</p>

    <p>Ahmed’s English offers a variety of resources designed to cater to different learning styles and needs. Our platform features live classes where students can interact with expert instructors in real-time, as well as recorded classes for those who prefer to learn at their own pace. We also provide live MCQ (Multiple Choice Questions) exams, allowing students to assess their knowledge and track their progress in a competitive environment.</p>

    <p>In addition to exam preparation, Ahmed’s English offers specialized courses such as English speaking courses and a dedicated Kid’s English course to help younger learners build a strong foundation in the language. For those who prefer reading, our platform includes e-books, giving students easy access to comprehensive study materials anytime, anywhere.</p>

    <p>Although we are primarily focused on serving the Bangladeshi community, our platform is accessible to learners worldwide. With English being a global language, our courses are designed to be relevant and useful no matter where you are. Whether you’re a student preparing for exams, a job seeker looking to improve your language skills, or simply someone interested in learning English, Ahmed’s English is here to support your journey.</p>

    <p>At Ahmed’s English, we are committed to providing an inclusive and flexible learning environment. Our resources are continuously updated to reflect the latest trends and requirements of competitive exams, ensuring that our students always have access to the most relevant information. Join us today and take the first step toward mastering English for your academic and professional future.</p>

    <h2>Contact Us</h2>
    <p><strong>Phone:</strong> 01701842233</p>
    <p><strong>Email:</strong> <a href="mailto:fojent2015@gmail.com">fojent2015@gmail.com</a></p>

    <h3>Follow Us</h3>
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
        title:const Text("About Us",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: AppColors.textBlack),),
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
