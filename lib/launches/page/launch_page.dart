import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterspacexsample/components/progress_component.dart';
import 'package:flutterspacexsample/components/text_component.dart';
import 'package:flutterspacexsample/launches/repository/launch_repository.dart';
import 'package:flutterspacexsample/launches/store/launch_store.dart';
import 'package:flutterspacexsample/launches/widget/launch_item.dart';
import 'package:flutterspacexsample/utils/enum_utils.dart';
import 'package:mobx/mobx.dart';

class LaunchView extends StatefulWidget {
  @override
  _LaunchViewState createState() => _LaunchViewState();
}

class _LaunchViewState extends State<LaunchView> {
  LaunchStore launchStore;
  final GlobalKey<ScaffoldState> globalKey = GlobalKey();
  ScrollController pastScrollController = ScrollController();
  ScrollController upcomingScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    launchStore = LaunchStore(launchRepository: LaunchRepository());
    launchStore.fetchLatestLaunch();
    launchStore.fetchUpComingLaunch();
    launchStore.fetchPastLaunch();

    pastScrollController = ScrollController()
      ..addListener(_pastScrollerListener);
    upcomingScrollController = ScrollController()
      ..addListener(_upComingScrollerListener);

    reaction((_) => launchStore.errorMessage, (msg) {
      globalKey.currentState.showSnackBar(SnackBar(
        content: TextComponent(
          title: msg,
          fontSize: 14,
        ),
        duration: Duration(seconds: 5),
      ));
    });
  }

  _pastScrollerListener() {
    if (pastScrollController.position.extentAfter == 0.0) {
      launchStore.fetchPastLaunch(offset: 5);
    }
  }

  _upComingScrollerListener() {
    if (upcomingScrollController.position.extentAfter == 0.0) {
      launchStore.fetchUpComingLaunch(offset: 5);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30)
                  .copyWith(top: 25, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: 'Latest',
                  ),
                  Tab(
                    text: 'Upcoming',
                  ),
                  Tab(
                    text: 'past',
                  )
                ],
                indicatorPadding: EdgeInsets.symmetric(
                  horizontal: 0,
                ),
                indicator: ShapeDecoration(
                  color: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                unselectedLabelColor: Colors.black,
                unselectedLabelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
                labelColor: Colors.white,
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
            Flexible(
              child: TabBarView(
                children: [
                  Center(
                      child: TextComponent(
                    title: 'Latest',
                  )),
                  Observer(
                    builder: (_) {
                      switch (launchStore.upComingLaunchState) {
                        case StoreState.initial:
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                          break;
                        case StoreState.loading:
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                          break;
                        case StoreState.loaded:
                          return _buildUpComingBody();
                          break;
                        default:
                          return Container();
                      }
                    },
                  ),
                  Observer(
                    builder: (_) {
                      switch (launchStore.pastLaunchState) {
                        case StoreState.initial:
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                          break;
                        case StoreState.loading:
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                          break;
                        case StoreState.loaded:
                          return _buildPastBody();
                          break;
                        default:
                          return Container();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpComingBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 12),
            controller: upcomingScrollController,
            itemBuilder: (_, index) {
              return LaunchItem(
                launchModel: launchStore.upComingLaunchList[index],
              );
            },
            itemCount: launchStore.upComingLaunchList.length,
          ),
        ),
        Visibility(
            visible: launchStore.upComingLaunchLoadMoreState ==
                    StoreState.loading ||
                launchStore.upComingLaunchLoadMoreState == StoreState.initial,
            child: ProgressComponent())
      ],
    );
  }

  Widget _buildPastBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 12),
            controller: pastScrollController,
            itemBuilder: (_, index) {
              return LaunchItem(
                launchModel: launchStore.pastLaunchList[index],
              );
            },
            itemCount: launchStore.pastLaunchList.length,
          ),
        ),
        Visibility(
            visible:
                launchStore.pastLaunchLoadMoreState == StoreState.loading ||
                    launchStore.pastLaunchLoadMoreState == StoreState.initial,
            child: ProgressComponent())
      ],
    );
  }
}
