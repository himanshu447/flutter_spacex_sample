// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MissionStore on _MissionStore, Store {
  Computed<StoreState> _$missionStateComputed;

  @override
  StoreState get missionState =>
      (_$missionStateComputed ??= Computed<StoreState>(() => super.missionState,
              name: '_MissionStore.missionState'))
          .value;
  Computed<StoreState> _$missionLoadMoreStateComputed;

  @override
  StoreState get missionLoadMoreState => (_$missionLoadMoreStateComputed ??=
          Computed<StoreState>(() => super.missionLoadMoreState,
              name: '_MissionStore.missionLoadMoreState'))
      .value;

  final _$errorMessageAtom = Atom(name: '_MissionStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$_missionFutureAtom = Atom(name: '_MissionStore._missionFuture');

  @override
  ObservableFuture<List<MissionModel>> get _missionFuture {
    _$_missionFutureAtom.reportRead();
    return super._missionFuture;
  }

  @override
  set _missionFuture(ObservableFuture<List<MissionModel>> value) {
    _$_missionFutureAtom.reportWrite(value, super._missionFuture, () {
      super._missionFuture = value;
    });
  }

  final _$_missionLoadMoreFutureAtom =
      Atom(name: '_MissionStore._missionLoadMoreFuture');

  @override
  ObservableFuture<List<MissionModel>> get _missionLoadMoreFuture {
    _$_missionLoadMoreFutureAtom.reportRead();
    return super._missionLoadMoreFuture;
  }

  @override
  set _missionLoadMoreFuture(ObservableFuture<List<MissionModel>> value) {
    _$_missionLoadMoreFutureAtom
        .reportWrite(value, super._missionLoadMoreFuture, () {
      super._missionLoadMoreFuture = value;
    });
  }

  final _$missionListAtom = Atom(name: '_MissionStore.missionList');

  @override
  List<MissionModel> get missionList {
    _$missionListAtom.reportRead();
    return super.missionList;
  }

  @override
  set missionList(List<MissionModel> value) {
    _$missionListAtom.reportWrite(value, super.missionList, () {
      super.missionList = value;
    });
  }

  final _$fetchMissionAsyncAction = AsyncAction('_MissionStore.fetchMission');

  @override
  Future<dynamic> fetchMission({int offset = 0}) {
    return _$fetchMissionAsyncAction
        .run(() => super.fetchMission(offset: offset));
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
missionList: ${missionList},
missionState: ${missionState},
missionLoadMoreState: ${missionLoadMoreState}
    ''';
  }
}
