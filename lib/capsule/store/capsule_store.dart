import 'package:flutterspacexsample/capsule/model/capsule_model.dart';
import 'package:flutterspacexsample/capsule/repository/capsule_repository.dart';
import 'package:flutterspacexsample/utils/enum_utils.dart';
import 'package:mobx/mobx.dart';

part 'capsule_store.g.dart';

class CapsuleStore extends _CapsuleStore with _$CapsuleStore {
  CapsuleStore({
    CapsuleRepository capsuleRepository,
  }) : super(
          capsuleRepository: capsuleRepository,
        );
}

abstract class _CapsuleStore with Store {
  final CapsuleRepository capsuleRepository;

  _CapsuleStore({this.capsuleRepository});

  @observable
  String errorMessage;

  @observable
  ObservableFuture<List<CapsuleModel>> _capsuleFuture;

  @observable
  ObservableFuture<List<CapsuleModel>> _capsuleLoadMoreFuture;

  @observable
  List<CapsuleModel> capsuleList;

  @computed
  StoreState get capsuleState {
    if (_capsuleFuture == null ||
        _capsuleFuture.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _capsuleFuture.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @computed
  StoreState get capsuleLoadMoreState {
    if (_capsuleLoadMoreFuture == null ||
        _capsuleLoadMoreFuture.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _capsuleLoadMoreFuture.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  Future fetchCapsules({int offset = 0}) async {
    try {
      errorMessage = null;
      if(capsuleList == null || capsuleList.isEmpty){
        _capsuleFuture = ObservableFuture(capsuleRepository.fetchCapsules(offset: offset));
        var newList = await _capsuleFuture;
        _capsuleLoadMoreFuture = ObservableFuture.value(null);
        capsuleList = newList;
      }else{
        _capsuleLoadMoreFuture = ObservableFuture(capsuleRepository.fetchCapsules(offset: offset));
        var newList = await _capsuleLoadMoreFuture;
        capsuleList.addAll(newList);
      }
    } catch (e) {}
  }
}
