// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class AddCaseScreen extends StatefulWidget {
//   const AddCaseScreen({super.key});
//
//   @override
//   State<AddCaseScreen> createState() => _AddCaseScreenState();
// }
//
// class _AddCaseScreenState extends State<AddCaseScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//
//   String? selectedCategory;
//   File? selectedImage;
//   bool isLoading = false;
//
//   final List<String> categories = [
//     "Complete Denture",
//     "Partial Denture",
//     "Single Denture",
//     "Caries",
//     "Full mouth Rehabilitation cases",
//     "Maxillofacial cases",
//   ];
//
//   Future<void> pickImage() async {
//     final pickedFile = await ImagePicker().pickImage(
//       source: ImageSource.gallery, // أو ImageSource.camera
//     );
//     if (pickedFile != null) {
//       setState(() {
//         selectedImage = File(pickedFile.path);
//       });
//     }
//   }
//
//   Future<String> uploadImage(File image) async {
//     final fileName = DateTime.now().millisecondsSinceEpoch.toString();
//     final ref = FirebaseStorage.instance.ref().child(
//       'cases_images/$fileName.jpg',
//     );
//     await ref.putFile(image);
//     return await ref.getDownloadURL();
//   }
//
//   Future<void> submitCase() async {
//     if (!_formKey.currentState!.validate()) return;
//     if (selectedImage == null) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("Please select an image")));
//       return;
//     }
//     if (selectedCategory == null) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("Please select a category")));
//       return;
//     }
//
//     setState(() => isLoading = true);
//     try {
//       final imageUrl = await uploadImage(selectedImage!);
//
//       await FirebaseFirestore.instance.collection('cases').add({
//         'title': titleController.text.trim(),
//         'description': descriptionController.text.trim(),
//         'category': selectedCategory!,
//         'imageUrl': imageUrl,
//         'createdAt': FieldValue.serverTimestamp(),
//       });
//
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("Case added successfully")));
//
//       titleController.clear();
//       descriptionController.clear();
//       setState(() {
//         selectedImage = null;
//         selectedCategory = null;
//       });
//     } catch (e) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text("Error: $e")));
//     } finally {
//       setState(() => isLoading = false);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Add Case"),
//         automaticallyImplyLeading: false,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 TextFormField(
//                   controller: titleController,
//                   decoration: const InputDecoration(labelText: "Title"),
//                   validator: (value) =>
//                       value == null || value.isEmpty ? "Enter title" : null,
//                 ),
//                 SizedBox(height: 12.h),
//                 TextFormField(
//                   controller: descriptionController,
//                   decoration: const InputDecoration(labelText: "Description"),
//                   validator: (value) => value == null || value.isEmpty
//                       ? "Enter description"
//                       : null,
//                 ),
//                 SizedBox(height: 12.h),
//                 DropdownButtonFormField<String>(
//                   decoration: InputDecoration(labelText: "Category"),
//                   value: selectedCategory,
//                   items: categories
//                       .map(
//                         (cat) => DropdownMenuItem(value: cat, child: Text(cat)),
//                       )
//                       .toList(),
//                   onChanged: (value) {
//                     setState(() {
//                       selectedCategory = value;
//                     });
//                   },
//                   validator: (value) =>
//                       value == null || value.isEmpty ? "Select category" : null,
//                 ),
//                 SizedBox(height: 20.h),
//                 GestureDetector(
//                   onTap: pickImage,
//                   child: Container(
//                     height: 180.h,
//                     width: double.infinity,
//                     color: Colors.grey[300],
//                     child: selectedImage == null
//                         ? const Icon(Icons.add_a_photo, size: 50)
//                         : Image.file(selectedImage!, fit: BoxFit.cover),
//                   ),
//                 ),
//                 SizedBox(height: 20.h),
//                 isLoading
//                     ? const CircularProgressIndicator()
//                     : ElevatedButton(
//                         onPressed: submitCase,
//                         child: const Text("Add Case"),
//                       ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
