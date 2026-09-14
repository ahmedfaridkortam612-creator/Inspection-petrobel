import 'package:flutter/material.dart';

class PartitionDetailScreen extends StatefulWidget {
  final String partitionName;
  final String lang;
  final bool isAdmin;

  const PartitionDetailScreen({
    super.key,
    required this.partitionName,
    required this.lang,
    required this.isAdmin,
  });

  @override
  State<PartitionDetailScreen> createState() => _PartitionDetailScreenState();
}

class _PartitionDetailScreenState extends State<PartitionDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {
      'sender': 'أحمد',
      'text': 'تم فحص مواسير الخط الرئيسي اليوم ورفع الصور.',
      'time': '2026-09-14 10:30 AM',
      'file': null,
    }
  ];

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;
    setState(() {
      _messages.add({
        'sender': widget.isAdmin ? 'الأدمن (Admin)' : 'أحمد (مستخدم)',
        'text': _messageController.text,
        'time': 'الآن',
        'file': null,
      });
      _messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isAr = widget.lang == 'ar';
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.partitionName),
      ),
      body: Column(
        children: [
          // عرض الرسائل والفحوصات اليومية
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    leading: const Icon(Icons.person, color: Colors.blue),
                    title: Text(msg['sender'], style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(msg['text']),
                        const SizedBox(height: 4),
                        Text(msg['time'], style: const TextStyle(fontSize: 10, color: Colors.grey)),
                      ],
                    ),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'delete') {
                          setState(() {
                            _messages.removeAt(index);
                          });
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'edit',
                          child: Text(isAr ? 'تعديل الرسالة' : 'Edit Message'),
                        ),
                        PopupMenuItem(
                          value: 'delete',
                          child: Text(isAr ? 'حذف للجميع' : 'Delete for everyone', style: const TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),
          // شريط كتابة الرسائل ورفع الملفات (صور، فيديو، PDF، Excel، Word)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.attach_file, color: Colors.blue),
                  onPressed: () {
                    // هنا يتم اختيار الملفات (صور، فيديو، pdf، excel، word)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(isAr ? 'جاري فتح نافذة اختيار الملفات...' : 'Opening file picker...')),
                    );
                  },
                  tooltip: isAr ? 'رفع ملف (صور، فيديو، PDF، Excel، Word)' : 'Upload files',
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: isAr ? 'اكتب ملاحظة الفحص اليومي...' : 'Type inspection note...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: _sendMessage,
                  tooltip: isAr ? 'إرسال' : 'Send',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
