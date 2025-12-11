import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: 90.h,
            right: 16.w,
            left: 16.w,
            top: 16.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),

              Text(
                'Last Updated: November 2025',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 24),

              Text(
                'Smile Care is a simple educational application. We want to make it clear that our app does not collect, store, or share any personal information.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),

              Text(
                'Information Collection',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              Text(
                'This application does not collect any kind of personal data. We do not ask for your email, name, phone number, location, or photos.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),

              Text(
                'Permissions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              Text(
                'The application does not request any device permissions.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),

              Text(
                'How the App Works',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              Text(
                'The app simply displays dental case content for educational purposes. Users cannot upload or submit any information.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),

              Text(
                'Third-Party Services',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              Text(
                'The app does not use any third-party services that collect personal or sensitive information. Firebase is used only to host the privacy policy page.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),

              Text(
                'Children’s Privacy',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              Text(
                'Since no data is collected, the application is safe for all ages, including children.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),

              Text(
                'Changes to This Policy',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              Text(
                'Any updates to this Privacy Policy will be posted on this page.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),

              Text(
                'Contact Us',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              Text(
                'If you have any questions about this Privacy Policy, you may contact us at:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),

              Text(
                'Email: Felzahraa478@gmail.com',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
