import 'package:flutter/material.dart';

class CustomButtonBuilder {
  // دالة لإعادة EdgeInsets بناءً على المدخلات
  static EdgeInsets getDynamicPadding({
    required double horizontal,
    required double vertical,
  }) {
    return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
  }

  // دالة لإنشاء زر دائري
  static Widget buildCircleButton({
    required String label,
    required String period,
    required String selectedPeriod,
    required Function(String) onSelectPeriod,
    double paddingValue = 20, // القيمة الافتراضية للتوسيط
  }) {
    // تحديد لون الخلفية بناءً على الفترة المختارة
    Color backgroundColor =
        selectedPeriod == period ? Colors.blue : Colors.grey[800]!;

    return ElevatedButton(
      onPressed: () {
        onSelectPeriod(period); // تحديث الفترة المختارة
      },
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        backgroundColor: backgroundColor, // استخدام اللون بناءً على الفترة المختارة
        foregroundColor: Colors.white,
        padding: EdgeInsets.all(paddingValue), // استخدام قيمة التوسيط الديناميكية
      ),
      child: Text(label, style: TextStyle(fontSize: 14)),
    );
  }
}

Widget buildCustomStack({
  required String mainText,
  required String positionedText,
  double mainTextSize = 24, // حجم النص الرئيسي
  double positionedTextSize = 16, // حجم النص داخل Positioned
  required VoidCallback onNavigate, // دالة التنقل
  double horizontalPadding = 20, // التوسيط الأفقي
  double verticalPadding = 15, // التوسيط العمودي
}) {
  return GestureDetector(
    onTap: onNavigate, // عند الضغط يتم استدعاء دالة التنقل
    child: Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: CustomButtonBuilder.getDynamicPadding(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ), // استخدام التوسيط الديناميكي
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              mainText,
              style: TextStyle(
                fontSize: mainTextSize, // تعديل الحجم
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: -15,
            right: 3,
            child: Container(
              color: Colors.black,
              padding: CustomButtonBuilder.getDynamicPadding(
                horizontal: 10,
                vertical: 5,
              ), // استخدام التوسيط الديناميكي
              child: Text(
                positionedText,
                style: TextStyle(
                  fontSize: positionedTextSize, // تعديل الحجم
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
