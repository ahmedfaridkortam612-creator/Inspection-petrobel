import 'package:flutter/material.dart';

class CranesCertificatesScreen extends StatelessWidget {
  final bool isAdmin;
  final String lang;

  const CranesCertificatesScreen({super.key, required this.isAdmin, required this.lang});

  @override
  Widget build(BuildContext context) {
    bool isAr = lang == 'ar';
    return Scaffold(
      appBar: AppBar(
        title: Text(isAr ? 'شهادات معايرة الأوناش والرفع' : 'Cranes & Lifting Certificates'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Card(
            elevation: 2,
            child: ListTile(
              leading: const Icon(Icons.verified, color: Colors.orange, size: 36),
              title: Text(
                isAr ? 'ونش رقم CR-102 (Mobile Crane)' : 'Crane #CR-102',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(isAr ? 'صالح حتى: 2027-01-01 | تم التحديث من قاعدة البيانات' : 'Valid until: 2027-01-01'),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(isAr ? 'جاري تحميل شهادة المعايرة بصيغة Word...' : 'Downloading Word certificate...')),
                  );
                },
                child: Text(isAr ? 'تحميل Word' : 'Word', style: const TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: isAdmin
          ? FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(isAr ? 'إضافة شهادة معايرة جديدة وتحديثها...' : 'Adding new calibration certificate...')),
                );
              },
              child: const Icon(Icons.add),
              tooltip: isAr ? 'إضافة شهادة جديدة' : 'Add New Certificate',
            )
          : null,
    );
  }
}
