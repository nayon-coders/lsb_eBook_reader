import 'package:ebook_reader/data/model/LocalDBbookModel.dart';
import 'package:ebook_reader/view/offline_mode/view/read_pdf.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfflineSubTopicsScree extends StatefulWidget {
  const OfflineSubTopicsScree({super.key});

  @override
  State<OfflineSubTopicsScree> createState() => _SubTopicsState();
}

class _SubTopicsState extends State<OfflineSubTopicsScree> {

  MainTopic data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text(
          "${data.name}",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: data.subTocs!.length,
          itemBuilder: (_, index){
            return Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  onTap: () {
                    Get.to(()=>OffLineReadPdf(),arguments: data.subTocs![index]);
                  },
                  title: Text(data.subTocs![index].name!,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        Get.to(()=>OffLineReadPdf(),arguments: data.subTocs![index]);

                        // Get.to(()=>SubTopics(),arguments: data.subTocs![index]);
                      },
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 20,
                      )
                  ),
                )
            );
          },
        ),
      ),
    );
  }
}
