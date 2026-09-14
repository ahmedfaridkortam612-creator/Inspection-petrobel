import 'package:flutter/material.dart';

void main() {
  runApp(const InspectionPetrobelApp());
}

class InspectionPetrobelApp extends StatefulWidget {
  const InspectionPetrobelApp({super.key});

  @override
  State<InspectionPetrobelApp> createState() => _InspectionPetrobelAppState();
}

class _InspectionPetrobelAppState extends State<InspectionPetrobelApp> {
  Locale _currentLocale = const Locale('ar');

  void _toggleLanguage() {
    setState(() {
      _currentLocale = _currentLocale.languageCode == 'ar'
          ? const Locale('en')
          : const Locale('ar');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inspection Petrobel',
      debugShowCheckedModeBanner: false,
      locale: _currentLocale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(onToggleLang: _toggleLanguage, currentLang: _currentLocale.languageCode),
    );
  }
}

class LoginScreen extends StatefulWidget {
  final VoidCallback onToggleLang;
  final String currentLang;

  const LoginScreen({super.key, required this.onToggleLang, required this.currentLang});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isAr = widget.currentLang == 'ar';
    return Scaffold(
      appBar: AppBar(
        title: Text(isAr ? 'التفتيش الهندسي ببتروبيل' : 'Petrobel Engineering Inspection'),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: widget.onToggleLang,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.engineering, size: 80, color: Colors.blueAccent),
                const SizedBox(height: 20),
                Text(
                  isAr ? 'تسجيل الدخول للنظام' : 'System Login',
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: isAr ? 'البريد الإلكتروني' : 'Email',
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: isAr ? 'كلمة المرور' : 'Password',
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                  onPressed: () {
                    bool isAdmin = _emailController.text.contains('admin');
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(isAdmin: isAdmin, lang: widget.currentLang, onToggleLang: widget.onToggleLang),
                      ),
                    );
                  },
                  child: Text(isAr ? 'دخول' : 'Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final bool isAdmin;
  final String lang;
  final VoidCallback onToggleLang;

  const HomeScreen({super.key, required this.isAdmin, required this.lang, required this.onToggleLang});

  @override
  Widget build(BuildContext context) {
    bool isAr = lang == 'ar';
    return Scaffold(
      appBar: AppBar(
        title: Text(isAr ? 'أقسام التفتيش الهندسي' : 'Inspection Partitions'),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: onToggleLang,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          ListTile(
            leading: const Icon(Icons.folder, color: Colors.blue),
            title: Text(isAr ? 'فحص المواسير (Pipes)' : 'Pipes Inspection'),
            subtitle: Text(isAr ? 'رفع التقارير واليوميات' : 'Daily inspection & reports'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.folder, color: Colors.blue),
            title: Text(isAr ? 'فحص الهيتر (Heaters)' : 'Heaters Inspection'),
            subtitle: Text(isAr ? 'رفع التقارير واليوميات' : 'Daily inspection & reports'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
