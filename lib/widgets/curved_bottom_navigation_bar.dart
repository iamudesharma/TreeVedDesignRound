import 'package:flutter/material.dart';

class CurvedBottomNavigationBar extends StatelessWidget {
  const CurvedBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 0.09 * screenSize.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            Color(0xff5F70F6),
            Color(0xffA7A6E9)

          ]),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 5),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.white70,
            selectedItemColor: Colors.white,
            backgroundColor: Color(0xff5F70F6),
            items:  <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, size: 0.04 * screenSize.height,), title: Text('Explore')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline, size: 0.03 * screenSize.height,), title: Text('Favourites')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message_outlined, size: 0.03 * screenSize.height,), title: Text('Message')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline, size: 0.035 * screenSize.height,), title: Text('Profile')),
            ],
          ),
        )
    );
  }
}
