import 'package:flutter/material.dart';
import 'package:zbon/g/core/buildCustomStack.dart';

class GuidancePage extends StatelessWidget {
  // البيانات التي تحتوي على العناوين والصفحات
  final List<Map<String, dynamic>> items = [
    {"title": "انشطة ذهنية", "page": Page1()},
    {"title": "أنشطة ذهنية", "page": Page2()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("إرشاد وتوجيه"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 45),
          buildCustomStack(
            onNavigate: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Page22()),
              );
            },
            horizontalPadding: 20,
            verticalPadding: 20,
            mainText: 'نصائح يومية حول الصحة الجسدية والغذائية',
            positionedText: 'نصائح صحية',
            mainTextSize: 25,
            positionedTextSize: 15,
          ),
          const Divider(
            color: Colors.white,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          const SizedBox(height: 35),

          GridView.builder(
            shrinkWrap: true,  // لجعل الـ GridView يأخذ المساحة المطلوبة فقط
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
            ),
            itemCount: items.length, // عدد العناصر في الشبكة
            itemBuilder: (context, index) {
              final item = items[index];
              final String title = item['title'] as String;
              final Widget page = item['page'] as Widget;

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => page),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF7D82E3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
      
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
          appBar: AppBar(),

      body: 
       GridView.builder(
            shrinkWrap: true,  // لجعل الـ GridView يأخذ المساحة المطلوبة فقط
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
            ),
            itemCount:2, // عدد العناصر في الشبكة
            itemBuilder: (context, index) {

              return GestureDetector(
                onTap: () {
                  
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF7D82E3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "الغاز ذهنية",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
      
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.black,

     appBar: AppBar(),
      body:  
         GridView.builder(
            shrinkWrap: true,  // لجعل الـ GridView يأخذ المساحة المطلوبة فقط
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
            ),
            itemCount:2, // عدد العناصر في الشبكة
            itemBuilder: (context, index) {

              return GestureDetector(
                onTap: () {
                  
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF7D82E3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "الغاز ذهنية",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
     
    );
  }
}

class Page22 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(),

      backgroundColor: Colors.black,
      body: buildCustomStack(
        onNavigate: () {},
        horizontalPadding: 40,
        verticalPadding: 15,
        mainText: 'نصائح يومية حول الصحة الجسدية والغذائية',
        positionedText: 'نصائح صحية',
        mainTextSize: 40,
        positionedTextSize: 15,
      ),
    );
  }
}
