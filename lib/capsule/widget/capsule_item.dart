import 'package:flutter/material.dart';
import 'package:flutterspacexsample/capsule/model/capsule_model.dart';
import 'package:flutterspacexsample/components/text_component.dart';
import 'package:flutterspacexsample/utils/enum_utils.dart';
import 'package:intl/intl.dart';

class CapsuleItem extends StatelessWidget {
  final CapsuleModel capsuleModel;

  CapsuleItem({@required this.capsuleModel});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextComponent(
                  title: 'Serial No :- ${capsuleModel.capsule_serial}',
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  fontSize: 14,
                  color: Colors.grey,
                  textAlign: TextAlign.center,
                  alignment: Alignment.center,
                ),
                Container(
                  width: 70,
                  margin: EdgeInsets.only(right: 12),
                  padding: EdgeInsets.symmetric(vertical: 2),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextComponent(
                    color: Colors.blue,
                    title: EnumUtil.toStringEnum(capsuleModel.status),
                    fontSize: 14,
                    textAlign: TextAlign.center,
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey.shade400,
              thickness: 2,
            ),
            TextComponent(
              title: 'No of mission ${capsuleModel.missions.length}',
              margin: EdgeInsets.symmetric(vertical: 6),
              fontSize: 14,
            ),
            capsuleModel.original_launch != null
                ? Divider(
                    color: Colors.grey.shade400,
                    thickness: 2,
                  )
                : Container(),
            capsuleModel.original_launch != null
                ? TextComponent(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    title:
                        'Date ${DateFormat('yyy-MMM-dd').format(capsuleModel.original_launch)}',
                    fontSize: 14,
                  )
                : Container()
          ],
        ),
      ),
    );
    ;
  }
}
