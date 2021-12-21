import 'package:md3_blur_bottombar/md3_blur_bottombar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MD3 bottom bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'MD3 Bottom Bar example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    Text("Home"),
    Text("Search"),
    Text("Profile"),
  ];

  static const List<NavigationDestination> _navItems = <NavigationDestination>[
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(Icons.search_outlined),
      label: 'Search',
    ),
    NavigationDestination(
      icon: Icon(Icons.account_circle_outlined),
      label: 'Account',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Blur bar example")),
      body: Stack(
        children: <Widget>[
          _widgetOptions.elementAt(_selectedIndex),
          MD3BlurBottomView(
            height: 70.0,
            onIndexChange: (index) => _onItemTapped(index),
            selectedIndex: _selectedIndex,
            bottomNavigationBarItems: _navItems,
            backgroundColor: Color(0xFF192020),
          ),
        ],
      ),
    );
  }
}
