
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class PdfManager extends GetxController {
  // // Key for encryption (use a secure key in production)
  //  final key = encrypt.Key.fromUtf8('my32lengthsupersecretnooneknows1');
  //  final iv = encrypt.IV.fromLength(16);


   RxBool isPDFLoading = false.obs;
   RxBool isLoading = false.obs;
   Rx<File> pdfPath = File('').obs;

   final String rawKey = 'my32lengthsupersecretnooneknows1'; // 32 bytes
   final encrypt.Key key = encrypt.Key.fromUtf8('my32lengthsupersecretnooneknows1');
   final encrypt.IV iv = encrypt.IV.fromUtf8('16byteslongIV123'); // 16 bytes

   // Download and encrypt PDF
   Future<String> downloadAndEncryptPdf(String url, String fileName) async {
     try {
       // Step 1: Download the PDF
       final response = await Dio().get(
         url,
         options: Options(responseType: ResponseType.bytes),
       );

       // Step 2: Get application directory
       final dir = await getApplicationDocumentsDirectory();
       final encryptedFilePath = '${dir.path}/$fileName.encrypted.pdf';

       // Step 3: Encrypt the PDF data
       final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: 'PKCS7'));
       final encryptedData = encrypter.encryptBytes(
         response.data as Uint8List,
         iv: iv,
       );

       // Step 4: Save the encrypted file
       final encryptedFile = File(encryptedFilePath);
       await encryptedFile.writeAsBytes(encryptedData.bytes);

       print("File downloaded and encrypted at: $encryptedFilePath");
       return encryptedFilePath;
     } catch (e) {
       print("Error downloading or encrypting PDF: $e");
       throw e;
     }
   }

   // Decrypt and return the PDF file path
   Future<File> decryptPdf(String encryptedFilePath) async {
     try {
       // Step 1: Read the encrypted file
       final encryptedFile = File(encryptedFilePath);
       if (!await encryptedFile.exists()) {
         throw Exception("Encrypted file does not exist.");
       }

       final encryptedData = await encryptedFile.readAsBytes();

       // Step 2: Decrypt the data
       final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: 'PKCS7'));
       final decryptedData = encrypter.decryptBytes(
         encrypt.Encrypted(encryptedData),
         iv: iv,
       );

       // Step 3: Save the decrypted data to a temporary file
       final dir = await getTemporaryDirectory();
       final decryptedFilePath = '${dir.path}/decrypted_${DateTime.now().millisecondsSinceEpoch}.pdf';
       final decryptedFile = File(decryptedFilePath);
       await decryptedFile.writeAsBytes(decryptedData);

       pdfPath.value = decryptedFile;
       print("File decrypted and saved at: $decryptedFilePath");
       return decryptedFile;
     } catch (e) {
       print("Error decrypting PDF: $e");
       throw e;
     }
   }
}
