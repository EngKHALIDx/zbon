import 'package:flutter/material.dart';
import 'package:zbon/g/core/MedicineEntryFlow.dart';
import 'package:zbon/g/core/buildCustomListTile.dart';
import 'package:zbon/g/core/buildCustomStack.dart';

class MedicinesPage extends StatefulWidget {
  @override
  _MedicinesPageState createState() => _MedicinesPageState();
}

class _MedicinesPageState extends State<MedicinesPage> {
  bool isLactoseAllergySelected = false;
  bool isWheatAllergySelected = false;
  bool isGlutenAllergySelected = false;
 String  selectedPeriod = '';  // متغير لتخزين الفترة المحددة

  // دالة لتغيير الفترة المحددة
  void _selectPeriod(String period) {
    setState(() {
      selectedPeriod = period;  // تعيين الفترة المختارة
    });
  }
  void onSubmit() {
    print("حساسية اللاكتوز: $isLactoseAllergySelected");
    print("حساسية القمح: $isWheatAllergySelected");
    print("حساسية الغلوتين: $isGlutenAllergySelected");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('الأدوية والتغذية'),
        backgroundColor: Color(0xFFDFCACA),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildCustomElevatedButton(
              onPressed: () {
               
                MedicineEntryFlow(
                  context: context,
                  medicineTypes: ['حبوب', 'سائل', 'إبر'],
                  dosages: ['عند الحاجة', 'كل يوم', 'أيام متفرقة'],
                  addMedicineTitle: 'إضافة دواء',
                  enterMedicineNameHint: 'أدخل اسم الدواء',
                  selectMedicineTypeTitle: 'اختيار نوع الدواء',
                  selectDosageTitle: 'اختيار الجرعة',
                  summaryTitle: 'ملخص البيانات',
                ).startMedicineEntryFlow();
            
              },
              icon: Icon(Icons.add),
              label: 'إضافة دواء',
            ),
            SizedBox(height: 20),
            // buildCustomElevatedButton(
            //   onPressed: () {
         
            //   },
            //   icon: Icon(Icons.add),
            //   label: 'مستشار الخطه الغذائيه',
            // ),
            SizedBox(height: 20),
            buildCustomElevatedButton(
              onPressed: () {


 MedicineEntryFlow(
                  context: context,
                  requireMedicineName :false,
                  medicineTypes: ['تقليل الوزن', 'زيادة الوزن', 'المحافضة على الوزن'],
                  dosages: [ 'بعد $selectedPeriod ', '  قبل $selectedPeriod'],
                  addMedicineTitle: 'إضافة دواء',
                  enterMedicineNameHint: 'أدخل اسم الدواء',
                  selectMedicineTypeTitle: 'إضافة خطة غذائية',
                  selectDosageTitle: ' ادوية اليوم',
                  summaryTitle: 'ملخص البيانات',
                ).startMedicineEntryFlow();
            
              },
              icon: Icon(Icons.add),
              label: 'إضافة خطة غذائية',
            ),
            SizedBox(height: 20),
            Text(
              "أدوية اليوم",
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               
                CustomButtonBuilder.buildCircleButton(
                  label: "فطور",
                  period: "صباح",
                  selectedPeriod: selectedPeriod,
                  onSelectPeriod: _selectPeriod,
                ),
                SizedBox(width: 20),
                CustomButtonBuilder.buildCircleButton(
                  label: "غداء",
                  period: "غداء",
                  selectedPeriod: selectedPeriod,
                  onSelectPeriod: _selectPeriod,
                ),
                SizedBox(width: 20),
                CustomButtonBuilder.buildCircleButton(
                  label: "عشاء",
                  period: "عشاء",
                  selectedPeriod: selectedPeriod,
                  onSelectPeriod: _selectPeriod,
                ),
              
              ],
            ),
            SizedBox(height: 20),
            Text(
              "إضافة حساسية",
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CheckboxListTile(
                  title: Text("حساسية اللاكتوز", style: TextStyle(color: Colors.white)),
                  value: isLactoseAllergySelected,
                  onChanged: (bool? value) {
                    setState(() {
                      isLactoseAllergySelected = value!;
                    });
                  },
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                ),
                CheckboxListTile(
                  title: Text("حساسية قمح", style: TextStyle(color: Colors.white)),
                  value: isWheatAllergySelected,
                  onChanged: (bool? value) {
                    setState(() {
                      isWheatAllergySelected = value!;
                    });
                  },
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                ),
                CheckboxListTile(
                  title: Text("حساسية غلوتين", style: TextStyle(color: Colors.white)),
                  value: isGlutenAllergySelected,
                  onChanged: (bool? value) {
                    setState(() {
                      isGlutenAllergySelected = value!;
                    });
                  },
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: onSubmit,
            //   child: Text("تم"),
            // ),
          ],
        ),
      ),
    );
  }
 Widget buildCircleButton(String label, String period) {
    // تحديد لون الخلفية بناءً على الفترة المختارة
    Color backgroundColor = selectedPeriod == period ? Colors.blue : Colors.grey[800]!;

    return ElevatedButton(
      onPressed: () {
        _selectPeriod(period);  // تحديث الفترة المختارة
      },
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        backgroundColor: backgroundColor,  // استخدام اللون بناءً على الفترة المختارة
        foregroundColor: Colors.white,
        padding: EdgeInsets.all(20),
      ),
      child: Text(label, style: TextStyle(fontSize: 14)),
    );
  }}
