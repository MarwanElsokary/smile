import 'dart:math';

import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../domain/entites/dental_case.dart';
import 'case_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    staticCases.shuffle(Random());

    return Scaffold(
      backgroundColor: const Color(0xffcdf6fc),
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(14),
        itemCount: staticCases.length,
        itemBuilder: (context, index) {
          final dentalCase = staticCases[index];
          return FutureBuilder<bool>(
            future: _assetImageAvailable(context, dentalCase.imageUrl),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return SizedBox.shrink(); // أو placeholder صغير للتحمّل
              }
              if (snapshot.data == true) {
                return  InkWell(
                  borderRadius: BorderRadius.circular(22),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CaseDetailsScreen(dentalCase: dentalCase),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.82),
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.babyBlow,
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 14,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            dentalCase.imageUrl,
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 14),
                          Text(
                            dentalCase.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              color: Colors.blue[900],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Text(
                            dentalCase.description,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.blueGrey[700],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 12),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue[100],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            child: Text(
                              'Category: ${dentalCase.category}',
                              style: TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );

              } else {
                return SizedBox.shrink();
              }
            },
          );
        },
      ),
    );
  }

  Future<bool> _assetImageAvailable(
    BuildContext context,
    String assetPath,
  ) async {
    try {
      await DefaultAssetBundle.of(context).load(assetPath);
      return true;
    } catch (_) {
      return false;
    }
  }
}
