import 'package:flutter/material.dart';

class MedicineEntryFlow {
  final BuildContext context;
  final List<String> medicineTypes;
  final List<String> dosages;
  final String addMedicineTitle;
  final String enterMedicineNameHint;
  final String selectMedicineTypeTitle;
  final String selectDosageTitle;
  final String summaryTitle;
  final bool requireMedicineName;

  MedicineEntryFlow({
    required this.context,
    required this.medicineTypes,
    required this.dosages,
    required this.addMedicineTitle,
    required this.enterMedicineNameHint,
    required this.selectMedicineTypeTitle,
    required this.selectDosageTitle,
    required this.summaryTitle,
    this.requireMedicineName = true,
  });

  void startMedicineEntryFlow() {
    String medicineName = '';
    List<String> selectedMedicineTypes = [];
    List<String> selectedDosages = [];

    if (requireMedicineName) {
      _showInputDialog(medicineName, selectedMedicineTypes, selectedDosages);
    } else {
      _showCheckboxDialog(
        title: selectMedicineTypeTitle,
        items: medicineTypes,
        selectedItems: selectedMedicineTypes,
        onNext: () => _showCheckboxDialog(
          title: selectDosageTitle,
          items: dosages,
          selectedItems: selectedDosages,
          onNext: () => _showDateOfBirthDialog(medicineName, selectedMedicineTypes, selectedDosages),
        ),
      );
    }
  }

  void _showInputDialog(String medicineName, List<String> selectedMedicineTypes, List<String> selectedDosages) {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController controller = TextEditingController();
        return AlertDialog(
          title: Text(addMedicineTitle),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: enterMedicineNameHint),
          ),
          actions: [
            TextButton(
              onPressed: () {
                medicineName = controller.text;
                Navigator.pop(context);
                if (medicineName.isEmpty) {
                  _showSnackbar('يرجى إدخال اسم الدواء');
                } else {
                  _showCheckboxDialog(
                    title: selectMedicineTypeTitle,
                    items: medicineTypes,
                    selectedItems: selectedMedicineTypes,
                    onNext: () => _showCheckboxDialog(
                      title: selectDosageTitle,
                      items: dosages,
                      selectedItems: selectedDosages,
                      onNext: () => _showDateOfBirthDialog(medicineName, selectedMedicineTypes, selectedDosages),
                    ),
                  );
                }
              },
              child: Text('التالي'),
            ),
          ],
        );
      },
    );
  }

  // دالة لعرض نافذة اختيار تاريخ الميلاد
  void _showDateOfBirthDialog(String medicineName, List<String> selectedMedicineTypes, List<String> selectedDosages) {
    if (requireMedicineName) {
      _showSummaryDialog(medicineName, selectedMedicineTypes, selectedDosages);
    } else {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      ).then((selectedDate) {
        if (selectedDate != null) {
          // استخدام التنسيق المناسب للتاريخ
          String formattedDate = "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
          _showSummaryDialog(medicineName, selectedMedicineTypes, selectedDosages, formattedDate);
        } else {
          _showSnackbar('لم يتم اختيار تاريخ');
        }
      });
    }
  }

  void _showCheckboxDialog({
    required String title,
    required List<String> items,
    required List<String> selectedItems,
    required VoidCallback onNext,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(title),
              content: SingleChildScrollView(
                child: Column(
                  children: items.map((item) {
                    return CheckboxListTile(
                      title: Text(item),
                      value: selectedItems.contains(item),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            selectedItems.add(item);
                          } else {
                            selectedItems.remove(item);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onNext();
                  },
                  child: Text('التالي'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // دالة لعرض ملخص البيانات
  void _showSummaryDialog(String medicineName, List<String> medicineTypes, List<String> dosages, [String selectedDate = 'غير محدد']) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(summaryTitle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              medicineName.isEmpty
                  ? SizedBox()
                  : Text('اسم الدواء: $medicineName'),
              Text('أنواع الأدوية: ${medicineTypes.isEmpty ? 'غير محدد' : medicineTypes.join(', ')}'),
              Text('الجرعات: ${dosages.isEmpty ? 'غير محددة' : dosages.join(', ')}'),
              Text('تاريخ الميلاد: $selectedDate'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _showSnackbar('تم إضافة الدواء بنجاح!');
              },
              child: Text('تم'),
            ),
          ],
        );
      },
    );
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
