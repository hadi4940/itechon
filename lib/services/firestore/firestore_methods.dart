import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:itechone/services/storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //final FirebaseAuth _auth = FirebaseAuth.instance;

  // ------------ Upload Post ------------//
  Future<String> registerForEvent(
    String studentName,
    String nameOfTeam,
    String studentID,
    String email,
    String semester,
    String contactNo,
    String challanReceiptNo,
    Uint8List file,
    bool isSolo,
  ) async {
    String res = "some error occur";
    try {
      String photoUrl = await FirebaseStorageMethods()
          .uploadImageToStorage('challanImages', file, true);
      String postId = const Uuid().v1();

      // adding post
      _firestore.collection('register_student').doc(postId).set({
        "studentName": studentName,
        "nameOfTeam": nameOfTeam,
        "studentID": studentID,
        "email": email,
        "semester": semester,
        "contactNo": contactNo,
        "challanReceiptNo": challanReceiptNo,
        "imageLink": photoUrl,
        "status": false,
        "isSolo": isSolo
      });
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //---------Add Single Poster----------//
  Future<String> addPoster(
    String nameOfDownloadItem,
    Uint8List file,
  ) async {
    String res = "some error occur";
    try {
      String photoUrl = await FirebaseStorageMethods()
          .uploadImageToStorage('downloadable', file, true);

      // adding post
      _firestore.collection('downloadable_items').doc(nameOfDownloadItem).set({
        "imageLink": photoUrl,
      });
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  // ------------ Upload Post ------------//
  Future<String> bookTicket(
    String studentName,
    String nameOfTeam,
    String studentID,
    String email,
    String semester,
    String contactNo,
    String challanReceiptNo,
    // Uint8List file,
  ) async {
    String res = "some error occur";
    try {
      // String photoUrl = await FirebaseStorageMethods()
      //     .uploadImageToStorage('challanImages', file, true);
      String postId = const Uuid().v1();

      // adding post
      _firestore.collection('tickets').doc(postId).set({
        "studentName": studentName,
        "nameOfTeam": nameOfTeam,
        "studentID": studentID,
        "email": email,
        "semester": semester,
        "contactNo": contactNo,
        "challanReceiptNo": challanReceiptNo,
        //"imageLink": photoUrl,
        "status": false,
      });
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  // ------------adding Gallery Image---------------//
  // ------------ Upload Post ------------//
  Future<String> addGalleryImageAndData(
    String name,
    String location,
    String date,
    Uint8List file,
  ) async {
    String res = "some error occur";
    try {
      String photoUrl = await FirebaseStorageMethods()
          .uploadImageToStorage('gallery', file, true);
      String postId = const Uuid().v1();

      // adding post
      _firestore.collection('galleryCollection').doc(postId).set({
        "event_name": name,
        "event_location": location,
        "event_date": date,
        "imageURL": photoUrl,
      });
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
