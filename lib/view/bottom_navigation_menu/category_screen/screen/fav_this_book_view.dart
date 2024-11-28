
import 'package:ebook_reader/view/bottom_navigation_menu/category_screen/controller/mark_text_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class FavThisBookView extends GetView<MarkTextController> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fav This Book'),
      ),
      body: Obx(() {
          return ListView.builder(
            itemCount: controller.markTextList.value.length,
            itemBuilder: (context, index) {
              var data = controller.markTextList.value[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                ),
                child: ListTile(
                  title: Text(data.text!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(data.definition!),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: (){
                     // controller.markTextList.removeAt(index);
                      controller.removeMarkTextFromFave(data.markTextId!.toString());
                    },
                ),
                ),
              );
            },
          );
        }
      ),
    );
  }
}
