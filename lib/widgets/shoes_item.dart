import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sneaky/models/shoes.dart';
import 'package:flutter_sneaky/utils/my_theme.dart';

class ShoesItem extends StatelessWidget {
  final Shoes shoes;

  const ShoesItem({Key key, this.shoes}) : super(key: key);

  List<Widget> createColorsList() {
    List<Widget> list = new List();
    shoes.colors.forEach((Color color) => {
          list.add(Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                )),
          ))
        });

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      height: 350,
      width: 300,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 242, 242, 242),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(51, 0, 0, 0),
            offset: Offset(0, 0),
            blurRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: SizedBox(
        height: 600,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 44,
              left: 30,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildHeader(),
                  SizedBox(
                    height: 40,
                  ),
                  buildPrice(),
                  buildDescription(),
                  SizedBox(
                    height: 20,
                  ),
                  buildColors()
                ],
              ),
            ),
            buildAddButton()
          ],
        ),
      ),
    );
  }

  Positioned buildAddButton() {
    return Positioned(
      bottom: 20,
      right: 20,
      child: Container(
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }

  Row buildColors() {
    return Row(
      children: createColorsList(),
    );
  }

  Text buildDescription() {
    return Text(
      shoes.description,
      style: MyTheme.descriptionTextStyle,
    );
  }

  Text buildPrice() {
    return Text(
      "\$${shoes.price.toString()}",
      style: MyTheme.priceTextStyle,
    );
  }

  Align buildHeader() {
    return Align(
        alignment: Alignment.center,
        child: Image.asset(
          shoes.images[0],
          height: 150,
        ));
  }
}
