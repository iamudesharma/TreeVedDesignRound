import 'package:flutter/cupertino.dart';
import 'package:treeved_design_round/models/advertisement.dart';

class CarData extends ChangeNotifier {
  Advertisement advertisement = Advertisement();
  List<Advertisement> searchResults = [];
  List<String> carImagePath = [
    "assets/images/car (1).jpg",
    "assets/images/car (2).jpg",
    "assets/images/car (3).jpg",
    "assets/images/car (4).jpg",
    "assets/images/car (5).jpg",
    "assets/images/car (6).jpg",
    "assets/images/car (7).jpg",
  ];

  List<String> carName = [
    "Tesla Model S",
    "Tesla Model 3",
    "Tesla Model X",
    "Tesla Model Y",
    "Car Five",
    "Car Six",
    "Car Seven",
  ];

  List<String> carLogos = [
    "assets/images/logo (1).png",
    "assets/images/logo (2).png",
    "assets/images/logo (3).png",
    "assets/images/logo (4).jpg",
    "assets/images/logo (5).png",
  ];

  void getSearchAds(String searchTerm) {
    searchResults.clear();
    notifyListeners();




    for(int i = 0; i< carName.length; i++)
      {
        if(carName[i].replaceAll(" ", "").toLowerCase().contains(searchTerm.toLowerCase()))
          {

            final Advertisement tempAd = Advertisement();
            tempAd.name = carName[i];
            tempAd.image = carImagePath[i];
            searchResults.add(tempAd);
            print("THE MATCHING INDEX IS $i");
            notifyListeners();

          } else {
          print("No match");
        }
        print(carName[i]);
      }
    print("THE LENGTH OF THE SEARCH ARRAY IS ${searchResults.length}");
  }
}