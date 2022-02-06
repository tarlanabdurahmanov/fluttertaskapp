import 'package:flutter/material.dart';
import 'package:fluttertaskapp/core/constants/colors.dart';
import 'package:fluttertaskapp/core/constants/fonts.dart';
import 'package:fluttertaskapp/core/constants/image/image_constants.dart';
import 'package:fluttertaskapp/core/enum/string_enums.dart';
import 'package:fluttertaskapp/models/go_model.dart';

class ModalAppBarTitle extends StatelessWidget {
  final GoModel go;
  const ModalAppBarTitle({Key? key, required this.go}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
