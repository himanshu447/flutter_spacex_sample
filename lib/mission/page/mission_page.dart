import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterspacexsample/components/text_component.dart';
import 'package:flutterspacexsample/mission/repository/mission_repository.dart';
import 'package:flutterspacexsample/mission/store/mission_store.dart';
import 'package:flutterspacexsample/mission/widget/mission_item.dart';
import 'package:flutterspacexsample/utils/enum_utils.dart';
import 'package:mobx/mobx.dart';

class MissionView extends StatefulWidget {
  @override
  _MissionPAgeState createState() => _MissionPAgeState();
}

class _MissionPAgeState extends State<MissionView> {
  MissionStore missionStore;
  final GlobalKey<ScaffoldState> globalKey = GlobalKey();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    missionStore = MissionStore(missionRepository: MissionRepository());
    missionStore.fetchMission();
    scrollController = ScrollController()..addListener(_scrollerListener);

    reaction((_) => missionStore.errorMessage, (msg) {
      globalKey.currentState.showSnackBar(SnackBar(
        content: TextComponent(
          title: msg,
          fontSize: 14,
        ),
        duration: Duration(seconds: 5),
      ));
    });
  }

  _scrollerListener() {
    if (scrollController.position.extentAfter == 0.0) {
      missionStore.fetchMission(offset: 5);
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body: Observer(
        builder: (_) {
          switch (missionStore.missionState) {
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
              return _buildBody();
              break;
            default:
              return Container();
          }
        },
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 12),
            controller: scrollController,
            itemBuilder: (_, index) {
              return MissionItem(
                missionModel: missionStore.missionList[index],
              );
            },
            itemCount: missionStore.missionList.length,
          ),
        ),
        Visibility(
            visible: missionStore.missionLoadMoreState == StoreState.loading ||
                missionStore.missionLoadMoreState == StoreState.initial,
            child: Container(
              color: Colors.transparent,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ))
      ],
    );
  }
}
