// import 'package:injectable/injectable.dart';
//
// import '../../domain/entites/dental_case.dart';
// import '../../domain/repo/case_repository.dart';
// import '../data_source/case_remote_ds.dart';
//
// @Injectable(as: CaseRepository)
// class CaseRepositoryImpl implements CaseRepository {
//   final CaseRemoteDataSource remote;
//
//   CaseRepositoryImpl(this.remote);
//
//   @override
//   Future<List<DentalCase>> getAllCases() async {
//     final cases = await remote.getAllCases();
//     return cases
//         .map(
//           (model) => DentalCase(
//             id: model.id,
//             title: model.title,
//             description: model.description,
//             imageUrl: model.imageUrl,
//             category: model.category,
//             createdAt: model.createdAt,
//           ),
//         )
//         .toList();
//   }
//
//   @override
//   Future<List<DentalCase>> getCasesByCategory(String category) async {
//     final cases = await remote.getCasesByCategory(category);
//     return cases
//         .map(
//           (model) => DentalCase(
//             id: model.id,
//             title: model.title,
//             description: model.description,
//             imageUrl: model.imageUrl,
//             category: model.category,
//             createdAt: model.createdAt,
//           ),
//         )
//         .toList();
//   }
// }
