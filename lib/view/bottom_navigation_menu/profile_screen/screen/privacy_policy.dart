import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import '../../../../utility/app_color.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  final htmlData = """<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Privacy Policy</title>
</head>
<body>
  <h1>Privacy Policy</h1>
  <p>We, AHMED’S ENGLISH, are committed to safeguarding your privacy in relation to the protection of your personal information. To guarantee our ability to access your services, we may obtain and sometimes share your information. In order to further safeguard your privacy, we give this notice that details our information practices and the options you have when it comes to the collection and use of your information.</p>
  <p>In order to ensure that all users of the website, <a href="https://safeacademybd.com/">https://safeacademybd.com/</a> are aware of the privacy policy that governs the use of the website and the application, we advise you to read the Privacy Policy and accept the terms and conditions contained herein by logging into the website or application. You must agree to our Privacy Policy, which covers the collecting and use of your personal information, or you are not permitted to use the Website or App. You can contact our Customer Support if you have any questions or complaints about this privacy policy at 01701-842233.</p>

  <h2>1. DEFINITIONS</h2>
  <p><strong>“We”, “Our”, and “Us”</strong> - Refers to the creators of this privacy policy.</p>
  <p><strong>“You”, “Your”, “Yourself” and “User”</strong> - Refers to natural and legal individuals who use the Website.</p>
  <p><strong>“Website”</strong> - Refers to the official website of Ahmed’s English.</p>
  <p><strong>“Personal Information”</strong> - Refers to any personally identifiable information that We may collect from You.</p>
  <p><strong>“Third Parties”</strong> - Refers to any website, company or individual apart from the user and the creator of the Website.</p>

  <h2>2. OVERVIEW</h2>
  <p>We take the responsibility to respect your private information online. We further acknowledge the need to preserve and handle the information you share with us that is identifiable personally ("personal information"). Information which we regard as personal about you includes but is not confined to your name, address, e-mail address, phone number or other contact details.</p>

  <h2>3. USER PROVIDED INFORMATION</h2>
  <p>The Application/Website/Services/Products obtains the information you provide when you download and register for the Application or Services or products. When you register with us, you generally provide (a) your name, age, e-mail address, address, phone number, password and educational interests of your ward;...</p>

  <h2>4. AUTOMATICALLY COLLECTED INFORMATION</h2>
  <p>In addition, the app/products/devices can automatically collect certain data, including, but not limited to, the mobile device types that you use, your mobile device unique device ID...</p>

  <h2>5. HOW INFORMATION IS COLLECTED</h2>
  <p>We will determine the purpose of collecting the information before or when personal information is collected...</p>

  <h2>6. COOKIES</h2>
  <p>On certain pages of our website and applications, we use data collection devices such as "cookies"...</p>

  <h2>7. EXTERNAL LINKS ON WEBSITE</h2>
  <p>Hyperlinks to other websites, content or resources may be included on this Website...</p>

  <h2>8. OUR USE OF YOUR INFORMATION</h2>
  <p>Your contact details will be used as necessary to contact you...</p>

  <h2>9. CONFIDENTIALITY</h2>
  <p>You further acknowledge that this website may contain data that are confidential to us, and that without our prior written consent you may not disclose this information...</p>

  <h2>10. OUR DISCLOSURE OF YOUR INFORMATION</h2>
  <p>Due to the existing regulatory environment, we cannot guarantee that no other way of disclosing your personal communications and other information is described otherwise in this Privacy Policy...</p>

  <h2>11. ACCESSING AND REVIEWING INFORMATION</h2>
  <p>You can view and edit the information you submit every time you register...</p>

  <h2>12. OTHER INFORMATION COLLECTORS</h2>
  <p>Information in this document only applies to the way we collect and use your data unless otherwise stated in our privacy policy...</p>

  <h2>13. SECURITY</h2>
  <p>We see data as a valuable asset, and thus we must do everything we can to avoid data loss and security breaches...</p>

  <h2>14. DISCLAIMER</h2>
  <p>You should be aware that it is not possible for us to make guarantees about the privacy of your private communications and other personal information...</p>

  <h2>15. DISPUTES AND JURISDICTION</h2>
  <p>All claims brought up by this policy, including but not limited to claims regarding rights, refunds, and compensation, will be resolved using a two-step alternative dispute resolution process...</p>

  <h2>16. QUESTIONS AND SUGGESTIONS AND COMPLAINTS OFFICER</h2>
  <p>If you have an unresolved issue by our customer service team, or if you want to report an unresolved issue, please write to our customer service at 01701-842233</p>

  <h2>17. NOTICE OF AMENDMENTS AND CHANGES TO TERMS AND CONDITIONS AND PRIVACY POLICY</h2>
  <p>We reserve the right to modify the terms and privacy policy from time to time as we think necessary without providing you with any notice...</p>

</body>
</html>
""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title:const Text("Privacy Policy",style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
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
