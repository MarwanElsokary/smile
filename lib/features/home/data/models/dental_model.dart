// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import '../../domain/entites/dental_case.dart';
//
// class DentalCaseModel extends DentalCase {
//   DentalCaseModel({
//     required super.id,
//     required super.title,
//     required super.description,
//     required super.imageUrl,
//     required super.category,
//     required super.createdAt,
//   });
//
//   factory DentalCaseModel.fromJson(Map<String, dynamic> json, String id) {
//     return DentalCaseModel(
//       id: id,
//       title: json['title'] ?? '',
//       description: json['description'] ?? '',
//       imageUrl: json['imageUrl'] ?? '',
//       category: json['category'] ?? '',
//       createdAt: (json['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'title': title,
//       'description': description,
//       'imageUrl': imageUrl,
//       'category': category,
//       'createdAt': createdAt,
//     };
//   }
// }
