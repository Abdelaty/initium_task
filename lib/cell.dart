import 'package:flutter/material.dart';
import 'package:initium_task/organization_model.dart';

class Cell extends StatelessWidget {
  const Cell(this.organizationModel);

  @required
  final OrganizationModel organizationModel;

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
              Image.network(organizationModel.thumbnailUrl,
                  width: 70.0,
                  height: 70.0,
                  alignment: Alignment.center,
                  fit: BoxFit.cover),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  organizationModel.title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
