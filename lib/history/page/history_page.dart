import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterspacexsample/components/progress_component.dart';
import 'package:flutterspacexsample/components/text_component.dart';
import 'package:flutterspacexsample/history/repository/history_repository.dart';
import 'package:flutterspacexsample/history/store/history_store.dart';
import 'package:flutterspacexsample/history/widget/history_item.dart';
import 'package:flutterspacexsample/utils/enum_utils.dart';
import 'package:mobx/mobx.dart';

class HistoryView extends StatefulWidget {
  @override
  _HistoryViewState createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  HistoryStore historyStore;
  ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    historyStore = HistoryStore(historyRepository: HistoryRepository());
    historyStore.fetchHistory();
    scrollController = ScrollController()..addListener(_scrollerListener);

    reaction((_) => historyStore.errorMessage, (msg) {
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
      historyStore.fetchHistory(offset: 5);
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
          switch (historyStore.historyState) {
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
              return HistoryItem(
                historyModel: historyStore.historyList[index],
              );
            },
            itemCount: historyStore.historyList.length,
          ),
        ),
        Visibility(
          visible: historyStore.historyLoadMoreState == StoreState.loading ||
              historyStore.historyLoadMoreState == StoreState.initial,
          child: ProgressComponent(),
        )
      ],
    );
  }
}
