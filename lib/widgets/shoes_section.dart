import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sneaky/models/shoes.dart';
import 'package:flutter_sneaky/utils/my_theme.dart';
import 'package:flutter_sneaky/widgets/shoes_item.dart';


class ShoesSectionItem extends StatelessWidget {
  final ShoesSection section;

  const ShoesSectionItem({Key key, this.section}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildHeader(),
        buildList(),
      ],
    );
  }

  Container buildList() {
    return Container(
        height: 400,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: section.shoes.length,
            itemBuilder: getItem));
  }

  Padding buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            section.title,
            style: MyTheme.titleTextStyle,
          ),
          Row(
            children: <Widget>[
              Text(section.shoes.length.toString(),
                  style: MyTheme.counterTextStyle),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 12,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget getItem(BuildContext context, int index) {
    return new ShoesItem(shoes: section.shoes[index]);
  }
}
