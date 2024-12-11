

import 'package:flutter/material.dart';
import 'package:zbon/g/core/MedicineEntryFlow.dart';
import 'package:zbon/g/core/buildCustomListTile.dart';
import 'package:zbon/g/core/buildCustomStack.dart';

class Rose extends StatefulWidget {
  const Rose({super.key});

  @override
  State<Rose> createState() => _RoseState();
}

class _RoseState extends State<Rose> {
   String  selectedPeriod = '';  // متغير لتخزين الفترة المحددة

  void _selectPeriod(String period) {
    setState(() {
      selectedPeriod = period;  // تعيين الفترة المختارة
    });
  }
  @override
  Widget build(BuildContext context) {
    
void _startMedicineFlow(String selectedPeriod) {
              
              
    
  MedicineEntryFlow(
    context: context,
                  medicineTypes: ['حبوب', 'سائل', 'إبر'],
    dosages: ['بعد $selectedPeriod', 'قبل $selectedPeriod'],
    addMedicineTitle: 'إضافة دواء',
    enterMedicineNameHint: 'أدخل اسم الدواء',
    selectMedicineTypeTitle: 'إضافة خطة غذائية',
    selectDosageTitle: 'أدوية اليوم',
    summaryTitle: 'ملخص البيانات',
  ).startMedicineEntryFlow();
}
    return Scaffold(
      backgroundColor: Colors.black,
       appBar: AppBar(
        title: Text('زوار', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
                backgroundColor: Colors.blueGrey,
       ),
   body:  Column(

      children: [
       
        SizedBox(height: 50,),
       Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [ 
    CustomButtonBuilder.buildCircleButton(
      label: "فطور",
      period: "صباح",
      selectedPeriod: selectedPeriod,
      onSelectPeriod: (period) {
        _selectPeriod(period); // تحديد الفترة
        // استدعاء الدالة بعد اختيار الفطور
        _startMedicineFlow(period);
      },
    ),
    SizedBox(width: 20),
    CustomButtonBuilder.buildCircleButton(
      label: "غداء",
      period: "غداء",
      selectedPeriod: selectedPeriod,
      onSelectPeriod: (period) {
        _selectPeriod(period); // تحديد الفترة
        // استدعاء الدالة بعد اختيار الغداء
        _startMedicineFlow(period);
      },
    ),
    SizedBox(width: 20),
    CustomButtonBuilder.buildCircleButton(
      label: "عشاء",
      period: "عشاء",
      selectedPeriod: selectedPeriod,
      onSelectPeriod: (period) {
        _selectPeriod(period); // تحديد الفترة
        // استدعاء الدالة بعد اختيار العشاء
        _startMedicineFlow(period);
      },
    ),
  ],
),


        SizedBox(height: 40,),
         buildCustomStack(
             onNavigate:() {
               
             } ,
      mainText: 'لديك موعد في تمام الساعة 4:30 ',
      positionedText: 'في المواعيد 2024-11-9    ',
      mainTextSize: 24, // تكبير حجم النص الرئيسي
      positionedTextSize: 15, // تكبير حجم النص داخل Positioned
    ),            SizedBox(height: 20),

  buildCustomElevatedButton(
              onPressed: () {
               
                MedicineEntryFlow( 
                  requireMedicineName: false,
                  context: context,
                  medicineTypes: ['الاستشارة النفسية', 'عيادة عيادة الانف والحنجرة', 'عيادة الباطنية'],
                  dosages: ['ولاء علي الاحمد ', ' علي عبدالرحيم الشنقيطي', 'وجدان احمد العمري '],
                  addMedicineTitle: 'إضافة دواء',
                  enterMedicineNameHint: 'أدخل اسم الدواء',
                  selectMedicineTypeTitle: ' عيادة  ',
                  selectDosageTitle: 'الاطباء ',
                  summaryTitle: 'ملخص البيانات',
                ).startMedicineEntryFlow();
            
              },
              icon: Icon(Icons.add),
              label: 'حجز موعد ',
            ),
    
          
      ],
    ),
    );
  }


}