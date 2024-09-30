import 'package:flutter/material.dart';
import 'package:lab1/pages/detailPage.dart';

class dashboardPage extends StatefulWidget {
  const dashboardPage({super.key});

  @override
  State<dashboardPage> createState() => dashboardPageState();
}

class dashboardPageState extends State<dashboardPage> {

  horizontalscollfunc(var size,var color){
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  const Detailpage()),
        );
      },
      child: Container(
        width: size.width/1.5,
        height: size.height/5,
        margin: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
            color: Color(color),
            borderRadius: BorderRadius.circular(20)
        ),
        child: Stack(
          children: [
            Container(
              height: size.height/5,
              width: size.width/1.5,
              child: ClipRRect(
              borderRadius: BorderRadius.circular(20),child:
              Image.network("https://paultan.org/image/2020/12/Volkswagen-China-production-630x399.jpg"
              ,fit: BoxFit.cover,)),
             //   Image.asset("images/bg.png",fit: BoxFit.cover,)),
            ),
            Positioned(
              bottom: 30,left: 15,
              child: Container(
                width: size.width/2,
                decoration: BoxDecoration(
                  color: Colors.black12
                ),
                child: Text("Dow Jones Futures: Meta, Apple, "
                    "Tesla Lead New Buys In Big Rally. Pay Attention "
                    "To This Key Shift"
                    ,style: TextStyle(color: Colors.white,
                      fontSize: 20,fontWeight: FontWeight.bold)
                  ,maxLines: 2,overflow: TextOverflow.ellipsis,),
              ),
            ),
            Positioned(
              bottom: 10,left: 15,
              child: Container(
                width: size.width/2,
                color: Colors.black12,
                child: Text("Sept 20, 2024"
                  ,style: TextStyle(color: Colors.white,
                      fontSize: 14,fontWeight: FontWeight.normal)
                  ,maxLines: 1,overflow: TextOverflow.ellipsis,),
              ),
            ),
            Positioned(
              right: 5,
              bottom: 5,
              child: Icon(Icons.play_circle,size: 30,
              color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }


  static verticalscollfunc(var size){
    return Container(
      width: size.width/1.1,
 //     height: size.height/5,
      margin: EdgeInsets.only(left: 5,top: 5,bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                width: 100,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),child:
                Image.network("https://paultan.org/image/2020/12/Volkswagen-China-production-630x399.jpg"
                  ,fit: BoxFit.cover,)),
                //   Image.asset("images/bg.png",fit: BoxFit.cover,)),
              ),
              Positioned(
                right: 5,
                bottom: 5,
                child: Icon(Icons.play_circle,size: 30,
                  color: Colors.white,),
              )
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width/2,

                child: Text("Dow Jones Futures: Meta, Apple, "
                    "Tesla Lead New Buys In Big Rally. Pay Attention "
                    "To This Key Shift"
                  ,style: TextStyle(color: Colors.black,
                      fontSize: 20,fontWeight: FontWeight.bold)
                  ,maxLines: 2,overflow: TextOverflow.ellipsis,),
              ),

              Container(
                width: size.width/2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red,
                      ),
                      padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                      child: Text("Xyz.com",style: TextStyle(
                          color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                    Text("20 Sept 2024",style: TextStyle(
                        color: Colors.black,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),


            ],
          )

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size.height/5,
            width: size.width/1,
            child: ListView.builder(
              itemCount: 20,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return horizontalscollfunc(size, 0xffffff5515);
              },
            ),
          ),
          Container(
            height: size.height/1.6,
            width: size.width/1,
            child: ListView.builder(
              itemCount: 20,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return verticalscollfunc(size);
              },
            ),
          ),

        ],
      ),
    );
  }
}
