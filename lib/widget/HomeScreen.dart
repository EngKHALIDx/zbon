
import 'package:flutter/material.dart';
import 'package:zbon/g/AppointmentManager%20.dart';
import 'package:zbon/g/CommunityPage.dart';
import 'package:zbon/g/core/MealSelectionPage%20.dart';
import 'package:zbon/g/core/buildCustomStack.dart';
import 'package:zbon/g/guidancePage.dart';
import 'package:zbon/g/medicinesPage.dart';
import 'package:zbon/g/psychologyPage.dart';
import 'package:zbon/g/remindersPage.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context); // إغلاق الـ Drawer عند النقر
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.black, // تغيير اللون ليكون مرئيًا
              ),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context); // إغلاق الـ Drawer عند النقر
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "الرئيسية",
          style: TextStyle(color: Color.fromARGB(255, 16, 14, 14), fontSize: 20),
        ),
        
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),

          buildCustomStack(
             onNavigate:() {
               
             } ,
      mainText: 'ماراثون الرياضة',
      positionedText: 'التوجيه والارشاد',
      mainTextSize: 24, // تكبير حجم النص الرئيسي
      positionedTextSize: 15, // تكبير حجم النص داخل Positioned
    ),

            SizedBox(height: 16),
            
            Text(
          "وجبات اليوم",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        SizedBox(height: 8),
            // وجبات اليوم
           MealsWidget(),
           SizedBox(height: 24),

            // قائمة المربعات
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                children: [
  {"title": "الأدوية والتغذية", "page": MedicinesPage()},
  {"title": "المواعيد", "page": AppointmentManager ()},
  {"title": "التواصل مع المجتمع", "page": CommunityPage()},
  {"title": "الاستشارات النفسية", "page": PsychologyPage()},
  {"title": "تذكير التوكيل", "page": RemindersPage()},
  {"title": "إرشاد وتوجيه", "page": GuidancePage()},
].map<Widget>(
  (item) {
    final String? title = item['title'] as String?;
    final Widget? page = item['page'] as Widget?;
    if (title == null || page == null) {
      return SizedBox(); // عنصر فارغ إذا كان هناك خطأ في البيانات.
    }
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF7D82E3),

          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  },
).toList(),

              ),
            ),
         
          ],
        ),
      ),
    );
  }
}

// الصفحات الفرعية
