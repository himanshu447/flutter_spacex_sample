import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterspacexsample/capsule/repository/capsule_repository.dart';
import 'package:flutterspacexsample/capsule/store/capsule_store.dart';
import 'package:flutterspacexsample/capsule/widget/capsule_item.dart';
import 'package:flutterspacexsample/components/text_component.dart';
import 'package:flutterspacexsample/utils/enum_utils.dart';

class CapsuleView extends StatefulWidget {
  @override
  _CapsuleViewState createState() => _CapsuleViewState();
}

class _CapsuleViewState extends State<CapsuleView> {
  CapsuleStore capsuleStore;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    capsuleStore = CapsuleStore(capsuleRepository: CapsuleRepository());
    capsuleStore.fetchCapsules();
    scrollController = ScrollController()..addListener(_scrollerListener);
  }

  _scrollerListener() {
    if (scrollController.position.extentAfter == 0.0) {
      print('Last INdex');
      capsuleStore.fetchCapsules(offset: 5);
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
      body: Observer(
        builder: (_) {
          switch (capsuleStore.capsuleState) {
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
              return CapsuleItem(
                capsuleModel: capsuleStore.capsuleList[index],
              );
            },
            itemCount: capsuleStore.capsuleList.length,
          ),
        ),
        Visibility(
          visible: capsuleStore.capsuleLoadMoreState == StoreState.loading || capsuleStore.capsuleLoadMoreState == StoreState.initial,
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
