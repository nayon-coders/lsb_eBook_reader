import 'package:ebook_reader/data/model/LocalDBbookModel.dart';
import 'package:ebook_reader/view/offline_mode/view/sub_topics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Topics extends StatefulWidget {
  const Topics({super.key});

  @override
  State<Topics> createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {

  LocalDBbookModel data = Get.arguments;

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
          "${data.book!.bookName}",
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
          itemCount: data.mainTopic!.length,
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
                  Get.to(OfflineSubTopicsScree(), arguments: data.mainTopic![index]);
                },
                title: Text(data.mainTopic![index].name!,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Get.to(OfflineSubTopicsScree(), arguments: data.mainTopic![index]);
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
