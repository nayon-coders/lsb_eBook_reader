import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:get/get.dart';

import '../../../../widgets/app_button.dart';
import '../controller/rating_controller.dart';
class RatingView extends StatefulWidget {
  final String id;
  const RatingView({
    super.key, required this.id,
  });

  @override
  State<RatingView> createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> {
  final RatingController controller = Get.put(RatingController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Center(child: Text("Rate",style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),)),
          Obx(() {
              return StarRating(
                rating: controller.rating.value,
                allowHalfRating: true,
                color: Colors.amber,
                size: 50,
                onRatingChanged: (rating){
                  print(rating);
                  controller.rating.value = rating;
                },);
            }
          ),
          const SizedBox(height: 20,),
          Text("Review",style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),),
          const SizedBox(height: 20,),
          Container(
            padding:const EdgeInsets.all(10),
            height: 100,
            width: Get.width*.90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: TextField(
              maxLines: 5,
              controller: controller.reviewController,
              decoration:const InputDecoration(
                hintText: "Write your review",
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Obx(() {
              return AppButton(
                isLoading: controller.isSubmitting.value,
                name: "Submit",
                width: Get.width*.90,
                onClick: (){
                  if(controller.reviewController.value.text.isEmpty){
                    Get.snackbar("Error", "Please write a review", backgroundColor: Colors.red);
                    return null;
                  }
                  controller.submitRating(widget.id);
                },
              );
            }
          )
        ],
      ),
    );
  }
}
