import 'package:ebook_reader/view/home_screen/screen/single_book_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../../routes/route_name.dart';
import '../../../utility/app_assets.dart';
import '../../../utility/app_color.dart';


class AdmissionScreen extends StatelessWidget {
  const AdmissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=>Get.toNamed(RouteName.appNavigation),
          icon:const Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
        backgroundColor: AppColors.bgColor,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title:const Text("Admission Books",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
            itemCount: 50,

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing:10 ,
              crossAxisSpacing: 10,
              childAspectRatio: 0.65,
              crossAxisCount: 2,
            ),
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: ()=>Get.to(()=>const SingleBookScreen()),
                child: Container(
                  margin:const EdgeInsets.all(10),
                  //height: 220,
                  width: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:const EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        height: 180,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:index.isEven? AppColors.cardAmber:AppColors.cardBlue,
                        ),
                        child: Image.asset(index.isEven?Assets.book1:Assets.book2,height:120,width: 120,fit: BoxFit.cover,),
                      ),

                      const SizedBox(height: 6,),

                      //book Name
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Text("Book Night",
                          style:const TextStyle(fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: AppColors.textBlack),
                        ),
                      ),

                      //Rating
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: RatingBar(
                          itemSize: 13,
                          minRating: 1,
                          maxRating: 5,
                          initialRating: 3,
                          allowHalfRating: true,
                          ratingWidget: RatingWidget(
                              full:const Icon(Icons.star,color: Colors.amber,size: 13,),
                              half: const Icon(Icons.star_half, color: Colors.amber,size: 13,),
                              empty:const Icon(Icons.star,color: Colors.grey,size: 13,)),
                          onRatingUpdate: (v){},
                          updateOnDrag: true,
                        ),
                      ),
                      const  SizedBox(height: 5,),

                      //price
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Text("\$250",style:const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBlack,
                        ),
                        ),
                      )

                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
