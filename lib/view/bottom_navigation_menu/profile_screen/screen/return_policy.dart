import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import '../../../../utility/app_color.dart';

class ReturnPolicy extends StatelessWidget {
  const ReturnPolicy({super.key});

  final htmlData = """<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cancellation & Refund Policy</title>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; }
        h2 { color: #333; }
        p, ul { margin: 0.5em 0; }
    </style>
</head>
<body>

    <h2>Cancellation & Refund Policy</h2>

    <h3>What is a refund?</h3>
    <p>When a learner is not satisfied with the quality of the course purchased/product experience or due to technical reasons the course is not working, the user can ask for money back/refund.</p>

    <h3>How to request a refund?</h3>
    <p>If you have paid for an individual course or a bundle course, you can request a refund within 24 hours of your payment.</p>
    <p>To request a refund, follow these steps on a computer:</p>
    <ul>
        <li>Call <strong>01701842233</strong> (10:00 AM – 5:00 PM) and state the email address/phone number you have used to sign up and purchase the course.</li>
        <li>While on call, please state why you want a refund with proper validation.</li>
        <li>Refund requests are only considered valid if contacted and informed via calling 01701842233 within 24 hours of purchase clearly specifying your email address and phone number used during registration.</li>
        <li>Refunds do not apply to e-books and courses having 1-3 months subscription plans of the online batch.</li>
        <li>Refunds shall be made through financial services/mobile financial services within 7-10 working days of successful processing and approval of the refund request by AHMED’S ENGLISH. This confirmation will be emailed to the user.</li>
    </ul>

    <h3>When will the refund not be applicable?</h3>
    <ul>
        <li>If you have already earned your Course Certificate within the 24-hour complaint period, you are no longer eligible for a refund.</li>
        <li>If you file a complaint within the 24-hour complaint period and earn the course certificate within the next 7-day refund period, you will not be entitled to a refund.</li>
        <li>When you request a refund, the refund process will be in progress. Therefore, if you complete an activity (play a video, try a quiz or test, download materials of the specific course) and proceed with the course, you will not be eligible for a refund request.</li>
        <li>If an individual completes more than 5% of the course, they will not be eligible for a refund.</li>
        <li>If you have purchased e-books and 1-3 months subscription plans for the online batch.</li>
    </ul>

    <h3>When will the refund be applicable?</h3>
    <ul>
        <li>In case of a wrong purchase, a transfer to another course can be done. If the price of the new course is:</li>
            <ul>
                <li>Higher than the purchased course, the user has to pay the additional amount to AHMED’S ENGLISH by the preferred method.</li>
                <li>Lower than the purchased course, the user will get a refund of the additional amount from AHMED’S ENGLISH by the preferred method.</li>
            </ul>
        <li>Promised/desired material is not covered in the course as mentioned in the course details.</li>
        <li>Mistakenly purchased live class instead of recorded class and vice-versa.</li>
    </ul>

    <h3>When you request a refund, what happens?</h3>
    <p>Once the refund is implemented, your enrolled course will be deleted from your profile and your progress will be gone. After a successful refund request that follows the eligibility, you'll be un-enrolled from the course as well. If you wish to purchase the course again, you have to start the course from the very beginning.</p>
    <p>It can take up to 7-10 working days for funds to return to your account after a requested refund. If it has been longer than 10 working days, please call 01701842233 (10:00 AM – 5:00 PM).</p>
    <p>Once the refund has been done, you will receive a confirmation email/SMS to your registered e-mail/phone number.</p>
    <p>AHMED’S ENGLISH has full authority to change the T&C from time to time and case by case scenario.</p>

</body>
</html>
""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title:const Text("Return Policy",style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
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
