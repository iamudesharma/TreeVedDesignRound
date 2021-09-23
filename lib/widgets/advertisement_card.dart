import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
class AdvertisementCard extends StatelessWidget {
  const AdvertisementCard({Key? key, this.imagePath, required this.screenSize, this.carName}) : super(key: key);
final imagePath;
final Size screenSize;
final carName;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Stack(
                children: [

                  //Image
                  Container(
                      width: 0.9 * screenSize.width,
                      height: 0.22 * screenSize.height,
                      child: Image.asset(imagePath, fit: BoxFit.cover,)),
                  Positioned(
                    top: 0.15 * screenSize.height,
                    child: Container(
                      decoration:  BoxDecoration(
                        color:
                        Colors.deepPurple.withOpacity(0.3),
                        /*const Color(0xff5F70F6).withOpacity(0.2),*/
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )
                      ),
                      height: 0.07 * screenSize.height,
                        width: 0.9 * screenSize.width,

                       )
                  ),

                  //Photo count badge
                  Positioned(
                      top: 0.175 * screenSize.height,
                      left: 0.03 * screenSize.width,
                      child: Container(
                        decoration:  BoxDecoration(
                            color:   const Color(0xff40479B).withOpacity(0.8),
                            borderRadius:  BorderRadius.circular(10)
                        ),
                        height: 0.032 * screenSize.height,
                        width: 0.15 * screenSize.width,
                        child:  Center(child: Text("1/34", textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 0.015 * screenSize.height,
                          color: Colors.white,
                          fontWeight:  FontWeight.w400
                        ),
                        )),

                      )
                  ),

                  //Price badge
                  Positioned(
                      top: 0.173 * screenSize.height,
                      left: 0.65 * screenSize.width,
                      child: Container(
                        decoration:  BoxDecoration(
                            color:   const Color(0xff596EFC),
                            borderRadius:  BorderRadius.circular(5)
                        ),
                        height: 0.035 * screenSize.height,
                        width: 0.22 * screenSize.width,
                        child:  Center(child: Text("\$340,000", textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 0.018 * screenSize.height,
                              color: Colors.white,
                              fontWeight:  FontWeight.w400
                          ),
                        )),

                      )
                  ),
                ],
              )),
        ),
        SizedBox(height: 0.015 * screenSize.height,),
        Row(
          children: [
            Container(
              height: 0.045 * screenSize.height,
              width: 0.2 * screenSize.width,
              margin: EdgeInsets.only(
                left: 0.05 * screenSize.width
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                elevation: 0,
                color: const Color(0xffEFF1F5),
                child: const Center(child: Text("On Sale" , style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color:   Colors.deepPurple
                ),)),
              ),
            ),
            Container(
              height: 0.045 * screenSize.height,
              width: 0.25 * screenSize.width,
              margin: EdgeInsets.only(
                  left: 0.01 * screenSize.width
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                elevation: 0,
                color: const Color(0xffEFF1F5),
                child: const Center(child: Text("Installment" , style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color:   Colors.deepPurple
                ),)),
              ),
            ),
            SizedBox(
              width: 0.35 * screenSize.width,
            ),
            Icon(Icons.favorite_border_sharp, size: 0.04 * screenSize.height,)

          ],
        ),
        SizedBox(height: 0.0 * screenSize.height,),
        Container(
          margin: EdgeInsets.only(
            left: 0.08 * screenSize.width
          ),
          child: Text(carName, style: TextStyle(
              fontSize: 0.028 * screenSize.height,
            fontWeight: FontWeight.w500,
            color: Color(0xff645D94)
          ),),
        ),
        SizedBox(height: 0.001 * screenSize.height,),
        Container(
          margin: EdgeInsets.only(
              left: 0.08 * screenSize.width
          ),
          child: Row(
            children: [
              Icon(Icons.location_on_outlined, size: 0.025 * screenSize.height,),
              SizedBox(width: 0.01 * screenSize.width,),
              Text("1901 Thornridge Cir. Shiloh Hawaii 81063",
               style: TextStyle(
                 fontSize: 0.02 * screenSize.height,
                 fontWeight: FontWeight.w400
               ),)
            ],
          ),
        ),
        SizedBox(height: 0.001 * screenSize.height,),
        const Divider(
          indent: 15,
          endIndent: 15,
          thickness: 0.5,
        ),

        Container(
          margin: EdgeInsets.only(
              left: 0.08 * screenSize.width
          ),
          child: Text("View Details", style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 0.02 * screenSize.height,
            color: Color(0xff939BDC)
          ),),
        ),
        SizedBox(height: 0.05 * screenSize.height,),

      ],
    );
  }
}
