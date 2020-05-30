import 'package:flutter/material.dart';
import 'package:flutterspacexsample/components/text_component.dart';
import 'package:flutterspacexsample/launches/model/launch_model.dart';
import 'package:intl/intl.dart';

class LaunchItem extends StatelessWidget {
  final LaunchModel launchModel;

  LaunchItem({this.launchModel});

  @override
  Widget build(BuildContext context) {
	  return Card(
		  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
		  margin: EdgeInsets.symmetric(vertical: 10),
		  child: Padding(
			  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
			  child: Column(
				  crossAxisAlignment: CrossAxisAlignment.center,
				  mainAxisAlignment: MainAxisAlignment.center,
				  children: <Widget>[
					  TextComponent(
						  title: 'Flight No :- ${launchModel.flight_number}',
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
												  title: '${launchModel.launch_date_utc.day}',
												  fontSize: 22,
												  color: Colors.blue,
												  fontWeight: FontWeight.w600,
												  height: 0.9),
										  TextComponent(
												  title: DateFormat('MMM').format(launchModel.launch_date_utc),
												  fontSize: 14,
												  color: Colors.blue,
												  fontWeight: FontWeight.w500,
												  height: 0.9),
										  TextComponent(
											  title: DateFormat('yy').format(launchModel.launch_date_utc),
											  fontSize: 10,
											  color: Colors.grey,
											  fontWeight: FontWeight.w500,
										  ),
									  ],
								  ),
							  ),
							  Flexible(
							    child: TextComponent(
								  title: 'mission Name ${launchModel.mission_name}',
								  margin: EdgeInsets.symmetric(vertical: 6),
								  fontSize: 14,
							    ),
							  ),
						  ],
					  ),
				  ],
			  ),
		  ),
	  );
	
  }
}
