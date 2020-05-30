import 'package:flutterspacexsample/utils/enum_utils.dart';
import 'package:intl/intl.dart';

import 'capsule_mission_model.dart';

class CapsuleModel {
	final String _capsule_serial;
	final String _capsule_id;
	final CapsuleStatus _status;
	final DateTime _original_launch;
	final List<Mission> _missions;
	final String _type;
	final String _details;
	final int _reuse_count;
	final int _landings;
	
	CapsuleModel({
		String capsule_serial,
		String capsule_id,
		CapsuleStatus status,
		DateTime original_launch,
		List<Mission> missions,
		String type,
		String details,
		int reuse_count,
		int landings,
	})  : _capsule_serial = capsule_serial,
				_capsule_id = capsule_id,
				_status = status,
				_original_launch = original_launch,
				_missions = missions,
				_type = type,
				_details = details,
				_reuse_count = reuse_count,
				_landings = landings;
	
	factory CapsuleModel.fromMap(Map<String, dynamic> map) {
		return CapsuleModel(
			capsule_serial:
			map['capsule_serial'] != null ? map['capsule_serial'] : null,
			capsule_id: map['capsule_id'] != null ? map['capsule_id'] : null,
			status: map['status'] != null
					? EnumUtil.fromStringEnum(CapsuleStatus.values, map['status'])
					: null,
			original_launch: map['original_launch'] != null
					? DateFormat('yyyy-MM-dd').parse(map['original_launch'])
					: null,
			type: map['type'] != null ? map['type'] : null,
			details: map['details'] != null ? map['details'] : null,
			reuse_count: map['reuse_count'] != null
					? (map['reuse_count'] as num).toInt()
					: null,
			landings:
			map['landings'] != null ? (map['landings'] as num).toInt() : null,
			missions: map['missions'] != null
					? (map['missions'] as List)
					.map((e) => Mission.fromMap(e as Map<String, dynamic>))
					.toList()
					: null,
		);
	}
	
	String get capsule_id => _capsule_id;
	
	int get landings => _landings;
	
	int get reuse_count => _reuse_count;
	
	String get details => _details;
	
	String get type => _type;
	
	List<Mission> get missions => _missions;
	
	DateTime get original_launch => _original_launch;
	
	CapsuleStatus get status => _status;
	
	String get capsule_serial => _capsule_serial;
	
}