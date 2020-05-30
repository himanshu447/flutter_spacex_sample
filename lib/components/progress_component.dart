import 'package:flutter/material.dart';

class ProgressComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
	    color: Colors.transparent,
	    child: Center(
		    child: CircularProgressIndicator(),
	    ),
    );
  }
}
