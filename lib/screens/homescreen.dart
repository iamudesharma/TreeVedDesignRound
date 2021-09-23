// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:treeved_design_round/screens/advertisement_list_view_builder.dart';
import 'package:treeved_design_round/widgets/curved_bottom_navigation_bar.dart';
import 'package:treeved_design_round/widgets/search_bar.dart';
import 'package:treeved_design_round/widgets/tab_text.dart';
import 'package:treeved_design_round/widgets/top_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FD),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBar(),
              SizedBox(
                height: 0.03 * screenSize.height,
              ),
              Container(
                margin: EdgeInsets.only(left: 0.03 * screenSize.width),
                width: 0.5 * screenSize.width,
                child: Text(
                  "Thousands of cars waiting for you",
                  style: TextStyle(fontSize: 0.028 * screenSize.height),
                ),
              ),
              SizedBox(
                height: 0.02 * screenSize.height,
              ),
              Center(
                child: SearchBar(
                  screenSize: screenSize,
                ),
              ),
              SizedBox(
                height: 0.02 * screenSize.height,
              ),
               Center(
                 child: Container(
                   decoration: BoxDecoration(
                       color:  Colors.white,
                       borderRadius: BorderRadius.circular(15)
                   ),
                   width: 0.85 * screenSize.width,
                   height: 0.06 * screenSize.height,
                   child: Container(
                     width: 0.8 * screenSize.width,
                     child: TabBar(
                       indicator: BoxDecoration(
                         borderRadius: BorderRadius.circular(
                           15.0,
                         ),
                         color: Color(0xff5A6EFD)
                       ),
                       controller: tabController,
                       unselectedLabelColor: Colors.black,
                       tabs: const [

                         Tab(text: "Buy"),
                         Tab(text: "Rent"),
                         Tab(text: "Sell"),


                       ],
                     ),
                   ),
                 ),
               ),
              SizedBox(
                height: 0.03* screenSize.height,
              ),
               Container(
                 height: 0.5 * screenSize.height,
                 child: Scaffold(
                  body: TabBarView(
                    controller: tabController,
                    children:  [
                      AdvertisementBuilder(screenSize: screenSize),
                      AdvertisementBuilder(screenSize: screenSize),
                      AdvertisementBuilder(screenSize: screenSize),

                    ],
                  ),

              ),
               )
            ],
          ),
        ),
        bottomNavigationBar: CurvedBottomNavigationBar(),
      ),
    );
  }
}
