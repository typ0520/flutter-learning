import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String showResult = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              fetchPost().then((model) {
                setState(() {
                  showResult =
                      'result: \n icon: ${model.icon}\n hideAppBar: ${model.hideAppBar}';
                });
              }, onError: (e) {});
            },
            child: Text('点我'),
          ),
          Text(showResult)
        ],
      ),
    );
  }

  Future<CommonModel> fetchPost() async {
    final response = await post(
        'http://www.devio.org/io/flutter_app/json/test_common_model.json');
    final result = json.decode(Utf8Decoder().convert(response.bodyBytes));
    return CommonModel.fromJSON(result);
  }
}

class CommonModel {
  final String icon;
  final bool hideAppBar;

  CommonModel({this.icon, this.hideAppBar});

  factory CommonModel.fromJSON(Map<String, dynamic> json) {
    return CommonModel(icon: json['icon'], hideAppBar: json['hideAppBar']);
  }
}

