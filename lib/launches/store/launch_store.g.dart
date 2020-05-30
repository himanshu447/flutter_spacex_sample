// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LaunchStore on _LaunchStore, Store {
  Computed<StoreState> _$upComingLaunchStateComputed;

  @override
  StoreState get upComingLaunchState => (_$upComingLaunchStateComputed ??=
          Computed<StoreState>(() => super.upComingLaunchState,
              name: '_LaunchStore.upComingLaunchState'))
      .value;
  Computed<StoreState> _$upComingLaunchLoadMoreStateComputed;

  @override
  StoreState get upComingLaunchLoadMoreState =>
      (_$upComingLaunchLoadMoreStateComputed ??= Computed<StoreState>(
              () => super.upComingLaunchLoadMoreState,
              name: '_LaunchStore.upComingLaunchLoadMoreState'))
          .value;
  Computed<StoreState> _$pastLaunchStateComputed;

  @override
  StoreState get pastLaunchState => (_$pastLaunchStateComputed ??=
          Computed<StoreState>(() => super.pastLaunchState,
              name: '_LaunchStore.pastLaunchState'))
      .value;
  Computed<StoreState> _$pastLaunchLoadMoreStateComputed;

  @override
  StoreState get pastLaunchLoadMoreState =>
      (_$pastLaunchLoadMoreStateComputed ??= Computed<StoreState>(
              () => super.pastLaunchLoadMoreState,
              name: '_LaunchStore.pastLaunchLoadMoreState'))
          .value;
  Computed<StoreState> _$latestLaunchStateComputed;

  @override
  StoreState get latestLaunchState => (_$latestLaunchStateComputed ??=
          Computed<StoreState>(() => super.latestLaunchState,
              name: '_LaunchStore.latestLaunchState'))
      .value;

  final _$errorMessageAtom = Atom(name: '_LaunchStore.errorMessage');

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

  final _$_upComingLaunchFutureAtom =
      Atom(name: '_LaunchStore._upComingLaunchFuture');

  @override
  ObservableFuture<List<LaunchModel>> get _upComingLaunchFuture {
    _$_upComingLaunchFutureAtom.reportRead();
    return super._upComingLaunchFuture;
  }

  @override
  set _upComingLaunchFuture(ObservableFuture<List<LaunchModel>> value) {
    _$_upComingLaunchFutureAtom.reportWrite(value, super._upComingLaunchFuture,
        () {
      super._upComingLaunchFuture = value;
    });
  }

  final _$_upComingLaunchLoadMoreFutureAtom =
      Atom(name: '_LaunchStore._upComingLaunchLoadMoreFuture');

  @override
  ObservableFuture<List<LaunchModel>> get _upComingLaunchLoadMoreFuture {
    _$_upComingLaunchLoadMoreFutureAtom.reportRead();
    return super._upComingLaunchLoadMoreFuture;
  }

  @override
  set _upComingLaunchLoadMoreFuture(ObservableFuture<List<LaunchModel>> value) {
    _$_upComingLaunchLoadMoreFutureAtom
        .reportWrite(value, super._upComingLaunchLoadMoreFuture, () {
      super._upComingLaunchLoadMoreFuture = value;
    });
  }

  final _$upComingLaunchListAtom =
      Atom(name: '_LaunchStore.upComingLaunchList');

  @override
  List<LaunchModel> get upComingLaunchList {
    _$upComingLaunchListAtom.reportRead();
    return super.upComingLaunchList;
  }

  @override
  set upComingLaunchList(List<LaunchModel> value) {
    _$upComingLaunchListAtom.reportWrite(value, super.upComingLaunchList, () {
      super.upComingLaunchList = value;
    });
  }

  final _$_pastLaunchFutureAtom = Atom(name: '_LaunchStore._pastLaunchFuture');

  @override
  ObservableFuture<List<LaunchModel>> get _pastLaunchFuture {
    _$_pastLaunchFutureAtom.reportRead();
    return super._pastLaunchFuture;
  }

  @override
  set _pastLaunchFuture(ObservableFuture<List<LaunchModel>> value) {
    _$_pastLaunchFutureAtom.reportWrite(value, super._pastLaunchFuture, () {
      super._pastLaunchFuture = value;
    });
  }

  final _$_pastLaunchLoadMoreFutureAtom =
      Atom(name: '_LaunchStore._pastLaunchLoadMoreFuture');

  @override
  ObservableFuture<List<LaunchModel>> get _pastLaunchLoadMoreFuture {
    _$_pastLaunchLoadMoreFutureAtom.reportRead();
    return super._pastLaunchLoadMoreFuture;
  }

  @override
  set _pastLaunchLoadMoreFuture(ObservableFuture<List<LaunchModel>> value) {
    _$_pastLaunchLoadMoreFutureAtom
        .reportWrite(value, super._pastLaunchLoadMoreFuture, () {
      super._pastLaunchLoadMoreFuture = value;
    });
  }

  final _$pastLaunchListAtom = Atom(name: '_LaunchStore.pastLaunchList');

  @override
  List<LaunchModel> get pastLaunchList {
    _$pastLaunchListAtom.reportRead();
    return super.pastLaunchList;
  }

  @override
  set pastLaunchList(List<LaunchModel> value) {
    _$pastLaunchListAtom.reportWrite(value, super.pastLaunchList, () {
      super.pastLaunchList = value;
    });
  }

  final _$_latestLaunchFutureAtom =
      Atom(name: '_LaunchStore._latestLaunchFuture');

  @override
  ObservableFuture<LaunchModel> get _latestLaunchFuture {
    _$_latestLaunchFutureAtom.reportRead();
    return super._latestLaunchFuture;
  }

  @override
  set _latestLaunchFuture(ObservableFuture<LaunchModel> value) {
    _$_latestLaunchFutureAtom.reportWrite(value, super._latestLaunchFuture, () {
      super._latestLaunchFuture = value;
    });
  }

  final _$latestLaunchAtom = Atom(name: '_LaunchStore.latestLaunch');

  @override
  LaunchModel get latestLaunch {
    _$latestLaunchAtom.reportRead();
    return super.latestLaunch;
  }

  @override
  set latestLaunch(LaunchModel value) {
    _$latestLaunchAtom.reportWrite(value, super.latestLaunch, () {
      super.latestLaunch = value;
    });
  }

  final _$fetchUpComingLaunchAsyncAction =
      AsyncAction('_LaunchStore.fetchUpComingLaunch');

  @override
  Future<dynamic> fetchUpComingLaunch({int offset = 0}) {
    return _$fetchUpComingLaunchAsyncAction
        .run(() => super.fetchUpComingLaunch(offset: offset));
  }

  final _$fetchPastLaunchAsyncAction =
      AsyncAction('_LaunchStore.fetchPastLaunch');

  @override
  Future<dynamic> fetchPastLaunch({int offset = 0}) {
    return _$fetchPastLaunchAsyncAction
        .run(() => super.fetchPastLaunch(offset: offset));
  }

  final _$fetchLatestLaunchAsyncAction =
      AsyncAction('_LaunchStore.fetchLatestLaunch');

  @override
  Future<dynamic> fetchLatestLaunch() {
    return _$fetchLatestLaunchAsyncAction.run(() => super.fetchLatestLaunch());
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
upComingLaunchList: ${upComingLaunchList},
pastLaunchList: ${pastLaunchList},
latestLaunch: ${latestLaunch},
upComingLaunchState: ${upComingLaunchState},
upComingLaunchLoadMoreState: ${upComingLaunchLoadMoreState},
pastLaunchState: ${pastLaunchState},
pastLaunchLoadMoreState: ${pastLaunchLoadMoreState},
latestLaunchState: ${latestLaunchState}
    ''';
  }
}
