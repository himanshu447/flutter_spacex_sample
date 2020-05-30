// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HistoryStore on _HistoryStore, Store {
  Computed<StoreState> _$historyStateComputed;

  @override
  StoreState get historyState =>
      (_$historyStateComputed ??= Computed<StoreState>(() => super.historyState,
              name: '_HistoryStore.historyState'))
          .value;
  Computed<StoreState> _$historyLoadMoreStateComputed;

  @override
  StoreState get historyLoadMoreState => (_$historyLoadMoreStateComputed ??=
          Computed<StoreState>(() => super.historyLoadMoreState,
              name: '_HistoryStore.historyLoadMoreState'))
      .value;

  final _$errorMessageAtom = Atom(name: '_HistoryStore.errorMessage');

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

  final _$_historyFutureAtom = Atom(name: '_HistoryStore._historyFuture');

  @override
  ObservableFuture<List<HistoryModel>> get _historyFuture {
    _$_historyFutureAtom.reportRead();
    return super._historyFuture;
  }

  @override
  set _historyFuture(ObservableFuture<List<HistoryModel>> value) {
    _$_historyFutureAtom.reportWrite(value, super._historyFuture, () {
      super._historyFuture = value;
    });
  }

  final _$_historyLoadMoreFutureAtom =
      Atom(name: '_HistoryStore._historyLoadMoreFuture');

  @override
  ObservableFuture<List<HistoryModel>> get _historyLoadMoreFuture {
    _$_historyLoadMoreFutureAtom.reportRead();
    return super._historyLoadMoreFuture;
  }

  @override
  set _historyLoadMoreFuture(ObservableFuture<List<HistoryModel>> value) {
    _$_historyLoadMoreFutureAtom
        .reportWrite(value, super._historyLoadMoreFuture, () {
      super._historyLoadMoreFuture = value;
    });
  }

  final _$historyListAtom = Atom(name: '_HistoryStore.historyList');

  @override
  List<HistoryModel> get historyList {
    _$historyListAtom.reportRead();
    return super.historyList;
  }

  @override
  set historyList(List<HistoryModel> value) {
    _$historyListAtom.reportWrite(value, super.historyList, () {
      super.historyList = value;
    });
  }

  final _$fetchHistoryAsyncAction = AsyncAction('_HistoryStore.fetchHistory');

  @override
  Future<dynamic> fetchHistory({int offset = 0}) {
    return _$fetchHistoryAsyncAction
        .run(() => super.fetchHistory(offset: offset));
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
historyList: ${historyList},
historyState: ${historyState},
historyLoadMoreState: ${historyLoadMoreState}
    ''';
  }
}
