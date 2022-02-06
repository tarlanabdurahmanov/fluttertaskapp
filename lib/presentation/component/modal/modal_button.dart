import 'package:flutter/material.dart';
import 'package:fluttertaskapp/core/constants/colors.dart';
import 'package:fluttertaskapp/core/constants/fonts.dart';
import 'package:fluttertaskapp/core/constants/image/image_constants.dart';
import 'package:fluttertaskapp/models/go_model.dart';

class ModalButton extends StatelessWidget {
  final GoModel go;
  const ModalButton({Key? key, required this.go}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(25.0),
            topRight: const Radius.circular(25.0),
          ),
          boxShadow: [
            BoxShadow(
                color: const Color(0x05000000),
                offset: Offset(-2, -2),
                blurRadius: 6,
                spreadRadius: 0),
            BoxShadow(
                color: const Color(0x08000000),
                offset: Offset(-2, -2),
                blurRadius: 4,
                spreadRadius: 0),
            BoxShadow(
                color: const Color(0x08000000),
                offset: Offset(-2, -2),
                blurRadius: 2,
                spreadRadius: 0)
          ],
          color: Colors.white,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: go.goInfoModel.type != 1 ? blueColor : orangeColor,
            padding: EdgeInsets.all(18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Text(
                "Confirm Econom",
                style: normalTextStyle(fontSize: 17, color: Colors.white),
              ),
              Image.asset(
                ImageConstants.instance.calendar,
                height: 24,
                width: 24,
              ),
            ],
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
