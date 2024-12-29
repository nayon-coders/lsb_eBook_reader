import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_reader/routes/route_name.dart';
import 'package:ebook_reader/widgets/app_shimmer_pro.dart';
import 'package:ebook_reader/widgets/empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utility/app_color.dart';
import '../category_screen/controller/book_controller.dart';

class AllBooks extends GetView<BookController> {
   AllBooks({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.getAllBooks();
    });
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        surfaceTintColor: Colors.transparent,
        title:const Text("All Books",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.textBlack),),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: Container(
            height: 45,
            margin: const EdgeInsets.only(left: 20,right: 20,bottom: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)
            ),
            child: TextField(
              onChanged: (v){
                controller.searchBook(v);
              },
              decoration: InputDecoration(
                hintText: "Search book by name...",
                border: InputBorder.none,
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body:Obx(() {
        if(controller.isLoading.value){
          return GridView.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing:10 ,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              mainAxisExtent: 280,
            ),
            itemBuilder: (BuildContext context, int index) {
              return AppShimmerPro.circularShimmer(width: MediaQuery.of(context).size.width*.45, height: 280, borderRadius: 10,);
            },
          );
        }else if(controller.allBooksModel.value.data == null || controller.allBooksModel.value.data!.isEmpty){
          return const Center(child: EmptyScreen(),);
        }else{
          if(controller.searchBookList.isEmpty){
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                  itemCount: controller.allBooksModel.value.data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10 ,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      mainAxisExtent: 280
                  ),
                  itemBuilder: (context,index){
                    var data = controller.allBooksModel.value.data![index];
                    return SingleBookWidgets(
                      onTap: (){
                        controller.bookId.value = data.bookId!.toString();

                        Get.toNamed(AppRoute.singleBook,arguments: data);
                      },
                      index: index,
                      bookName: data.bookName! ?? "Book Name",
                      bookImage: data.image!,
                      bookPrice: "৳ ${data.price ?? 0.00}",
                      bookRating:double.parse(data.averageRating!.toStringAsFixed(1)) ,

                    );
                  }),
            );
          }else{
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                  itemCount: controller.searchBookList!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing:10 ,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      mainAxisExtent: 280
                  ),
                  itemBuilder: (context,index){
                    var data = controller.searchBookList![index];
                    return SingleBookWidgets(
                      onTap: (){
                        controller.bookId.value = data.bookId!.toString();

                        Get.toNamed(AppRoute.singleBook,arguments: data);
                      },
                      index: index,
                      bookName: data.bookName! ?? "Book Name",
                      bookImage: data.image!,
                      bookPrice: "৳ ${data.price ?? 0.00}",
                      bookRating:double.parse(data.averageRating!.toStringAsFixed(1)) ,

                    );
                  }),
            );
          }

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
       // margin:const EdgeInsets.all(10),
        //height: 220,
       // width: MediaQuery.of(context).size.width*.45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:const EdgeInsets.all(20),
              alignment: Alignment.center,
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.cardAmber,
              ),
              child: CachedNetworkImage(
                imageUrl:bookImage,
                height: 180,
                fit: BoxFit.cover,
                placeholder: (context, url) => AppShimmerPro.circularShimmer(width: 100, height: 120, borderRadius: 3),  // Loading indicator
                errorWidget: (context, url, error) => Icon(Icons.error),     // Error indicator
              ),
            ),

            const SizedBox(height: 6,),

            //book Name
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Text("${bookName}",
                style:const TextStyle(fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.textBlack),
              ),
            ),

            //Rating
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.star,color: Colors.deepOrange,size: 15,),
                  //SizedBox(width: 10,),
                  Text("($bookRating)",style:const  TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black),)
                ],
              ),
            ),

            //price
            Padding(
              padding:const  EdgeInsets.only(left: 6.0,top: 7),
              child: Text("${bookPrice}",style:const TextStyle(
                fontSize: 17,
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
