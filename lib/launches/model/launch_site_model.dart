class LaunchSite {
	final String _site_id;
	final String _site_name;
	final String _site_name_long;
	
	LaunchSite({
		final String site_id,
		final String site_name,
		final String site_name_long,
	})  : _site_id = site_id,
				_site_name = site_name,
				_site_name_long = site_name_long;
	
	factory LaunchSite.fromMap(Map<String, dynamic> map) {
		return LaunchSite(
			site_id: map['site_id'] != null ? map['site_id'] : null,
			site_name: map['site_name'] != null ? map['site_name'] : null,
			site_name_long:
			map['site_name_long'] != null ? map['site_name_long'] : null,
		);
		
		
	}
	
	String get site_name_long => _site_name_long;
	
	String get site_name => _site_name;
	
	String get site_id => _site_id;
}