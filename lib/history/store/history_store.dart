
import 'package:flutterspacexsample/history/model/history_model.dart';
import 'package:flutterspacexsample/history/repository/history_repository.dart';
import 'package:flutterspacexsample/utils/enum_utils.dart';
import 'package:mobx/mobx.dart';

part 'history_store.g.dart';

class HistoryStore extends _HistoryStore with _$HistoryStore {
	HistoryStore({
		HistoryRepository historyRepository,
	}) : super(
		historyRepository: historyRepository,
	);
}

abstract class _HistoryStore with Store{
	
	final HistoryRepository historyRepository;
	
	_HistoryStore({this.historyRepository});
	
	@observable
	String errorMessage;
	
	@observable
	ObservableFuture<List<HistoryModel>> _historyFuture;
	
	@observable
	ObservableFuture<List<HistoryModel>> _historyLoadMoreFuture;
	
	@observable
	List<HistoryModel> historyList;
	
	
	@computed
	StoreState get historyState {
		if (_historyFuture == null ||
				_historyFuture.status == FutureStatus.rejected) {
			return StoreState.initial;
		}
		return _historyFuture.status == FutureStatus.pending
				? StoreState.loading
				: StoreState.loaded;
	}
	
	@computed
	StoreState get historyLoadMoreState {
		if (_historyLoadMoreFuture == null ||
				_historyLoadMoreFuture.status == FutureStatus.rejected) {
			return StoreState.initial;
		}
		return _historyLoadMoreFuture.status == FutureStatus.pending
				? StoreState.loading
				: StoreState.loaded;
	}
	
	@action
	Future fetchHistory({int offset = 0}) async {
		try {
			errorMessage = null;
			if(historyList == null || historyList.isEmpty){
				_historyFuture = ObservableFuture(historyRepository.fetchHistory(offset: offset));
				var newList = await _historyFuture;
				_historyLoadMoreFuture = ObservableFuture.value(null);
				historyList = newList;
			}else{
				_historyLoadMoreFuture = ObservableFuture(historyRepository.fetchHistory(offset: offset));
				var newList = await _historyLoadMoreFuture;
				historyList.addAll(newList);
			}
		} catch (e) {
			errorMessage = e.toString();
		}
	}
}
