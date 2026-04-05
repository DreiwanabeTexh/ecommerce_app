import 'package:ecommerce_app/widget/support_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


List categories = [
  "images/headphone_icon.png",
  "images/laptop.png",
  "images/TV.png",
  "images/watch.png",
];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hey, Karl', style: AppWidget.boldTextFieldStyle()
                    ),
                    Text('Good Morning', style: AppWidget.normalTextFieldStyle(),),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('images/pickongpogi.jpg', width: 70, height: 70, fit: BoxFit.cover,))
              ],
            ),
            SizedBox(height: 30,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              width: MediaQuery.of( context).size.width,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search for products",
                  hintStyle: AppWidget.normalTextFieldStyle(),
                  prefixIcon: Icon(Icons.search, color: Colors.black,),
                ),
              )),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Categories', style: AppWidget.normalTextBoldStyle(),),
                  Text('See all', style: AppWidget.normalTextStyleOrange(),)
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Container(
                    height: 130,
                    margin: EdgeInsets.only(right: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFFfd6f3e),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("All", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),)),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 130,
                      child: ListView.builder(
                        itemCount: categories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Category(image: categories[index]);
                      }),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("All Products", style: AppWidget.normalTextBoldStyle(),),
                  Text("See ll", style: AppWidget.normalTextStyleOrange(),)
                ],
              ),
              SizedBox(height: 20,),
              Container(
                height: 240,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection:  Axis.horizontal,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('images/headphone2.png', height: 150, width: 150, fit: BoxFit.cover,),
                          Text("Headphone", style: AppWidget.normalTextBoldStyle(),),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("₱650.00", style: TextStyle(color: Color(0xFFfd6f3e), fontSize: 20, fontWeight: FontWeight.bold),),
                              SizedBox(width: 35,),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Color(0xFFfd6f3e),
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: Icon(Icons.add, color: Colors.white),)
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('images/watch2.png', height: 150, width: 150, fit: BoxFit.cover,),
                          Text("Tecno: Smart Watch", style: AppWidget.normalTextBoldStyle(),),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("₱1299.00", style: TextStyle(color: Color(0xFFfd6f3e), fontSize: 20, fontWeight: FontWeight.bold),),
                              SizedBox(width: 35,),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Color(0xFFfd6f3e),
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: Icon(Icons.add, color: Colors.white),)
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('images/laptop2.png', height: 150, width: 150, fit: BoxFit.cover,),
                          Text("Acer Aspire 3", style: AppWidget.normalTextBoldStyle(),),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("₱29999.00", style: TextStyle(color: Color(0xFFfd6f3e), fontSize: 20, fontWeight: FontWeight.bold),),
                              SizedBox(width: 35,),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Color(0xFFfd6f3e),
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: Icon(Icons.add, color: Colors.white),)
                            ],
                          )

                        ],
                      ),
                    )
                  ],
                ),
              ), 
          ],
        ),
      ),
      
    );
  }
}

class Category extends StatelessWidget {
  final String image;
  const Category({super.key, required this.image});

  @override
  
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 90,
      width: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            image, 
            height: 50, 
            width: 50, 
            fit: BoxFit.cover,),
            Icon(Icons.arrow_forward)
        ],
      ),
    );
  }
}
