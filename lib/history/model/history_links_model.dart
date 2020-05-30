class HistoryLinks {
	final String _reddit;
	final String _article;
	final String _wikipedia;
	
	HistoryLinks({
		String reddit,
		String article,
		String wikipedia,
	})  : _reddit = reddit,
				_article = article,
				_wikipedia = wikipedia;
	
	factory HistoryLinks.fromMap(Map<String,dynamic> map){
		return HistoryLinks(
			reddit: map['reddit'] != null ? map['reddit'] : null,
			article: map['article'] != null ? map['article'] : null,
			wikipedia: map['wikipedia'] != null ? map['wikipedia'] : null,
		);
	}
	
	String get wikipedia => _wikipedia;
	
	String get article => _article;
	
	String get reddit => _reddit;
	
	
}