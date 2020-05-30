import 'package:flutter/material.dart';
import 'package:flutterspacexsample/components/text_component.dart';
import 'package:flutterspacexsample/history/model/history_model.dart';
import 'package:flutterspacexsample/utils/route_name_utils.dart';
import 'package:intl/intl.dart';

class HistoryItem extends StatelessWidget {
	
	final HistoryModel historyModel;
	
	HistoryItem({this.historyModel});
	
  @override
  Widget build(BuildContext context) {
	  return Card(
		  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
		  margin: EdgeInsets.symmetric(vertical: 10),
		  child: Padding(
			  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
			  child: GestureDetector(
				  onTap: ()=> Navigator.pushNamed(context, RouteName.history_detail,arguments: historyModel),
			    child: Column(
				  crossAxisAlignment: CrossAxisAlignment.center,
				  mainAxisAlignment: MainAxisAlignment.center,
				  children: <Widget>[
					  TextComponent(
						  title: 'Id :- ${historyModel.id}',
						  margin: EdgeInsets.symmetric(horizontal: 12),
						  fontSize: 14,
						  color: Colors.grey,
						  textAlign: TextAlign.center,
						  alignment: Alignment.center,
					  ),
					  Divider(
						  color: Colors.grey.shade400,
						  thickness: 2,
					  ),
					  Row(
						  crossAxisAlignment: CrossAxisAlignment.center,
						  children: <Widget>[
							  Container(
								  margin: EdgeInsets.only(right: 12, bottom: 12, top: 12),
								  padding:
								  EdgeInsets.only(left: 11, right: 11, top: 5, bottom: 4),
								  decoration: BoxDecoration(
										  borderRadius: BorderRadius.circular(15),
										  border: Border.all(color: Colors.black38)),
								  child: Column(
									  children: <Widget>[
										  TextComponent(
												  title: '${historyModel.event_date_utc.day}',
												  fontSize: 22,
												  color: Colors.blue,
												  fontWeight: FontWeight.w600,
												  height: 0.9),
										  TextComponent(
												  title: DateFormat('MMM').format(historyModel.event_date_utc),
												  fontSize: 14,
												  color: Colors.blue,
												  fontWeight: FontWeight.w500,
												  height: 0.9),
										  TextComponent(
											  title: DateFormat('yy').format(historyModel.event_date_utc),
											  fontSize: 10,
											  color: Colors.grey,
											  fontWeight: FontWeight.w500,
										  ),
									  ],
								  ),
							  ),
							  SizedBox(width: 18,),
							  historyModel.flight_number != null ? Flexible(
								  child: TextComponent(
									  title: 'Flight No:- ${historyModel.flight_number}',
									  margin: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
									  fontSize: 14,
								  ),
							  ): Container(),
						  ],
					  ),
				  ],
			    ),
			  ),
		  ),
	  );
  }
}
