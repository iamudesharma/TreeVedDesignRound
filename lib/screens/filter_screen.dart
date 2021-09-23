import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeved_design_round/providers/car_data.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> with SingleTickerProviderStateMixin {
  @override
  late TabController tabController;
  List<String> tags = [
    "SUV",
    "Hatchback",
    "Plug-In Hybrids",
    "Hybrid",
    "Pick Up",
    "Van",
  ];
  List<String> radioList = [
    "Sort by A-Z",
    "Sort by Default",
  ];

  double max = 50000.0;
  int tappedIndex = -1;
  int currentRadioVal = 0;

  setSelectedRadioTile(int val) {
    setState(() {
      currentRadioVal = val;
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Consumer<CarData>(
          builder: (context, carData, child) => Scaffold(
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 0.02 * screenSize.height,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 0.025 * screenSize.width,
                          right: 0.025 * screenSize.width,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              borderRadius: BorderRadius.circular(200),
                              child: Icon(Icons.clear),
                            ),
                            Text(
                              "Filters",
                              style: TextStyle(
                                fontSize: 0.025 * screenSize.height,
                                color: Color(0xff645D94),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Reset",
                              style: TextStyle(
                                fontSize: 0.022 * screenSize.height,
                                color: Color(0xff7783C2),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.03 * screenSize.height,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 0.015 * screenSize.height),
                          child: Text(
                            "Preferred Model",
                            style: TextStyle(
                              fontSize: 0.025 * screenSize.height,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      Container(
                        margin: EdgeInsets.only(left: 0.015 * screenSize.height),
                        height: 0.1 * screenSize.height,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: carData.carLogos.length,
                            itemBuilder: (context, i) => Row(
                                  children: [
                                    Container(
                                        height: 0.08 * screenSize.height,
                                        width: 0.18 * screenSize.width,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset.zero,
                                                blurRadius: 5,
                                                color: Colors.grey.shade300,
                                                spreadRadius: 1)
                                          ],
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(50),
                                            child: Image.asset(
                                              carData.carLogos[i],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 0.05 * screenSize.width,
                                    )
                                  ],
                                )),
                      ),
                      SizedBox(
                        height: 0.03 * screenSize.height,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 0.015 * screenSize.height),
                          child: Text(
                            "Vehicle Type",
                            style: TextStyle(
                              fontSize: 0.025 * screenSize.height,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      Container(
                        margin: EdgeInsets.only(left: 0.015 * screenSize.height),
                        height: 0.08 * screenSize.height,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: tags.length,
                            itemBuilder: (context, i) => InkWell(
                                  borderRadius: BorderRadius.circular(8),
                                  onTap: () {
                                    setState(() {
                                      tappedIndex = i;
                                      print(tappedIndex);
                                    });
                                  },
                                  child: Center(
                                    child: Container(
                                      height: 0.055 * screenSize.height,
                                      width: 0.25 * screenSize.width,
                                      child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8),
                                              side: BorderSide(
                                                  color: tappedIndex == i
                                                      ? Color(0xff5A6EFD)
                                                      : Colors.grey)),
                                          elevation: 0,
                                          child: Center(
                                              child: Text(
                                            tags[i],
                                            style: TextStyle(
                                                color: tappedIndex == i
                                                    ? Color(0xff5A6EFD)
                                                    : Colors.grey),
                                            textAlign: TextAlign.center,
                                          ))),
                                    ),
                                  ),
                                )),
                      ),
                      SizedBox(
                        height: 0.03 * screenSize.height,
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              left: 0.015 * screenSize.height, right: 0.015 * screenSize.height),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Price Range",
                                style: TextStyle(
                                  fontSize: 0.025 * screenSize.height,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "\$0  - \$${max.round().toString()}",
                                style: TextStyle(
                                  fontSize: 0.022 * screenSize.height,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 0.03 * screenSize.height,
                      ),
                      Slider(
                        activeColor: Color(0xff5A6EFD),
                        inactiveColor: Color(0xff5A6EFD).withOpacity(0.2),
                        min: 0,
                        max: 1000000,
                        value: max,
                        onChanged: (double value) {
                          setState(() {
                            max = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 0.04 * screenSize.height,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 0.015 * screenSize.height),
                          child: Text(
                            "Number of Seats",
                            style: TextStyle(
                              fontSize: 0.025 * screenSize.height,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      SizedBox(
                        height: 0.02 * screenSize.height,
                      ),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFF8F9FD), borderRadius: BorderRadius.circular(15)),
                          width: 0.85 * screenSize.width,
                          height: 0.06 * screenSize.height,
                          child: Container(
                            width: 0.8 * screenSize.width,
                            child: TabBar(
                              indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    6.0,
                                  ),
                                  color: Color(0xff5A6EFD)),
                              controller: tabController,
                              unselectedLabelColor: Colors.black,
                              tabs: const [
                                Tab(text: "Any"),
                                Tab(text: "1"),
                                Tab(text: "2"),
                                Tab(text: "3"),
                                Tab(text: "4+"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.05 * screenSize.height,
                      ),
                      Container(
                        height: 0.12* screenSize.height,
                        child: ListView.builder(
                            itemCount: 2,
                            itemBuilder: (context, i) => RadioListTile(
                              activeColor: Color(0xff5A6EFD),

                                  groupValue: currentRadioVal,
                                  title: Text(radioList[i]),
                                  onChanged: (val) {
                                    print(val);
                                   setSelectedRadioTile(val as int);
                                  },
                                  value: i,
                                )),
                      ),
                      SizedBox(
                        height: 0.05 * screenSize.height,
                      ),
                      Center(
                        child: Container(
                          height: 0.06 * screenSize.height,
                          width: 0.9 * screenSize.width,
                          child: MaterialButton(onPressed: () { 
                            Navigator.pop(context);
                          },
                            color: Color(0xff5A6EFD),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Text("Set Filters", style: TextStyle(
                              fontSize: 0.02 * screenSize.height,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                            ),),

                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
    );
  }
}
