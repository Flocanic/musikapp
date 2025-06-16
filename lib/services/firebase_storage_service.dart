import 'package:firebase_storage/firebase_storage.dart';
import 'dart:typed_data';

class FirebaseStorageService {
  final storage = FirebaseStorage.instance;

  Future<String> getDownloadUrl(String pathInStorage) async {
    return await storage.ref(pathInStorage).getDownloadURL();
  }

  Future<void> uploadFile(String pathInStorage, Uint8List fileBytes) async {
    await storage.ref(pathInStorage).putData(fileBytes);
  }
}
