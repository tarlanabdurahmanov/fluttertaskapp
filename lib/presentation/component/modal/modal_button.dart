import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../models/go_model.dart';

class ModalButton extends StatelessWidget {
  final GoModel go;
  const ModalButton({Key? key, required this.go}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
          boxShadow: [
            BoxShadow(
                color: Color(0x05000000),
                offset: Offset(-2, -2),
                blurRadius: 6,
                spreadRadius: 0),
            BoxShadow(
                color: Color(0x08000000),
                offset: Offset(-2, -2),
                blurRadius: 4,
                spreadRadius: 0),
            BoxShadow(
                color: Color(0x08000000),
                offset: Offset(-2, -2),
                blurRadius: 2,
                spreadRadius: 0)
          ],
          color: Colors.white,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: go.goInfoModel.type != 1 ? blueColor : orangeColor,
            padding: const EdgeInsets.all(18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
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
