import 'package:flutter/material.dart';

class Dashboardpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return DashboardpageState();
  }
}
class DashboardpageState extends State<Dashboardpage>{

  horizontalscrollitem(var size, int color){
    return Stack(
      children: [
        Container(
          height: size.height/5,
          width: size.width/1.5,
          decoration: BoxDecoration(
            color: Color(color),
            borderRadius: BorderRadius.circular(15),

          ),
        ),

        Positioned(
          bottom: 30,
          left: 15,
          child: Container(
            width: size.width/2,
            child: Text("Todays news updates sept 2024",
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
            fontSize: 28,),overflow: TextOverflow.ellipsis,maxLines: 2,),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 15,
          child: Container(
            width: size.width/2,
            child: Text("23rd Sept 2024",
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,
                fontSize: 15,),overflow: TextOverflow.ellipsis,maxLines: 1,),
          ),
        ),
      ],
    );
  }

  verticalitem(var size, int color){
    return Container(
      height: size.height/5,
      width: size.width/1.2,
      margin: EdgeInsets.only(left: 2),
      decoration: BoxDecoration(
        color: Color(color),
        borderRadius: BorderRadius.circular(15),

      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  horizontalscrollitem(size, 0xffff55555),
                  SizedBox(width: 10,),
                  horizontalscrollitem(size, 0xfff333555),
                  SizedBox(width: 10,),
                  horizontalscrollitem(size, 0xff222f555),
                  SizedBox(width: 10,),
                  horizontalscrollitem(size, 0xffffff555),
                  SizedBox(width: 10,),
                  horizontalscrollitem(size, 0xffffff555),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: size.height/1.5,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    verticalitem(size, 0xffff55555),
                    SizedBox(height: 10,),
                    verticalitem(size, 0xfff333555),
                    SizedBox(height: 10,),
                    verticalitem(size, 0xff222f555),
                    SizedBox(height: 10,),
                    verticalitem(size, 0xffffff555),
                    SizedBox(height: 10,),
                    verticalitem(size, 0xffffff555),
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