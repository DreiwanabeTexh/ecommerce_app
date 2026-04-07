import 'package:ecommerce_app/widget/support_widget.dart';
import 'package:flutter/material.dart';

class Productdetail extends StatefulWidget {
  const Productdetail({super.key});

  @override
  State<Productdetail> createState() => _ProductdetailState();
}

class _ProductdetailState extends State<Productdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfef5f1),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [ GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(    
                  margin: EdgeInsets.only(left: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.black, width: 2)
                  ),    
                  child: 
                  Icon
                  (Icons.arrow_back_ios_new_outlined, color: Colors.white, size: 20,),),
              ),
              Center(
              child: Image.asset(
                "images/headphone2.png", 
                height: 400,),
                ), 
          ]), 
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 25, right: 25, top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Headphone", style: AppWidget.boldTextFieldStyle(),),
                      Text("₱699.00", style: TextStyle(color: Color(0xFFfd6f3e), fontSize: 23, fontWeight: FontWeight.bold),)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text("Details", style: AppWidget.normalTextBoldStyle(),),
                  SizedBox(height: 10,),
                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit auctor dui, sed efficitur enim efficitur in. Donec suscipit auctor dui, sed efficitur enim efficitur in.", style: TextStyle(fontSize: 18),),
                  SizedBox(height: 50,),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFFfd6f3e),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text("Buy Now", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    )
                  )
                ],
              ),
              
            ),
          )
          ],
          
        ),
      ),
    );
  }
}