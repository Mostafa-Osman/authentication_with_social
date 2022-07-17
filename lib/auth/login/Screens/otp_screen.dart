// import 'package:authentication/auth/widgets/otp_field.dart';
// import 'package:authentication/shared/components/customButton/CustomButton.dart';
// import 'package:flutter/material.dart';
//
// class OtpScreen extends StatelessWidget {
//   const OtpScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 26,
//               ),
//               CircleAvatar(
//                 radius: 55,
//                 backgroundColor: Colors.blueGrey[200],
//                 child: const Icon(
//                   Icons.check,
//                   size: 50,
//                   color: Colors.green,
//                 ),
//               ),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               const Text(
//                 'code sent successfully',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 18.0, color: Colors.green),
//               ),
//               const SizedBox(
//                 height: 26,
//               ),
//               const OTPField(),
//               const SizedBox(
//                 height: 20,
//               ),
//               CustomButton(
//                 tittle: 'done',
//                 textColor: Colors.white,
//                 height: 40,
//                 onPress: () => {},
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
