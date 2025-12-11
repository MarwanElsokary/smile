import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/app_colors.dart';
import '../home/presentation/categories_screen.dart';
import '../home/presentation/home_layout_screen.dart';
import '../privacy_policy_screen.dart';

class NavBarLayout extends StatefulWidget {
  const NavBarLayout({super.key});

  @override
  State<NavBarLayout> createState() => _NavBarLayoutState();
}

class _NavBarLayoutState extends State<NavBarLayout> {
  int _selectedIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    // لاحظ هنا BlocProvider للـ
    _pages = [HomeScreen(), CategoriesScreen(), PrivacyPolicyScreen()];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildFloatingNavBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      height: 80.h,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.82),
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [BoxShadow(color: AppColors.babyBlow, blurRadius: 10.r)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavIcon("assets/images/home.icon.png", 0),
          _buildNavIcon("assets/images/Moleskine.png", 1),
          _buildNavIcon("assets/images/profile.icon.png", 2),
        ],
      ),
    );
  }

  Widget _buildNavIcon(String path, int index) {
    final isSelected = _selectedIndex == index;
    final List<String> labels = ["Home", "Category", "Privacy Policy"];

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 1.0, end: isSelected ? 1.2 : 1.0),
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutBack,
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  path,
                  width: 28.w,
                  height: 28.h,
                  color: AppColors.primary,
                ),
                SizedBox(height: 4.h),
                if (isSelected)
                  Text(
                    labels[index],
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900]?.withOpacity(0.70),
      body: Stack(
        children: [
          _pages[_selectedIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildFloatingNavBar(),
          ),
        ],
      ),
    );
  }
}
