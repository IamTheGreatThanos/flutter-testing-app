import 'package:flutter/material.dart';
import 'package:testing_application_example/views/integration_test_example.dart';
import 'package:testing_application_example/views/scrolling_test_example.dart';
import 'package:testing_application_example/views/welcome_page.dart';

void main() {
  runApp(const MyApp());
  // runApp(ScrollingTestWidget(
  //   items: List<String>.generate(1000, (i) => "Item $i"),
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const IntegrationTestExamplePage());
    // home: const WelcomePage());
  }
}
