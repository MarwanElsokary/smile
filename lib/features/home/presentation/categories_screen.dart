import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'cases_per_category_screen.dart';

class CategoryItem {
  final String name;
  final String image;

  CategoryItem(this.name, this.image);
}

final List<CategoryItem> categories = [
  CategoryItem("Complete Denture", "assets/images/images 2.png"),
  CategoryItem("Partial denture", "assets/images/partial.png"),
  CategoryItem("Single denture", "assets/images/images 3.png"),
  CategoryItem("Caries", "assets/images/cares.png"),
  CategoryItem("Full mouth Rehabilitation cases", "assets/images/images 4.png"),
  CategoryItem("Maxillofacial cases", "assets/images/images 5.png"),
];

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcdf6fc),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Home',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search & headline
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18),
                Center(
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
          // Grid categories
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 14,
                  childAspectRatio: 1.17,
                ),
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  return InkWell(
                    borderRadius: BorderRadius.circular(22),
                    onTap: () {
                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (_) =>
                              CasesPerCategoryScreen(category: cat.name),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.82),
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.babyBlow,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                        border: Border.all(color: Colors.blue.shade50),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.asset(
                              cat.image,
                              height: 95,
                              width: double.infinity,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: 14),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              cat.name,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
