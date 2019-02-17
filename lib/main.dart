import 'package:flutter/material.dart';
import './pages/landing_page.dart';
import './pages/quiz_page.dart';
import './pages/score_page.dart';
void main() => runApp(MyApp());
// Hierarchy of the Flutter objects normally are: StatelessWidget > StatefulWidget > State<object>
// Program always start with void main() => runApp(MyApp()); . MyApp is a class extends Stateless Widget.
// Normally only one Stateless Widget in the application
// Widget is something that contains StatefulWidget and State<object> wrapped inside.
// StatefulWidget and State<object> goes in pairs
// StatelessWidget normally writes @override Widget build(BuildContext context) { return MaterialApp(home: new StatelessWidgetObjectName())}
// StatefulWidget normally writes @override State createState() => new State<>ObjectName();
// State<object> normally writes @override Widget build(BuildContext context) {}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: new LandingPage()
    );
  }
}
