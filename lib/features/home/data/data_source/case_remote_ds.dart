// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:injectable/injectable.dart';
// import '../models/dental_model.dart';
//
// @injectable
// class CaseRemoteDataSource {
//   final FirebaseFirestore firestore;
//
//   CaseRemoteDataSource(this.firestore);
//
//
//   Future<List<DentalCaseModel>> getAllCases() async {
//     final snapshot = await firestore.collection("cases").get();
//
//     return snapshot.docs
//         .map((doc) => DentalCaseModel.fromJson(doc.data(), doc.id))
//         .toList();
//   }
//
//   Future<List<DentalCaseModel>> getCasesByCategory(String category) async {
//     final snapshot = await firestore
//         .collection("cases")
//         .where("category", isEqualTo: category)
//         .get();
//
//     return snapshot.docs
//         .map((doc) => DentalCaseModel.fromJson(doc.data(), doc.id))
//         .toList();
//   }
// }
