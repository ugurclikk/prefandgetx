import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

controller _controller = Get.put(controller());
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //
  await get(); // başlarken çek ve kullan bu ikili yapı gerekli
  runApp(MyApp());
}

var x = false;
//controller _controller = Get.find();

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // controller _controller = Get.put(controller());
  @override

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'shared',
      //  theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  controller _controller = Get.find();
  void get() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("theme", !_controller.x[0]);
    _controller.x[0] = prefs.getBool("theme") ?? true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: _controller.x[0] ? Colors.white : Colors.black,
              onPressed: () {
                get();
              },
              child: Text("on/off"),
            ),
            // RaisedButton(onPressed: set),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), //
    );
  }
}

Future<void> get() async {
  final prefs = await SharedPreferences.getInstance();
  _controller.x[0] = prefs.getBool("theme") ?? _controller.x[0];
}

class controller extends GetxController {
  var x = [true].obs;
  //liste tut içindekiler senin gereçlerin

}
