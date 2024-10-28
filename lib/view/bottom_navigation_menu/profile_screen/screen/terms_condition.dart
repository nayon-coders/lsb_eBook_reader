import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import '../../../../utility/app_color.dart';

class TermsCondition extends StatelessWidget {
  const TermsCondition({super.key});

  final htmlData = """ <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terms & Conditions</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .container {
            width: 80%;
            max-width: 800px;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1, h2, h3 {
            color: #333;
        }
        p {
            margin: 0 0 1em;
        }
        ul, ol {
            margin-left: 20px;
        }
        li {
            margin-bottom: 0.5em;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Terms and Conditions</h1>
        
        <p>These Terms & Conditions (“Terms”) of (a) use of our app Ahmed’s English, our products or services in connection with, Website/products (“Services”) or (b) any modes of registrations or usage of products, including through SD cards, tablets or other storage/transmitting device are between AHMED’S ENGLISH (“Institution/We/Us/Our”) and its users (“User/You/Your”).</p>
        
        <p>Please carefully read the terms and privacy policy of the Institution (“Privacy Policy”) prior to registering, using website, or services. Any discrepancies between the Terms and other policies on website, or service are settled in favor of the Terms.</p>
        
        <p>You accept and agree to be legally bound by the Terms if you access Website, or Services through any means.</p>
        
        <h2>Proprietary Information</h2>
        <p>The software, text, images, graphics, video, script, and audio, including any other information, content, material, trademarks, service marks, trade names, and trade secrets, all of which are contained in website, and services and products, are the Institution's proprietary property (“Proprietary Information”). Permission to reproduce, reuse, modify, and distribute Proprietary Information may not be granted without first obtaining permission from the Institution.</p>

        <h2>Rules for Personal and Non-Commercial Use</h2>
        <p>It is prohibited to use our products, services, website, and for any purpose other than personal or non-commercial. The following rules apply to your use of this website, and our services:</p>
        <ul>
            <li>You may not copy, modify, translate, display, distribute, or perform any information or software obtained from our Website and/or Services/Products.</li>
            <li>You are prohibited from using our website, and our products and services for commercial purposes.</li>
        </ul>
        
        <h2>Prohibited Acts</h2>
        <p>The following acts are strictly banned when using our services:</p>
        <ul>
            <li>Make available any deceptive, unlawful, hazardous, abusive, or otherwise objectionable content.</li>
            <li>Threatening, stalking, and/or harassing another person, as well as inciting violence.</li>
            <li>Doing anything that interferes with another person's usage or enjoyment of Website/Services.</li>
            <!-- Add other prohibited actions as required -->
        </ul>

        <h2>License to Use Submitted Content</h2>
        <p>You grant us a worldwide, non-exclusive, royalty-free license (with the right to sublicense) to use, copy, reproduce, process, adapt, publish, transmit, display and distribute your content submitted to or through the Services.</p>

        <h2>Accuracy and Disclaimer</h2>
        <p>We make no guarantees regarding the accuracy, completeness, or timeliness of information provided on the website and services.</p>

        <h2>Communications</h2>
        <p>The Institution (and its subsidiaries/affiliates) may contact Users via SMS, email, and phone calls to inform them about their services and products. The User agrees to receive communications from the Institution.</p>

        <h2>Disclaimers and Limitation of Liability</h2>
        <p>The Institution will not be held liable for any loss or damage resulting from your use of our products and services, including loss of data or impact on processing speed.</p>

        <h2>Indemnity</h2>
        <p>You accept responsibility for protecting, reimbursing, and holding harmless the Institution from any and all claims, costs, debts, and liabilities incurred due to your use of the website/services.</p>

        <h2>Governing Law</h2>
        <p>The legal matters of this contract shall be determined in accordance with the laws of Bangladesh, and these terms will be resolved in the jurisdiction of the relevant courts in Dhaka.</p>

        <h2>Contact Information</h2>
        <p>If you run into any problems, please get in touch with us at <strong>01747446688</strong> or <strong>01701842233</strong>.</p>
    </div>
</body>
</html>
""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Terms & Condition",style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
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
