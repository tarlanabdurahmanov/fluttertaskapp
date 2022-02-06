import 'package:flutter/material.dart';
import 'package:fluttertaskapp/core/constants/fonts.dart';
import 'package:fluttertaskapp/data/dummy.dart';
import 'package:fluttertaskapp/models/ride_model.dart';

class ModalAboutScrollList extends StatelessWidget {
  const ModalAboutScrollList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        padding:const EdgeInsets.symmetric(horizontal: 20),
        physics:const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: rides.length,
        itemBuilder: (BuildContext context, int index) {
          return _item(ride: rides[index]);
        },
      ),
    );
  }

  Container _item({required RideModel ride}) {
    return Container(
      margin:const EdgeInsets.only(right: 8),
      width: 185,
      decoration: BoxDecoration(
        color: ride.color,
        borderRadius:const BorderRadius.all(Radius.circular(14)),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            right: -160,
            child: Image.asset(
              ride.backImage,
              fit: BoxFit.fitHeight,
              height: 144,
              color: Colors.black.withOpacity(0.05),
            ),
          ),
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  ride.image,
                  height: 32,
                  width: 32,
                ),
               const SizedBox(height: 7),
                Text(
                  ride.title,
                  style: normalTextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                // Description
                Text(
                  ride.subTitle,
                  style: lowTextStyle(
                    color:const Color(0x80fdfeff),
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
