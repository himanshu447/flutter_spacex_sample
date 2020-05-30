import 'package:flutterspacexsample/launches/model/launch_model.dart';
import 'package:flutterspacexsample/launches/repository/launch_repository.dart';
import 'package:flutterspacexsample/utils/enum_utils.dart';
import 'package:mobx/mobx.dart';

part 'launch_store.g.dart';

class LaunchStore extends _LaunchStore with _$LaunchStore {
	LaunchStore({
		LaunchRepository launchRepository,
	}) : super(
		launchRepository: launchRepository,
	);
}

abstract class _LaunchStore with Store {
	final  LaunchRepository launchRepository;
	
	_LaunchStore({this.launchRepository});
	
	@observable
	String errorMessage;
	
	@observable
	ObservableFuture<List<LaunchModel>> _upComingLaunchFuture;
	
	@observable
	ObservableFuture<List<LaunchModel>> _upComingLaunchLoadMoreFuture;
	
	@observable
	List<LaunchModel> upComingLaunchList;
	
	@computed
	StoreState get upComingLaunchState {
		if (_upComingLaunchFuture == null ||
				_upComingLaunchFuture.status == FutureStatus.rejected) {
			return StoreState.initial;
		}
		return _upComingLaunchFuture.status == FutureStatus.pending
				? StoreState.loading
				: StoreState.loaded;
	}
	
	@computed
	StoreState get upComingLaunchLoadMoreState {
		if (_upComingLaunchLoadMoreFuture == null ||
				_upComingLaunchLoadMoreFuture.status == FutureStatus.rejected) {
			return StoreState.initial;
		}
		return _upComingLaunchLoadMoreFuture.status == FutureStatus.pending
				? StoreState.loading
				: StoreState.loaded;
	}
	
	
	@observable
	ObservableFuture<List<LaunchModel>> _pastLaunchFuture;
	
	@observable
	ObservableFuture<List<LaunchModel>> _pastLaunchLoadMoreFuture;
	
	@observable
	List<LaunchModel> pastLaunchList;
	
	@computed
	StoreState get pastLaunchState {
		if (_pastLaunchFuture == null ||
				_pastLaunchFuture.status == FutureStatus.rejected) {
			return StoreState.initial;
		}
		return _pastLaunchFuture.status == FutureStatus.pending
				? StoreState.loading
				: StoreState.loaded;
	}
	
	@computed
	StoreState get pastLaunchLoadMoreState {
		if (_pastLaunchLoadMoreFuture == null ||
				_pastLaunchLoadMoreFuture.status == FutureStatus.rejected) {
			return StoreState.initial;
		}
		return _pastLaunchLoadMoreFuture.status == FutureStatus.pending
				? StoreState.loading
				: StoreState.loaded;
	}
	
	@observable
	ObservableFuture<LaunchModel> _latestLaunchFuture;
	
	@observable
	LaunchModel latestLaunch;
	
	@computed
	StoreState get latestLaunchState {
		if (_latestLaunchFuture == null ||
				_latestLaunchFuture.status == FutureStatus.rejected) {
			return StoreState.initial;
		}
		return _latestLaunchFuture.status == FutureStatus.pending
				? StoreState.loading
				: StoreState.loaded;
	}
	
	
	@action
	Future fetchUpComingLaunch({int offset = 0}) async {
		try {
			errorMessage = null;
			if(upComingLaunchList == null || upComingLaunchList.isEmpty){
				_upComingLaunchFuture = ObservableFuture(launchRepository.fetchUpcomingLaunch(offset: offset));
				var newList = await _upComingLaunchFuture;
				_upComingLaunchLoadMoreFuture = ObservableFuture.value(null);
				upComingLaunchList = newList;
			}else{
				_upComingLaunchLoadMoreFuture = ObservableFuture(launchRepository.fetchUpcomingLaunch(offset: offset));
				var newList = await _upComingLaunchLoadMoreFuture;
				upComingLaunchList.addAll(newList);
			}
		} catch (e) {
			errorMessage = e.toString();
		}
	}
	
	@action
	Future fetchPastLaunch({int offset = 0}) async {
		try {
			errorMessage = null;
			if(pastLaunchList == null || pastLaunchList.isEmpty){
				_pastLaunchFuture = ObservableFuture(launchRepository.fetchPastLaunch(offset: offset));
				var newList = await _pastLaunchFuture;
				_pastLaunchLoadMoreFuture = ObservableFuture.value(null);
				pastLaunchList = newList;
			}else{
				_pastLaunchLoadMoreFuture = ObservableFuture(launchRepository.fetchPastLaunch(offset: offset));
				var newList = await _pastLaunchLoadMoreFuture;
				pastLaunchList.addAll(newList);
			}
		} catch (e) {
			errorMessage = e.toString();
		}
	}
	
	@action
	Future fetchLatestLaunch() async {
		try {
			errorMessage = null;
			_latestLaunchFuture = ObservableFuture(launchRepository.fetchLatestLaunch());
			latestLaunch = await _latestLaunchFuture;
		} catch (e) {
			errorMessage = e.toString();
		}
	}
	
	
}
