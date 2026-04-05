import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'order.dart';
import 'profile.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {

  late List<Widget> pages;
  late Home homePage;
  late Orders orderPage;
  late Profile profilePage;
  int currentIndex = 0;

  @override
  void initState() {
    homePage = Home();
    orderPage = Orders();
    profilePage = Profile();
    pages = [homePage, orderPage, profilePage];// TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: Color(0xFFfd6f3e),
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index){
          setState(() {
            currentIndex = index;
          });
        },
        items: [
        Icon(
          Icons.home_outlined,
          color: Colors.white,
        ),
        Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white,
        ),
        Icon(
          Icons.person_outline,
          color: Colors.white,
        )
      ]),
      body: pages[currentIndex],
    );
  }
}