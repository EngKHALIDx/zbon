import 'package:flutter/material.dart';
import 'package:zbon/g/core/MedicineEntryFlow.dart';
import 'package:zbon/g/core/buildCustomListTile.dart';

class AppointmentManager extends StatefulWidget {
  @override
  _AppointmentManagerState createState() => _AppointmentManagerState();
}

class _AppointmentManagerState extends State<AppointmentManager>
 {
  bool al = false;  // Initialize the variable with a default value
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("إدارة المواعيد"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              buildCustomElevatedButton(
                onPressed: () {
                  MedicineEntryFlow(
                    requireMedicineName: false,
                    context: context,
                    medicineTypes: ['الاستشارة النفسية', 'عيادة الأنف والحنجرة', 'عيادة الباطنية'],
                    dosages: ['ولاء علي الأحمد ', ' علي عبدالرحيم الشنقيطي', 'وجدان أحمد العمري '],
                    addMedicineTitle: 'إضافة دواء',
                    enterMedicineNameHint: 'أدخل اسم الدواء',
                    selectMedicineTypeTitle: ' عيادة ',
                    selectDosageTitle: 'الأطباء ',
                    summaryTitle: 'ملخص البيانات',
                  ).startMedicineEntryFlow();
                },
                icon: Icon(Icons.add),
                label: 'حجز موعد ',
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
                    : 
                    ListView(
                        children: [
                          buildAppointmentCard(
                            "عيادة الأسنان",
                            "ريم محمد",
                            "2024-11-9 | 4:30pm",
                            "مجمع طب اليمن - ",
                            false,
                          ),
                        ],
                      )
                    ,
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}
