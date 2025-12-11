import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../domain/entites/dental_case.dart';
import 'case_details_screen.dart'; // مكان الداتا staticCases

class CasesPerCategoryScreen extends StatelessWidget {
  final String category;

  const CasesPerCategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final List<DentalCase> cases = staticCases
        .where(
          (c) =>
              c.category.toLowerCase().trim() == category.toLowerCase().trim(),
        )
        .toList();

    return Scaffold(
      backgroundColor: Color(0xffcdf6fc),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          category,
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: cases.isEmpty
          ? Center(
              child: Text(
                "No cases in this category",
                style: TextStyle(color: Colors.red),
              ),
            )
          : GridView.builder(
              padding: EdgeInsets.all(16),
              itemCount: cases.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // أو 2 لو تريد grid
                childAspectRatio: 1.45,
                mainAxisSpacing: 18,
                crossAxisSpacing: 14,
              ),
              itemBuilder: (context, idx) {
                final dentalCase = cases[idx];
                return InkWell(
                  borderRadius: BorderRadius.circular(22),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            CaseDetailsScreen(dentalCase: dentalCase),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.82),
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.babyBlow,
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 14,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.asset(
                              dentalCase.imageUrl,
                              height: 140,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            dentalCase.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.primary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 7),
                          Text(
                            dentalCase.description,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blueGrey[700],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
