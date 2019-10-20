import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sneaky/models/shoes.dart';
import 'package:flutter_sneaky/utils/my_theme.dart';
import 'package:flutter_sneaky/widgets/shoes_section.dart';

class ShoesPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShoesPageState();
  }
}

class ShoesPageState extends State<ShoesPage>{
  final ScrollController _scrollController = ScrollController();

  final List<ShoesSection> shoesItems = [
    ShoesSection.generate(),
    ShoesSection.generate(),
    ShoesSection.generate(),
    ShoesSection.generate()
  ];

  @override
  void initState() {
    _scrollController.addListener(listener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  var marginMenu = MyTheme.MAX_MARGIN;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              controller: _scrollController,
              slivers: <Widget>[
                buildSliverAppBar(),
                SliverList(
                  delegate: SliverChildListDelegate([
                    buildSection(0),
                    buildSection(1),
                    buildSection(2),
                    buildSection(3)
                  ]),
                )
              ],
            ),
            buildItemMenuLeft(),
            buildItemMenuRightBottom(),
            buildItemMenuRightTop()
          ],
        ));
  }

  AnimatedPositioned buildItemMenuRightTop() {
    return AnimatedPositioned(
      curve: Curves.decelerate,
      duration: Duration(milliseconds: 500),
      right: marginMenu,
      bottom: 120,
      child: Container(
        child: Center(
          child: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(51, 0, 0, 0),
              offset: Offset(0, 0),
              blurRadius: 20,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        width: 50,
        height: 50,
      ),
    );
  }

  AnimatedPositioned buildItemMenuRightBottom() {
    return AnimatedPositioned(
      curve: Curves.decelerate,
      duration: Duration(milliseconds: 500),
      right: marginMenu,
      bottom: 50,
      child: Container(
        child: Center(
          child: Text(
            "ME\nNU",
            style: MyTheme.menuTextStyle,
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(51, 0, 0, 0),
              offset: Offset(0, 0),
              blurRadius: 20,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        width: 50,
        height: 50,
      ),
    );
  }

  AnimatedPositioned buildItemMenuLeft() {
    return AnimatedPositioned(
      curve: Curves.decelerate,
      duration: Duration(milliseconds: 500),
      left: marginMenu,
      bottom: 50,
      child: Container(
        child: Center(
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(51, 0, 0, 0),
              offset: Offset(0, 0),
              blurRadius: 20,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        width: 50,
        height: 50,
      ),
    );
  }

  Container buildSection(int index) {
    return Container(
        child: ShoesSectionItem(
          section: shoesItems[index],
        ));
  }

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 12,
      title: Text(
        "Sneaky Men",
        style: MyTheme.titleAppBarTextStyle,
      ),
      floating: true,
    );
  }

  void listener() {
    final bool goTop = _scrollController.position.userScrollDirection ==
        ScrollDirection.forward &&
        !_scrollController.position.outOfRange &&
        marginMenu == MyTheme.MIN_MARGIN;

    final bool goBottom = _scrollController.position.userScrollDirection ==
        ScrollDirection.reverse &&
        !_scrollController.position.outOfRange &&
        marginMenu == MyTheme.MAX_MARGIN;

    if (goBottom) {
      setState(() {
        marginMenu = MyTheme.MIN_MARGIN;
      });
    } else if (goTop) {
      setState(() {
        marginMenu = MyTheme.MAX_MARGIN;
      });
    }
  }
}