import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'الصفحة الشخصية',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.right,
        ),
      ),
      body: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // بيانات الأشخاص (قائمة تجريبية)
  final List<Map<String, String>> people = [
    {
      'name': 'أحمد علي',
      'id': '1234567890',
      'date': '2024-12-01',
      'imagePath': 'assets/images/person1.jpg',
    },
    {
      'name': 'سارة محمد',
      'id': '0987654321',
      'date': '2024-12-02',
      'imagePath': 'assets/images/person2.jpg',
    },
    {
      'name': 'محمد يوسف',
      'id': '5678901234',
      'date': '2024-12-03',
      'imagePath': 'assets/images/person3.jpg',
    },
    {
      'name': 'ريم عبد الله',
      'id': '4567890123',
      'date': '2024-12-04',
      'imagePath': 'assets/images/person4.jpg',
    },
  ];

  Widget buildPersonCard(int index) {
    final person = people[index];
    print('Building person card for index: $index'); // Debugging log
    print('Person data: $person'); // Debugging log

    return Card(
      color: Colors.black,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(person['imagePath'] ?? ''),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'الاسم: ${person['name']}',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'رقم الهوية: ${person['id']}',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'التاريخ: ${person['date']}',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('Building ProfilePage UI'); // Debugging log

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey[700],
                child: Icon(Icons.person, color: Colors.white, size: 30),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'الاسم: علا صالح',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      'العمر: 47',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    Text(
                      'الحالة الاجتماعية: متزوجة',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () {
            print('Add button pressed'); // Debugging log

            showDialog(
              context: context,
              builder: (BuildContext context) {
                print('Displaying dialog with person cards'); // Debugging log

                return SimpleDialog(
                  backgroundColor: Colors.grey[900],
                  contentPadding: EdgeInsets.all(16),
                  children: [
                    ...List.generate(
                      people.length,
                      (index) => buildPersonCard(index),
                    ),
                  ],
                );
              },
            );},
          icon: Icon(Icons.add),
          label: Text('إضافة فرد للتوكيل'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[850],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 20),
       
        MenuItem(title: 'المواعيد السابقة'),
        MenuItem(title: 'الأشعات'),
        MenuItem(title: 'التشخيصات السابقة'),
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;

  const MenuItem({required this.title});

  @override
  Widget build(BuildContext context) {
    print('Building menu item: $title'); // Debugging log

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
