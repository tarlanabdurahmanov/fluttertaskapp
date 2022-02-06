import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/enum/string_enums.dart';
import '../../../models/go_model.dart';

class ModalAppBarTitle extends StatelessWidget {
  final GoModel go;
  const ModalAppBarTitle({Key? key, required this.go}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
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
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(2)),
                color: Color(0xffe5e5e5),
              ),
            ),
          ),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    go.type == 1
                        ? GoEnum.econom.rawValue
                        : GoEnum.comfort.rawValue,
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
                        const SizedBox(width: 3),
                        const Icon(
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
                  if (go.goInfoModel.type == 1) const SizedBox(width: 7),
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
    );
  }
}
