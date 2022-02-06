import 'package:flutter/material.dart';
import 'package:fluttertaskapp/core/constants/colors.dart';
import 'package:fluttertaskapp/core/constants/fonts.dart';
import 'package:fluttertaskapp/core/constants/image/image_constants.dart';
import 'package:fluttertaskapp/core/enum/string_enums.dart';
import 'package:fluttertaskapp/core/extension/context_extension.dart';
import 'package:fluttertaskapp/data/dummy.dart';
import 'package:fluttertaskapp/models/go_model.dart';
import 'package:fluttertaskapp/models/ride_model.dart';

class ModalView extends StatelessWidget {
  const ModalView({Key? key, required this.go}) : super(key: key);
  final GoModel go;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: _modalHeaderBar(context),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _headerSection(context),
              SizedBox(height: context.lowValue),
              _aboutSection(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buttonSection(),
    );
  }

  Container _headerSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(go.goInfoModel.title, style: normalTextStyle()),
                // Description
                Text(go.goInfoModel.subTitle,
                    style: lowTextStyle(color: greyColor)),
                Image.asset(ImageConstants.instance.carImage,
                    height: context.height * 0.22),
                SizedBox(height: context.lowValue),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _aboutSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _aboutRideTitle(),
          SizedBox(height: context.lowValue),
          _scrollListView(),
          SizedBox(height: context.lowValue),
          _aboutRideTexts(context),
        ],
      ),
    );
  }

  Widget _buttonSection() {
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

  AppBar _modalHeaderBar(BuildContext context) {
    return AppBar(
      elevation: 2,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      toolbarHeight: 70,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(25.0),
          topRight: const Radius.circular(25.0),
        ),
      ),
      centerTitle: false,
      title: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  color: const Color(0xffe5e5e5),
                ),
              ),
            ),
            SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      go.type == 1
                          ? GoEnum.ECONOM.rawValue
                          : GoEnum.COMFORT.rawValue,
                      style: normalTextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    if (go.goInfoModel.type == 1)
                      Row(
                        children: [
                          Text(
                            "High Demand",
                            style: normalTextStyle(
                              fontSize: 11,
                              color: orangeColor,
                            ),
                          ),
                          SizedBox(width: 3),
                          Icon(
                            Icons.info_outline,
                            size: 14,
                            color: greyColor,
                          ),
                        ],
                      )
                  ],
                ),
                Row(
                  children: [
                    if (go.goInfoModel.type == 1)
                      Image.asset(
                        ImageConstants.instance.lightning,
                        color: orangeColor,
                      ),
                    if (go.goInfoModel.type == 1) SizedBox(width: 7),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "1.99",
                            style: normalTextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          TextSpan(
                            text: '₼',
                            style: normalTextStyle(
                              fontFamily: "",
                              fontWeight: FontWeight.normal,
                              fontSize: 27,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding _aboutRideTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Text("About ride", style: normalTextStyle(fontSize: 20)),
    );
  }

  Padding _aboutRideTexts(BuildContext context) {
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

  SizedBox _scrollListView() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: rides.length,
        itemBuilder: (BuildContext context, int index) {
          return _item(ride: rides[index]);
        },
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

  Container _item({required RideModel ride}) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      width: 185,
      decoration: BoxDecoration(
        color: ride.color,
        borderRadius: BorderRadius.all(Radius.circular(14)),
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
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  ride.image,
                  height: 32,
                  width: 32,
                ),
                SizedBox(height: 7),
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
                    color: Color(0x80fdfeff),
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
