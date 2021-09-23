import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeved_design_round/providers/car_data.dart';
import 'package:treeved_design_round/widgets/advertisement_card.dart';

class AdvertisementBuilder extends StatelessWidget {
  const AdvertisementBuilder({Key? key, required this.screenSize}) : super(key: key);
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Consumer<CarData>(
        builder: (context, carData, child) => ListView.builder(
            itemCount: carData.carName.length,
            itemBuilder: (context, i) => AdvertisementCard(
                  screenSize: screenSize,
                  imagePath: carData.carImagePath[i],
                  carName: carData.carName[i],
                )));
  }
}
