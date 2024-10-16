import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/utility/app_assets.dart';
import 'package:ebook_reader/view/order_screen/widget/addrass_card.dart';
import 'package:ebook_reader/view/order_screen/widget/custom_bottom_sheet.dart';
import 'package:ebook_reader/view/order_screen/widget/order_rice_text.dart';
import 'package:ebook_reader/widgets/app_button.dart';
import 'package:ebook_reader/widgets/app_input.dart';
import 'package:ebook_reader/widgets/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../utility/app_color.dart';
import '../../widgets/bg_theme.dart';

class OrderScreen extends StatelessWidget {
   OrderScreen({super.key});
  final _coupon = TextEditingController();
  final bottomSheetContro = Get.put(CustomBottomSheet());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
          onPressed: ()=>Get.toNamed(RouteName.appNavigation),
          icon:const Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
        title: Text("Book Night - Order",style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: AppColors.textBlack),),
      ),
      body: SingleChildScrollView(
        padding:const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //book details
            Container(
              height: 80,
              width:size.width ,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    padding:const EdgeInsets.all(10),
                    height: 80,
                    width: 120,
                    decoration: BoxDecoration(
                      color: AppColors.cardAmber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(Assets.book1,height:40,width:20,fit: BoxFit.cover,),
                  ),
                  const SizedBox(width: 10,),
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
                  )



                ],
              ),
            ),

          const SizedBox(height: 20,),

           const Text("Choose Payment get way",
              style: TextStyle(fontWeight: FontWeight.w600,
                  fontSize: 18,color: AppColors.textBlack),
            ),
           const SizedBox(height: 10,),
            //bikash
            Container(
              padding:const EdgeInsets.only(left: 10,right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                leading: Image.asset(Assets.bikash,height: 50,width: 60,fit: BoxFit.cover,),
                title:const Text("Bikash",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: AppColors.textBlack),),

              ),
            ),

            const SizedBox(height: 10,),
            //Nagad
            Container(
              padding:const EdgeInsets.only(left: 10,right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                leading: Image.asset(Assets.nagad,height: 50,width: 60,fit: BoxFit.cover,),
                title:const Text("Nagod",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: AppColors.textBlack),),

              ),
            ),

            const SizedBox(height:20,),
            //Shopping address
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Shipping Address",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: AppColors.textBlack,
                  ),
                ),
                InkWell(
                  onTap: ()=>bottomSheetContro.openBottomSheet(),
                    child: Text("Change",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.linkColor),))

              ],
            ),

           const SizedBox(height: 10,),
            //address
            Container(
              padding:const EdgeInsets.all(10),
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Home",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textBlack),),
                  SizedBox(
                    width: 300,
                      child: Text("Motijheel, Mugda, Manda, Green Model town, Block c, Roade1, ",
                        style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: AppColors.textBlack),)),
                ],
              ),
            ),

            const SizedBox(height: 50,),
            AppInput(
                hint: "Coupon",
                controller:_coupon,
              suffixIcon: Container(
                margin:const EdgeInsets.all(6),
                padding:const EdgeInsets.all(4),
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.buttonGreen,
                ),
                child:const Center(child: Text("Apply",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),)),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding:const EdgeInsets.all(20),
        height: 210,
        width: size.width,
        decoration:const BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const OrderRiceText(name: "Sub Total", price: 20),
            const SizedBox(height: 6,),
           const OrderRiceText(name: "Delivery Fee", price: 10),
           const SizedBox(height: 6,),
            const OrderRiceText(name: "Discount", price: 10),
           const SizedBox(height: 6,),
            const OrderRiceText(name: "Total", price: 10),
            const SizedBox(height: 15,),
            AppButton(
              width: size.width,
                name: "Order Now", onClick: (){})


          ],
        ),
      ),
    );
  }
}
