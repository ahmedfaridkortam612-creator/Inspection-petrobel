import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  final bool isAdmin;
  final String lang;

  const ReportsScreen({super.key, required this.isAdmin, required this.lang});

  @override
  Widget build(BuildContext context) {
    bool isAr = lang == 'ar';
    return Scaffold(
      appBar: AppBar(
        title: Text(isAr ? 'التقارير وتحليل Excel' : 'Reports & Excel Analysis'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isAr ? 'تقرير فحص المواسير اليومي (Tank 15 / Pipes)' : 'Pipes Daily Inspection Report',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 6),
                  Text(isAr ? 'آخر تحديث بواسطة: أحمد' : 'Last update by: Ahmed'),
                  Text(isAr ? 'تاريخ الفحص: 2026-09-14' : 'Inspection Date: 2026-09-14'),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                        icon: const Icon(Icons.description, size: 16, color: Colors.white),
                        label: Text(isAr ? 'تصدير Word' : 'Export Word', style: const TextStyle(color: Colors.white)),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(isAr ? 'جاري توليد ملف الـ Word بالتحديثات والصور الجديدة...' : 'Generating Word report...')),
                          );
                        },
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        icon: const Icon(Icons.table_chart, size: 16, color: Colors.white),
                        label: Text(isAr ? 'تحميل Excel' : 'Download Excel', style: const TextStyle(color: Colors.white)),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(isAr ? 'جاري تحميل شيت التحليل Excel...' : 'Downloading Excel analysis...')),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
