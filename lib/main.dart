import 'package:flutter/material.dart';
import 'package:flutterspacexsample/components/text_component.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _widgetList = [];
  int _selectedIndex = 0;
  List<String> _navBarText = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    _navBarText.add('Capsules');
    _navBarText.add('Missions');
    _navBarText.add('Launches');
    _navBarText.add('Rockets');
    _navBarText.add('History');

    _widgetList.add(Container(
      child: TextComponent(
        title: 'Widget 1',
      ),
    ));
    _widgetList.add(Container(
      child: TextComponent(
        title: 'Widget 2',
      ),
    ));
    _widgetList.add(Container(
      child: TextComponent(
        title: 'Widget 3',
      ),
    ));
    _widgetList.add(Container(
      child: TextComponent(
        title: 'Widget 4',
      ),
    ));
    _widgetList.add(Container(
      child: TextComponent(
        title: 'Widget 5',
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextComponent(
          title: _navBarText[_selectedIndex],
        ),
      ),
      body: Center(
        child: _widgetList.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(
          color: Colors.blue,
        ),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        unselectedLabelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 10,
        ),
        items: _navBarText
            .map((e) => BottomNavigationBarItem(
                icon: Container(),
                title: TextComponent(
                  title: e,
                )))
            .toList(),
        onTap: (index) {
          _onItemTapped(index);
        },
      ),
    );
  }
}
