import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("التواصل مع المجتمع"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildSection("أحداث مجتمعية", buildEventIcons()),
            buildSection("التواصل مع الأصدقاء", buildFriendsRow()),
            buildSection("أنشطة تطوعية", buildActivitiesList()),
          ],
        ),
      ),
    );
  }

  Widget buildSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        content,
        Divider(color: Colors.white, thickness: 1, height: 40),
      ],
    );
  }

  Widget buildEventIcons() {
    final events = ["إشعارات\nالفعاليات", "ورش العمل", "ندوات"];
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: events.map((e) => buildIconButton(e)).toList(),
    );
  }

  Widget buildIconButton(String label) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Action when clicked
          },
          borderRadius: BorderRadius.circular(35),
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.blueGrey,
            child: Icon(Icons.notifications, color: Colors.white, size: 30),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }

  Widget buildFriendsRow() {
    final List<Map<String, dynamic>> friends = [
  {"name": "سياف", "icon": Icons.sentiment_dissatisfied},
  {"name": "فراس", "icon": Icons.thumb_down},
  {"name": "مجد", "icon": Icons.thumb_up},
  {"name": "نور", "icon": Icons.fitness_center},
];




    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...friends.map(
            (f) => buildFriendIcon(f["name"], f["icon"] as IconData),
          ),
          buildAddFriendButton(),
        ],
      ),
    );
  }

  Widget buildFriendIcon(String name, IconData icon) {
    return Column(
      children: [
        InkWell(
          onTap: () {
          },
          borderRadius: BorderRadius.circular(35),
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.blueGrey,
            child: Icon(icon, color: Colors.white, size: 30),
          ),
        ),
        SizedBox(height: 8),
        Text(name, style: TextStyle(color: Colors.white, fontSize: 14)),
      ],
    );
  }

  Widget buildAddFriendButton() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Action when clicked
          },
          borderRadius: BorderRadius.circular(35),
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.green,
            child: Icon(Icons.add, color: Colors.white, size: 30),
          ),
        ),
        SizedBox(height: 8),
        Text(
          "إضافة صديق",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }

  Widget buildActivitiesList() {
    final activities = [
      "زيارة دار\nالمسنين",
      "تطوع صحي",
      "تنظيف البيئة",
      "مساعدة المحتاجين",
    ];
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: activities.map((a) => buildActivityCard(a)).toList(),
    );
  }

  Widget buildActivityCard(String label) {
    return GestureDetector(
      onTap: () {
        // Action when clicked
      },
      child: Container(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blueGrey[700],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 2)),
          ],
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
