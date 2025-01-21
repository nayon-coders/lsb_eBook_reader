import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class OfflineBookImageController {

  Future<File> downloadAndSaveImage(String url, String fileName) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';
      final file = File(filePath);

      if (await file.exists()) {
        return file; // Return the file if it already exists
      }

      final response = await Dio().get(
        url,
        options: Options(responseType: ResponseType.bytes),
      );

      await file.writeAsBytes(response.data);
      return file;
    } catch (e) {
      throw Exception('Error saving image: $e');
    }
  }

  Future<File?> getImageFile(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$fileName';
    final file = File(filePath);

    if (await file.exists()) {
      return file;
    }
    return null;
  }

}