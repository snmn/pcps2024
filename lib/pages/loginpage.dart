import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'dashboardpage.dart';

class loginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return loginPageState();
  }

}
class loginPageState extends State<loginPage>{
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.width/1.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.house,size: 30,color: Colors.blue,),
                  Icon(Icons.arrow_back,color: Colors.black,size: 30,)
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              height: size.height/3,
              width: size.width/1.1,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  Text("Sign In",style: TextStyle(color: Colors.black,
                      fontSize: 17,fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,),
                  Container(
                    height: 35,
                    width: size.width/1.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Center(
                      child: Text("Email",style: TextStyle(color:
                      Colors.blueGrey,fontSize: 12),),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 35,
                    width: size.width/1.5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Center(
                      child: Text("Password",style: TextStyle(color:
                      Colors.blueGrey,fontSize: 12),),
                    ),
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  dashboardPage()),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: size.width/2,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(
                        child: Text("Signin",style: TextStyle(color:
                        Colors.white,fontSize: 12),),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}