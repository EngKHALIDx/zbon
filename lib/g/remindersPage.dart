

import 'package:flutter/material.dart';
import 'package:zbon/g/Rose.dart';
import 'package:zbon/g/core/buildCustomStack.dart';

class RemindersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text("تذكير التوكيل"),
      ),
      body: Column(
        
       children: [
        Text("طلبات  التوكيل المؤاكده"),

  buildCustomStack(
onNavigate: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Rose()),
          );
        },
      mainText: ' روز فهد عبد الرحمان الشمري',
      positionedText: 'ابنه ',
      mainTextSize: 20, 
      positionedTextSize: 15, 
    ),
    SizedBox(height: 100,),
  buildCustomStack(
    onNavigate: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Rose()),
          );
        },
      mainText: 'نوير خالد بشير العتيبي',
      positionedText: 'والده ',
      mainTextSize: 20, // تكبير حجم النص الرئيسي
      positionedTextSize: 15, // تكبير حجم النص داخل Positioned
    ),




       ], 


      ),
    );
  }
}
