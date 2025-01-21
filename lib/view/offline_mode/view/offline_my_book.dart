import 'package:ebook_reader/view/offline_mode/controller/offline_book_controller.dart';
import 'package:ebook_reader/widgets/app_network_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'topics.dart';
class OfflineMyBook extends StatelessWidget {
   OfflineMyBook({super.key});
  final OfflineBookController offlineBookController = Get.put(OfflineBookController());

  @override
  Widget build(BuildContext context) {
    offlineBookController.getMyLocalBook();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: const Text(
          "Book Name",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),

        child: Obx(() {
            return ListView.builder(
              itemCount: offlineBookController.myBooksList.value.length,
              itemBuilder: (context, index) {
                var data = offlineBookController.myBooksList.value[index];
                return Container(
                  padding: const EdgeInsets.all(6),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {
                       Get.to(()=>Topics(),arguments: data);
                    },
                    title: Text(data.book!.bookName!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    leading: AppNetworkImage(src: data.book!.image!,),
                    trailing: SizedBox(
                      width: 75,
                      child: Row(
                        children: [
                          Icon(Icons.remove_red_eye, color: Colors.green,),
                          IconButton(
                              onPressed: (){
                                _deleteAlert(context, data.book!.bookId.toString());
                              },
                              icon:   Icon(Icons.delete, color: Colors.red,),
                          )
                        ],
                      ),
                    )
                  ),
                );
              },
            );
          }
        ),
      )
    );
  }

   Future<void> _deleteAlert(context, bookId) async {
     return showDialog<void>(
       context: context,
       barrierDismissible: false, // user must tap button!
       builder: (BuildContext context) {
         return AlertDialog(
           title: Text('Remove Book'),
           content: SingleChildScrollView(
             child: ListBody(
               children: <Widget>[
                 Text('Are you sure? Do you want to remove this book from offline reading? Dont worry you can download it again.'),
               ],
             ),
           ),
           actions: <Widget>[
             TextButton(
               child: Text('YES'),
               onPressed: () {
                 offlineBookController.removeBookById(bookId);
               },
             ),
             TextButton(
               child: Text('NO'),
               onPressed: () {
                 Navigator.of(context).pop();
               },
             ),
           ],
         );
       },
     );
   }
}
