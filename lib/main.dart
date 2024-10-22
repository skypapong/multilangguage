import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Screen/twoscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale("th"); // กำหนดค่าเริ่มต้นเป็นภาษาไทย

  void _changeLanguage(String a) {
    setState(() {
      if (a == "th") {
        _locale = const Locale('th'); // เปลี่ยนเป็นภาษาไทย
      } else if(a == "en") {
        _locale = const Locale('en'); // เปลี่ยนเป็นภาษาอังกฤษ
      }else{
        _locale = const Locale('hi');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale("en"),
        Locale("hi"),
        Locale("th"),
      ],
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        onChangeLanguage: _changeLanguage, // ส่งฟังก์ชันการเปลี่ยนภาษาไปยังหน้าแรก
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.onChangeLanguage});

  final String title;
  final Function(String) onChangeLanguage; // รับ String เพื่อใช้ใน _changeLanguage

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.helloWorld),
        actions: [
          TextButton(
            onPressed: () => widget.onChangeLanguage("en"),
            child: Text("Eng"), // ใช้ localized text
          ),
          TextButton(
            onPressed: () => widget.onChangeLanguage("th"),
            child: Text("ไทย"), // ใช้ localized text
          ),
          TextButton(
            onPressed: () => widget.onChangeLanguage("hi"),
            child: Text("भारत"), // ใช้ localized text
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(AppLocalizations.of(context)?.countMsg ?? ""),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Twoscreen(),
                    ),
                  );
                },
                child: Text("${AppLocalizations.of(context)?.page} 2"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
