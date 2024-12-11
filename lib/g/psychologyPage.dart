import 'package:flutter/material.dart';
import 'package:zbon/g/core/buildCustomListTile.dart';
import 'package:zbon/g/core/buildCustomStack.dart';

class PsychologyPage extends StatefulWidget {
  const PsychologyPage({super.key});

  @override
  State<PsychologyPage> createState() => _PsychologyPageState();
}

class _PsychologyPageState extends State<PsychologyPage> {
  bool al = false;  // يجب أن يكون هنا، داخل الـ State

  void showSessionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('جدول الجلسات'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(Icons.person), // أيقونة المستشار
                  SizedBox(width: 8),
                  Text('اسم المستشار'),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.search), // أيقونة البحث
                  SizedBox(width: 8),
                  Text('هنا التوقيت'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'إستشارات نفسية',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCustomStack(
              onNavigate: () {},
              positionedText: 'التوجيه والارشاد الطبي',
              mainText: ' نصائح يوميه حول التامل',
              mainTextSize: 20,
              positionedTextSize: 13,
            ),
            SizedBox(height: 20),
            buildCustomElevatedButton(
              onPressed: () {
showSessionDialog(context);
              },
              icon: Icon(Icons.add),
              label: 'حجز جلسة إرشادية',
              buttonPadding: 20.0, // مسافة داخل الزر
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      al = true;
                    });
                  },
                  child: Text("مواعيد سابقه", style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 1, horizontal: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      al = false;
                    });
                  },
                  child: Text("مواعيد مؤكدة", style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 1, horizontal: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: al
                  ? ListView(
                      children: [
                        buildAppointmentCard(
                          "عيادة الأسنان",
                          "أحمد عبدالله",
                          "2024-11-9 | 4:30pm",
                          "مجمع طب الأسنان - الرياض",
                          true,
                        ),
                      ],
                    )
                  : ListView(
                      children: [
                        buildAppointmentCard(
                          "عيادة الأسنان",
                          "ريم محمد",
                          "2024-11-9 | 4:30pm",
                          "مجمع طب اليمن - ",
                          false,
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
