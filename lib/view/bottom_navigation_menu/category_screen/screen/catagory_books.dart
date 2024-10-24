import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_reader/app_config.dart';
import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/widgets/app_shimmer_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../../../utility/app_assets.dart';
import '../../../../utility/app_color.dart';
import '../controller/book_controller.dart';
import 'single_book_screen.dart';

class CategoryBook extends GetView<BookController> {
  const CategoryBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        surfaceTintColor: Colors.transparent,
        title:const Text("Category Books",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
      ),
      body:Obx(() {
        if(controller.isLoading.value){
          return GridView.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing:10 ,
              crossAxisSpacing: 10,
              childAspectRatio: 0.65,
              crossAxisCount: 2,
              mainAxisExtent: 180,
            ), 
            itemBuilder: (BuildContext context, int index) { 
              return AppShimmerPro.circularShimmer(width: MediaQuery.of(context).size.width*.45, height: 180, borderRadius: 10,);
            },
          );
        }else{
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
                itemCount: controller.allBooksModel.value.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing:10 ,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.65,
                  crossAxisCount: 2,
                  mainAxisExtent: 280
                ),
                itemBuilder: (context,index){
                  var data = controller.allBooksModel.value.data![index];
                  return SingleBookWidgets(
                    onTap: (){
                      controller.bookId.value = data!.bookId!.toString();
                      controller.getBookById();
                      Get.toNamed(AppRoute.singleBook,arguments: data);
                    },
                    index: index,
                    bookName: data.bookName! ?? "Book Name",
                    bookImage: data.image!,
                    bookPrice: "৳ ${data.price ?? 0.00}",
                    bookRating: 3,

                  );
                }),
          );
        }
          
        }
      ),
    );
  }
}

class SingleBookWidgets extends StatelessWidget {
  const SingleBookWidgets({
    super.key, required this.onTap, required this.index, required this.bookName, required this.bookImage, required this.bookPrice, required this.bookRating,
  });

  final int index;
  final String bookName;
  final String bookImage;
  final String bookPrice;
  final double bookRating;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin:const EdgeInsets.all(10),
        //height: 220,
          width: MediaQuery.of(context).size.width*.45,
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
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.cardAmber,
              ),
              child: CachedNetworkImage(
                imageUrl:bookImage,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
                placeholder: (context, url) => const CircularProgressIndicator(),  // Loading indicator
                errorWidget: (context, url, error) => Icon(Icons.error),     // Error indicator
              ),
            ),

            const SizedBox(height: 6,),

            //book Name
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Text("${bookName}",
                style:const TextStyle(fontWeight: FontWeight.w600,
                    fontSize: 13,
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
              padding:const  EdgeInsets.only(left: 6.0),
              child: Text("${bookPrice}",style:const TextStyle(
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
  }
}
