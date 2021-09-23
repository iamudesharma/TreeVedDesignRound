import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeved_design_round/providers/car_data.dart';
import 'package:treeved_design_round/screens/search_results.dart';

import 'filter_screen.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key, required this.searchTerm}) : super(key: key);
  final String searchTerm;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>  with SingleTickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FD),
        body: Consumer<CarData>(
          builder: (context, carData, child) =>
           Column(
            children: [
              SizedBox(height: 0.05 * screenSize.height,),
              Center(
                child: Container(
                  width: 0.95 * screenSize.width,
                  height: 0.08 * screenSize.height,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 0.025 * screenSize.width
                        ),
                        child: IconButton(icon: (Icon(Icons.arrow_back, size: 0.04 * screenSize.height,)),
                        onPressed: (){
                          Navigator.pop(context);
                        },),
                      ),

                      Container(
                        width: 0.6 * screenSize.width,
                        child: TextFormField(
                          initialValue: widget.searchTerm,
                          textInputAction: TextInputAction.search,
                          onFieldSubmitted: (value) {
                            carData.getSearchAds(value);
                          },


                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search",
                              hintStyle:
                              TextStyle(fontSize: 0.018 * screenSize.height, color: Colors.grey)),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
              SizedBox(height: 0.03 * screenSize.height,),
              Container(
                margin: EdgeInsets.only(
                    left: 0.05 * screenSize.width,
                    right: 0.05 * screenSize.width
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Showing Result", style: TextStyle(
                          fontSize: 0.022 * screenSize.height,
                          color: Color(0xff645D94),
                          fontWeight: FontWeight.w500,
                        ),),
                        Text("${carData.searchResults.length} Matches found", style: TextStyle(
                          color: Colors.grey,
                          fontSize: 0.016 * screenSize.height
                        ),)
                      ],
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FilterScreen()));
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 0.05 * screenSize.height,
                        width: 0.25 * screenSize.width,
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Color(0xff7783C2),

                            )
                          ),

                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.filter_list_outlined, color: Color(0xff7783C2),),
                                Text("Filters", style: TextStyle(
                                  fontSize: 0.02 * screenSize.height,
                                  color: Color(0xff7783C2)
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 0.05 * screenSize.height,),


              //Start of tabs
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color:  Colors.white,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  width: 0.85 * screenSize.width,
                  height: 0.05 * screenSize.height,
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
                        Tab(text: "For Sale"),
                        Tab(text: "For Rent"),

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 0.03* screenSize.height,
              ),
              Expanded(

                child: Scaffold(
                  body: TabBarView(
                    controller: tabController,
                    children:  [
                      SearchResults(screenSize: screenSize),
                      SearchResults(screenSize: screenSize),


                    ],
                  ),

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
