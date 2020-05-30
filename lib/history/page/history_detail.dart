import 'package:flutter/material.dart';
import 'package:flutterspacexsample/components/text_component.dart';
import 'package:flutterspacexsample/history/model/history_model.dart';
import 'package:flutterspacexsample/utils/route_name_utils.dart';

class HistoryDetailView extends StatefulWidget {
  final HistoryModel historyModel;

  HistoryDetailView({this.historyModel});

  @override
  _HistoryDetailViewState createState() => _HistoryDetailViewState();
}

class _HistoryDetailViewState extends State<HistoryDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextComponent(
                title: 'Id :- ${widget.historyModel.id}',
                margin: EdgeInsets.symmetric(horizontal: 12),
                fontSize: 14,
                color: Colors.grey,
                textAlign: TextAlign.center,
                alignment: Alignment.center,
              ),
              Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              SizedBox(
                height: 12,
              ),
              TextComponent(
                title: '${widget.historyModel.details}',
                margin: EdgeInsets.symmetric(horizontal: 12),
                fontSize: 14,
                color: Colors.grey,
                textAlign: TextAlign.center,
                alignment: Alignment.center,
              ),
              Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              SizedBox(
                height: 12,
              ),
              TextComponent(
                title: 'Links',
                margin: EdgeInsets.symmetric(horizontal: 12),
                fontSize: 16,
                color: Colors.grey,
                textAlign: TextAlign.center,
                alignment: Alignment.center,
              ),
              Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              widget.historyModel.links.reddit != null
                  ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                child: Column(
                  children: <Widget>[
                    TextComponent(title: 'Reddit',),
                    GestureDetector(
                      onTap: ()=>Navigator.pushNamed(context, RouteName.webView,arguments: widget.historyModel.links.reddit),
                      child: TextComponent(
                        title: widget.historyModel.links.reddit,
                        color: Colors.blue,
                        textDecoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
              )
                  : Container(),
  
              widget.historyModel.links.wikipedia != null
                  ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                child: Column(
                  children: <Widget>[
                    TextComponent(title: 'Wikipedia',),
                    GestureDetector(
                      onTap: ()=>Navigator.pushNamed(context, RouteName.webView,arguments: widget.historyModel.links.wikipedia),
                      child: TextComponent(
                        title: widget.historyModel.links.wikipedia,
                        color: Colors.blue,
                        textDecoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
              )
                  : Container(),
              
              widget.historyModel.links.article != null
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                      child: Column(
	                      children: <Widget>[
	                      	TextComponent(title: 'Article',),
		                      GestureDetector(
                            onTap: ()=>Navigator.pushNamed(context, RouteName.webView,arguments: widget.historyModel.links.article),
                            child: TextComponent(
                              title: widget.historyModel.links.article,
                              color: Colors.blue,
                              textDecoration: TextDecoration.underline,
                            ),
                          )
	                      ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
