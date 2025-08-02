import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class FirebaseStorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  //------------- Adding image to firebase storage----------//
  Future<String> uploadImageToStorage(
    String childName,
    Uint8List file,
    bool isPost,
  ) async {
    String path = const Uuid().v1();
    Reference ref = _storage.ref().child(childName).child(path);

    UploadTask uploadTask =
        ref.putData(file, SettableMetadata(contentType: 'image/png'));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}
