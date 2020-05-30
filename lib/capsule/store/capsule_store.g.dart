// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capsule_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CapsuleStore on _CapsuleStore, Store {
  Computed<StoreState> _$capsuleStateComputed;

  @override
  StoreState get capsuleState =>
      (_$capsuleStateComputed ??= Computed<StoreState>(() => super.capsuleState,
              name: '_CapsuleStore.capsuleState'))
          .value;
  Computed<StoreState> _$capsuleLoadMoreStateComputed;

  @override
  StoreState get capsuleLoadMoreState => (_$capsuleLoadMoreStateComputed ??=
          Computed<StoreState>(() => super.capsuleLoadMoreState,
              name: '_CapsuleStore.capsuleLoadMoreState'))
      .value;

  final _$errorMessageAtom = Atom(name: '_CapsuleStore.errorMessage');

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

  final _$_capsuleFutureAtom = Atom(name: '_CapsuleStore._capsuleFuture');

  @override
  ObservableFuture<List<CapsuleModel>> get _capsuleFuture {
    _$_capsuleFutureAtom.reportRead();
    return super._capsuleFuture;
  }

  @override
  set _capsuleFuture(ObservableFuture<List<CapsuleModel>> value) {
    _$_capsuleFutureAtom.reportWrite(value, super._capsuleFuture, () {
      super._capsuleFuture = value;
    });
  }

  final _$_capsuleLoadMoreFutureAtom =
      Atom(name: '_CapsuleStore._capsuleLoadMoreFuture');

  @override
  ObservableFuture<List<CapsuleModel>> get _capsuleLoadMoreFuture {
    _$_capsuleLoadMoreFutureAtom.reportRead();
    return super._capsuleLoadMoreFuture;
  }

  @override
  set _capsuleLoadMoreFuture(ObservableFuture<List<CapsuleModel>> value) {
    _$_capsuleLoadMoreFutureAtom
        .reportWrite(value, super._capsuleLoadMoreFuture, () {
      super._capsuleLoadMoreFuture = value;
    });
  }

  final _$capsuleListAtom = Atom(name: '_CapsuleStore.capsuleList');

  @override
  List<CapsuleModel> get capsuleList {
    _$capsuleListAtom.reportRead();
    return super.capsuleList;
  }

  @override
  set capsuleList(List<CapsuleModel> value) {
    _$capsuleListAtom.reportWrite(value, super.capsuleList, () {
      super.capsuleList = value;
    });
  }

  final _$fetchCapsulesAsyncAction = AsyncAction('_CapsuleStore.fetchCapsules');

  @override
  Future<dynamic> fetchCapsules({int offset = 0}) {
    return _$fetchCapsulesAsyncAction
        .run(() => super.fetchCapsules(offset: offset));
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
capsuleList: ${capsuleList},
capsuleState: ${capsuleState},
capsuleLoadMoreState: ${capsuleLoadMoreState}
    ''';
  }
}
