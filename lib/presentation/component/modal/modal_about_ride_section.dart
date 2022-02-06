import 'package:flutter/material.dart';
import 'package:fluttertaskapp/core/constants/colors.dart';
import 'package:fluttertaskapp/core/constants/fonts.dart';
import 'package:fluttertaskapp/core/extension/context_extension.dart';
import 'package:fluttertaskapp/models/go_model.dart';

class ModalAboutRideSection extends StatelessWidget {
  final GoModel go;
  const ModalAboutRideSection({Key? key, required this.go}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _rowText(
            title: "Fare",
            subTitle: go.price.toString(),
            color: Colors.black,
            priceFontSize: 17,
            fontSize: 15,
          ),
          _rowText(
            title: "Minimum fare",
            subTitle: go.goInfoModel.minimumFare.toString(),
          ),
          _rowText(
            title: "Base fare",
            subTitle: go.goInfoModel.baseFare.toString(),
          ),
          _rowText(
            title: "Distance",
            subTitle: go.goInfoModel.distance.toString(),
            thirdTitle: "/km",
          ),
          _rowText(
            title: "Time fare",
            subTitle: go.goInfoModel.timeFare.toString(),
            thirdTitle: "/min",
          ),
          SizedBox(height: 7),
          _rowText(
            title: "Paid waiting",
            subTitle: go.goInfoModel.paidWaiting.toString(),
            thirdTitle: "/min",
            fontSize: 15,
            priceFontSize: 17,
            color: Colors.black,
          ),
          SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Seats",
                    style: normalTextStyle(),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.person,
                    size: 16,
                  ),
                ],
              ),
              Text(
                "4",
                style: normalTextStyle(),
              ),
            ],
          ),
          SizedBox(height: context.lowValue),
          Text(
            "The price may vary in the case of: changes to your trip, stops added, tolls and excess waiting time. If the trip changes, the price will be based on rates provided.",
            style: normalTextStyle(
              fontSize: 12,
              color: greyColor,
            ),
          ),
        ],
      ),
    );
  }

  Row _rowText({
    required String title,
    required String subTitle,
    String thirdTitle = "",
    double fontSize = 13,
    double priceFontSize = 17,
    Color color = greyColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: lowTextStyle(
            color: color,
            fontSize: fontSize,
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: subTitle,
                style: lowTextStyle(
                  color: color,
                  fontSize: fontSize,
                ),
              ),
              TextSpan(
                text: '₼',
                style: normalTextStyle(
                  fontFamily: "",
                  color: color,
                  fontSize: priceFontSize,
                  fontWeight: FontWeight.normal,
                ),
              ),
              if (thirdTitle != "")
                TextSpan(
                  text: thirdTitle,
                  style: lowTextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
