import 'package:flutter/material.dart';
//import 'search.dart';
import 'category01.dart';
import 'category02.dart';
import 'category03.dart';

class RecoveryRate extends StatefulWidget {
  final Widget child;
  RecoveryRate({Key key, this.child}) : super(key: key);
  @override
  _RecoveryRateState createState() => _RecoveryRateState();
}

class _RecoveryRateState extends State<RecoveryRate>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollViewController;
 
  @override

  
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text(
                'BATTERY',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color.fromARGB(0xFF, 0x33, 0x33, 0x33),
                ),
              ),
              /*actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  color: Color.fromARGB(0xFF, 0x00, 0x00, 0x99),
              ),
                  onPressed: () => showSearch(
                    context: context,
                    delegate: Search(),
                  ),
                ),
              ],*/
              pinned: true,
              floating: true,
              forceElevated: boxIsScrolled,
              bottom: TabBar(
                isScrollable: true,
                labelColor: Color.fromARGB(0xFF, 0x33, 0x33, 0x33),
                indicatorColor: Color.fromARGB(0xFF, 0x00, 0x00, 0x99),
                tabs: <Widget>[
                  Tab(text: '   일별   '),
                  Tab(text: '   월별   '),
                  Tab(text: '   년별   '),
                ],
                controller: _tabController,
              ),
            ),
          ];
        },
        body: TabBarView(
          children: <Widget>[
            Category01(),
            Category02(),
            Category03(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}