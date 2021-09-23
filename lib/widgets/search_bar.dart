import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeved_design_round/providers/car_data.dart';
import 'package:treeved_design_round/screens/search_screen.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key, required this.screenSize}) : super(key: key);
  final Size screenSize;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CarData>(
      builder: (context, carData, child) =>
       Container(
        width: 0.95 * widget.screenSize.width,
        height: 0.08 * widget.screenSize.height,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            SizedBox(
              height: 0.08 * widget.screenSize.height,
              width: 0.3 * widget.screenSize.width,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FD),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: 0.6 * widget.screenSize.width,
                  child: Container(
                    margin: EdgeInsetsDirectional.fromSTEB(0.02 * widget.screenSize.width, 0, 0, 0),
                    child: DropdownButtonFormField(
                      iconSize: 0,
                      value: 'Rent',
                      decoration: InputDecoration(
                          suffixIcon:  Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: const Color(0xff5A6EFD),
                            size: 0.05 * widget.screenSize.height,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 0.018 * widget.screenSize.height,
                            color: Colors.grey,
                          ),
                          border: InputBorder.none),
                      items: <String>['Rent', 'Buy', 'Sell'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 0.6 * widget.screenSize.width,
              child: TextField(
               textInputAction: TextInputAction.search,
                onSubmitted: (value) {
                  print(value);
                  carData.getSearchAds(value);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>  SearchScreen(searchTerm: value,)));

                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Type city, neighbourhood or address",
                    hintStyle:
                        TextStyle(fontSize: 0.018 * widget.screenSize.height, color: Colors.grey)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
