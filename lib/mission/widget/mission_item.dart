import 'package:flutter/material.dart';
import 'package:flutterspacexsample/components/text_component.dart';
import 'package:flutterspacexsample/mission/model/mission_model.dart';

class MissionItem extends StatelessWidget {
  final MissionModel missionModel;

  MissionItem({this.missionModel});

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
						  title: 'id :- ${missionModel.mission_id}',
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
					  TextComponent(
						  title: 'Name :-  ${missionModel.mission_name}',
						  margin: EdgeInsets.symmetric(vertical: 6),
						  fontSize: 14,
					  ),
					  missionModel.payload_ids != null || missionModel.payload_ids.isNotEmpty
							  ? TextComponent(
						  title: 'No of Payloads -: ${missionModel.payload_ids.length}',
						  fontSize: 12,
						  margin: EdgeInsets.symmetric(vertical: 6),
					  )
							  : Container(),
				  ],
			  ),
		  ),
	  );
  }
}
