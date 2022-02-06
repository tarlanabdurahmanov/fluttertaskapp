// import 'package:flutter/material.dart';
// import 'package:fluttersmartpay/core/constants/colors.dart';

// class CustomTextField extends StatelessWidget {
//   final TextEditingController? controller;
//   final String hintText;
//   final TextInputType? keyboardType;
//   final bool obscureText;
//   final Widget? suffixIcon;
//   final Widget? prefixIcon;

//   const CustomTextField({
//     Key? key,
//     required this.hintText,
//     this.keyboardType,
//     this.obscureText = false,
//     this.controller,
//     this.suffixIcon,
//     this.prefixIcon,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       style: TextStyle(color: primaryColor, fontWeight: FontWeight.w600),
//       keyboardType: keyboardType,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         fillColor: surfaceColor,
//         hintText: hintText,
//         hintStyle: TextStyle(color: Colors.grey.shade400),
//         filled: true,
//         suffixIcon: suffixIcon,
//         prefixIcon: prefixIcon,
//         border: OutlineInputBorder(
//           borderSide: BorderSide(
//             width: 0,
//             color: Colors.transparent,
//           ),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             width: 0,
//             color: Colors.transparent,
//           ),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: secondaryPrimaryColor,
//           ),
//           borderRadius: BorderRadius.circular(15),
//         ),
//       ),
//     );
//   }
// }
