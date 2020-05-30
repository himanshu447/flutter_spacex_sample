import 'package:flutter/material.dart';
import 'package:flutterspacexsample/components/text_component.dart';
import 'package:flutterspacexsample/utils/route_name_utils.dart';

import 'capsule/page/capsule_page.dart';
import 'history/page/history_detail.dart';
import 'history/page/history_page.dart';
import 'history/page/webview_item.dart';
import 'launches/page/launch_page.dart';
import 'mission/page/mission_page.dart';

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
      onGenerateRoute: (setting) {
        switch (setting.name) {
          case RouteName.history_detail:
            return MaterialPageRoute(
              builder: (context) => HistoryDetailView(historyModel: setting.arguments,),
            );
          case RouteName.webView:
            return MaterialPageRoute(
              builder: (context) => WebViewContainer(setting.arguments),
            );
          default:
            return null;
        }
      },
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

    _navBarText.add('Capsule');
    _navBarText.add('Mission');
    _navBarText.add('Launche');
    _navBarText.add('Rocket');
    _navBarText.add('History');

    _widgetList.add(Container(child: CapsuleView()));
    _widgetList.add(Container(child: MissionView()));
    _widgetList.add(Container(
      child: LaunchView(),
    ));
    _widgetList.add(Container(
      child: TextComponent(
        title: 'Widget 4',
      ),
    ));
    _widgetList.add(Container(child: HistoryView()));
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
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Image.asset('assets/space.png')
          ],
        ),
      ),
    );
  }
}
