import 'package:ebook_reader/utility/app_assets.dart';
import 'package:ebook_reader/utility/app_color.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SaveScreen extends StatelessWidget {
  const SaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor:Colors.transparent,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.bgColor,
        title:const Text("Order Book",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: AppColors.textBlack),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: 10,
            itemBuilder: (context,index){
            return Container(
              margin:const EdgeInsets.only(bottom: 10),
              padding:const EdgeInsets.only(right: 10),
              height: 80,
              width:double.infinity ,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //image
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 80,
                        width: 120,
                        decoration: BoxDecoration(
                          color: AppColors.cardAmber,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(Assets.book1,height:40,width:20,fit: BoxFit.cover,),
                      ),
                      const SizedBox(width: 10,),
                      //name rating
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            //book name
                            Text("Book Night",style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textBlack),
                            ),

                            //rating
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

                            //Price
                            Text("\$ 90.45",style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textBlack),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),

                  TextButton(onPressed: (){},
                    child: const Text("Read",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.linkColor),),)




                ],
              ),
            );

        }),
      ),
    );
  }
}
