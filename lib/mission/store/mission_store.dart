import 'package:flutterspacexsample/mission/model/mission_model.dart';
import 'package:flutterspacexsample/mission/repository/mission_repository.dart';
import 'package:flutterspacexsample/utils/enum_utils.dart';
import 'package:mobx/mobx.dart';

part 'mission_store.g.dart';

class MissionStore extends _MissionStore with _$MissionStore {
  MissionStore({MissionRepository missionRepository})
      : super(
          missionRepository: missionRepository,
        );
}

abstract class _MissionStore with Store {
  final MissionRepository missionRepository;

  _MissionStore({this.missionRepository});

  @observable
  String errorMessage;

  @observable
  ObservableFuture<List<MissionModel>> _missionFuture;

  @observable
  ObservableFuture<List<MissionModel>> _missionLoadMoreFuture;

  @observable
  List<MissionModel> missionList;

  @computed
  StoreState get missionState {
    if (_missionFuture == null ||
        _missionFuture.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _missionFuture.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @computed
  StoreState get missionLoadMoreState {
    if (_missionLoadMoreFuture == null ||
        _missionLoadMoreFuture.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _missionLoadMoreFuture.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  Future fetchMission({int offset = 0}) async {
    try {
      errorMessage = null;
      if (missionList == null || missionList.isEmpty) {
        _missionFuture =
            ObservableFuture(missionRepository.fetchMissions(offset: offset));
        var newList = await _missionFuture;
        _missionLoadMoreFuture = ObservableFuture.value(null);
        missionList = newList;
      } else {
        _missionLoadMoreFuture =
            ObservableFuture(missionRepository.fetchMissions(offset: offset));
        var newList = await _missionLoadMoreFuture;
        missionList.addAll(newList);
      }
    } catch (e) {
      errorMessage = e.toString();
    }
  }
}
