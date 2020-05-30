import 'package:intl/intl.dart';

import 'history_links_model.dart';

class History {
	final int _id;
	final String _title;
	final DateTime _event_date_utc;
	final int _event_date_unix;
	final int _flight_number;
	final String _details;
	final HistoryLinks _links;
	
	History({
		int id,
		String title,
		DateTime event_date_utc,
		int event_date_unix,
		int flight_number,
		String details,
		HistoryLinks links,
	})  : _id = id,
				_title = title,
				_event_date_utc = event_date_utc,
				_event_date_unix = event_date_unix,
				_flight_number = flight_number,
				_details = details,
				_links = links;
	
	factory History.fromMap(Map<String, dynamic> map) {
		return History(
			id: map['id'] != null ? (map['id'] as num).toInt(): null,
			title: map['title'] != null ? map['title'] : null,
			flight_number: map['flight_number'] != null ? (map['flight_number'] as num).toInt(): null,
			event_date_unix: map['event_date_unix'] != null ? (map['event_date_unix'] as num).toInt(): null,
			details: map['details'] != null ? map['details'] : null,
			event_date_utc: map['event_date_utc'] != null
					? DateFormat('yyyy-MM-dd').parse(map['event_date_utc'])
					: null,
			links: map['links'] != null ? HistoryLinks.fromMap(map['links']) : null,
		);
	}
	
	HistoryLinks get links => _links;
	
	String get details => _details;
	
	int get flight_number => _flight_number;
	
	int get event_date_unix => _event_date_unix;
	
	DateTime get event_date_utc => _event_date_utc;
	
	String get title => _title;
	
	int get id => _id;
	
}