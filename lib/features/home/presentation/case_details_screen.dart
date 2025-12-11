import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../domain/entites/dental_case.dart';

class CaseDetailsScreen extends StatelessWidget {
  final DentalCase dentalCase;

  const CaseDetailsScreen({super.key, required this.dentalCase});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcdf6fc),
      appBar: AppBar(
        title: Text(
          dentalCase.title,
          style: TextStyle(
            color: Colors.blue[900],
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Color(0xffcdf6fc),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                dentalCase.imageUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              dentalCase.title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),

            SizedBox(height: 10),

            Text(
              dentalCase.description,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),

            SizedBox(height: 20),

            Container(
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                "Category: ${dentalCase.category}",
                style: TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
