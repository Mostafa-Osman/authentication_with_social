// import 'package:flutter/material.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
//
// class OTPField extends StatelessWidget {
//   const OTPField({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  PinCodeTextField(
//         length: 6,
//         animationType: AnimationType.fade,
//         keyboardType: TextInputType.number,
//         pinTheme: PinTheme(
//           shape: PinCodeFieldShape.box,
//           borderRadius: BorderRadius.circular(5),
//           fieldHeight: 50,
//           fieldWidth: 40,
//           selectedFillColor: Colors.transparent,
//           activeFillColor: Colors.white,
//           selectedColor: Theme.of(context).primaryColor,
//           inactiveColor: Theme.of(context).primaryColor.withOpacity(.8),
//           activeColor: Colors.transparent,
//           inactiveFillColor: Colors.transparent,
//         ),
//         animationDuration: const Duration(milliseconds: 300),
//         backgroundColor: Colors.transparent,
//         enableActiveFill: true,
//         onCompleted: (v) => {},
//         onChanged: (value) {},
//         beforeTextPaste: (text) => true,
//         appContext: context,
//
//     );
//   }
// }
