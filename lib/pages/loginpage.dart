// import 'package:esewa_flutter_sdk/esewa_config.dart';
// import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
// import 'package:esewa_flutter_sdk/esewa_payment.dart';
// import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
// import 'package:flutter/material.dart';
// import 'package:lab1/static.dart';
//
//
// class loginPage extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//    return loginPageState();
//   }
//
// }
// class loginPageState extends State<loginPage>{
//
//   // void verifyTransactionStatus(EsewaPaymentSuccessResult result) async {
//   //   var response = await callVerificationApi(result);
//   //   if (response.statusCode == 200) {
//   //     var map = {'data': response.data};
//   //     final sucResponse = EsewaPaymentSuccessResponse.fromJson(map);
//   //     debugPrint("Response Code => ${sucResponse.data}");
//   //     if (sucResponse.data[0].transactionDetails.status == 'COMPLETE') {
//   //       //TODO Handle Txn Verification Success
//   //       return;
//   //     }
//   //     //TODO Handle Txn Verification Failure
//   //   } else {
//   //     //TODO Handle Txn Verification Failure
//   //   }
//   // }
//
//  esewapaymentcall(){
//    try {
//      EsewaFlutterSdk.initPayment(
//        esewaConfig: EsewaConfig(
//          environment: Environment.test,
//          clientId: StaticValue.CLIENT_ID,
//          secretId: StaticValue.SECRET_KEY,
//        ),
//        esewaPayment: EsewaPayment(
//          productId: "1d71jd81",
//          productName: "Product One",
//          productPrice: "20", callbackUrl: '',
//        ),
//        onPaymentSuccess: (EsewaPaymentSuccessResult data) {
//          debugPrint(":::SUCCESS::: => $data");
//
//          //success
//        //  verifyTransactionStatus(data);
//        },
//        onPaymentFailure: (data) {
//          debugPrint(":::FAILURE::: => $data");
//        },
//        onPaymentCancellation: (data) {
//          debugPrint(":::CANCELLATION::: => $data");
//        },
//      );
//    } on Exception catch (e) {
//      debugPrint("EXCEPTION : ${e.toString()}");
//    }
//
//  }
//
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Container(
//         width: size.width,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: size.width/1.8,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Icon(Icons.house,size: 30,color: Colors.blue,),
//                   Icon(Icons.arrow_back,color: Colors.black,size: 30,)
//                 ],
//               ),
//             ),
//             SizedBox(height: 15,),
//             Container(
//               height: size.height/3,
//               width: size.width/1.1,
//               decoration: BoxDecoration(
//                 color: Colors.green,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Column(
//                 children: [
//                   SizedBox(height: 15,),
//                   Text("Sign In",style: TextStyle(color: Colors.black,
//                       fontSize: 17,fontWeight: FontWeight.bold),),
//                   SizedBox(height: 15,),
//                   Container(
//                     height: 35,
//                     width: size.width/1.5,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15)
//                     ),
//                     child: Center(
//                       child: Text("Email",style: TextStyle(color:
//                       Colors.blueGrey,fontSize: 12),),
//                     ),
//                   ),
//                   SizedBox(height: 15,),
//                   Container(
//                     height: 35,
//                     width: size.width/1.5,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(15)
//                     ),
//                     child: Center(
//                       child: Text("Password",style: TextStyle(color:
//                       Colors.blueGrey,fontSize: 12),),
//                     ),
//                   ),
//                   SizedBox(height: 20,),
//                   GestureDetector(
//                     onTap: (){
//                       esewapaymentcall();
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(builder: (context) =>  dashboardPage()),
//                       // );
//                     },
//                     child: Container(
//                       height: 50,
//                       width: size.width/2,
//                       decoration: BoxDecoration(
//                           color: Colors.red,
//                           borderRadius: BorderRadius.circular(15)
//                       ),
//                       child: Center(
//                         child: Text("Signin",style: TextStyle(color:
//                         Colors.white,fontSize: 12),),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
// }