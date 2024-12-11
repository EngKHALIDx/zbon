import 'package:flutter/material.dart';



Widget buildCustomElevatedButton({
  required VoidCallback onPressed,
  required Icon icon,
  required String label,
  Color backgroundColor = Colors.transparent,
  Color borderColor = Colors.white,
  Color textColor = Colors.white,
  double borderRadius = 8.0,
  double fontSize = 16.0, // حجم النص
  double iconSize = 24.0, // حجم الأيقونة
  double buttonPadding = 16.0, // البعد الداخلي
  Size?   minimumSize =const Size(300, 80), // تحديد الحجم الأدنى
 
}) {
  return ElevatedButton.icon(
    onPressed: onPressed,
    icon: Icon(icon.icon, color: textColor, size: iconSize),
    label: Text(
      label,
      style: TextStyle(color: textColor, fontSize: fontSize),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      side: BorderSide(color: borderColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: EdgeInsets.all(buttonPadding),
      minimumSize: minimumSize, // الحجم الأدنى للزر
    ),
  );
}

 Widget buildAppointmentCard(String clinic, String name, String dateTime, String location, bool isConfirmed) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(clinic, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(color: Colors.white, thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.person, color: Colors.white, size: 18),
                  SizedBox(width: 8),
                  Text(name, style: TextStyle(color: Colors.white)),
                ],
              ),
              Text(isConfirmed ? "مؤكد" : "غير مؤكد", style: TextStyle(color: isConfirmed ? Colors.green : Colors.red)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.access_time, color: Colors.white, size: 18),
              SizedBox(width: 8),
              Text(dateTime, style: TextStyle(color: Colors.white)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.white, size: 18),
              SizedBox(width: 8),
              Text(location, style: TextStyle(color: Colors.white)),
            ],
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("إلغاء"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

