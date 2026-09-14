import 'package:flutter/material.dart';

class PartitionsScreen extends StatelessWidget {
  final bool isAdmin;
  final String lang;

  const PartitionsScreen({super.key, required this.isAdmin, required this.lang});

  @override
  Widget build(BuildContext context) {
    bool isAr = lang == 'ar';
    final List<Map<String, String>> partitions = [
      {'nameAr': 'فحص المواسير', 'nameEn': 'Pipes Inspection'},
      {'nameAr': 'فحص الهيتر', 'nameEn': 'Heaters Inspection'},
      {'nameAr': 'فحص المعدات الثقيلة', 'nameEn': 'Heavy Equipment'},
      {'nameAr': 'فحص الدهانات', 'nameEn': 'Coatings Inspection'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(isAr ? 'أقسام التفتيش الهندسي' : 'Engineering Inspection Partitions'),
      ),
      body: ListView.builder(
        itemCount: partitions.length,
        itemBuilder: (context, index) {
          String title = isAr ? partitions[index]['nameAr']! : partitions[index]['nameEn']!;
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.folder_open, color: Colors.blue),
              title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(isAr ? 'اضغط لرفع الملفات والتقارير اليومية' : 'Tap to upload files & daily reports'),
              trailing: isAdmin
                  ? IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // حذف القسم (للأدمن فقط)
                      },
                    )
                  : null,
              onTap: () {
                // الانتقال لتفاصيل القسم والدردشة
              },
            ),
          );
        },
      ),
      floatingActionButton: isAdmin
          ? FloatingActionButton(
              onPressed: () {
                // إضافة قسم جديد (للأدمن فقط)
              },
              child: const Icon(Icons.add),
              tooltip: isAr ? 'إضافة قسم جديد' : 'Add New Partition',
            )
          : null,
    );
  }
}
