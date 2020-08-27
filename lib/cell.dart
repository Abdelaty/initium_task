import 'dart:convert';

import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  final String thumbnailUrl;
  final String title;
  final clicker;

  @required
  const Cell({@required this.title, @required this.thumbnailUrl, this.clicker});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Padding(
          padding:
              new EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0, top: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkResponse(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Image.memory(base64Decode(thumbnailUrl),
                      width: 70.0,
                      height: 70.0,
                      alignment: Alignment.center,
                      fit: BoxFit.fill),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 15.0,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
